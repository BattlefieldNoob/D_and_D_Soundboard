import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Event {}

class PlayBackEvent extends Event {
  var type;
  var name;

  PlayBackEvent(this.type, this.name);
}

class PlayEvent extends PlayBackEvent {
  PlayEvent(type, name) : super(type, name);
}

class StopEvent extends PlayBackEvent {
  StopEvent() : super("ambience", "none");
}

class GetAssetsEvent extends Event {
  GetAssetsEvent();
}

class AssetsState {
  var sfx = [];
  var ambiences = [];
  var ambienceInPlayIndex = -1;

  static copyFrom(AssetsState state) {
    return AssetsState()
      ..ambienceInPlayIndex = state.ambienceInPlayIndex
      ..ambiences = state.ambiences
      ..sfx = state.sfx;
  }
}

class EmptyState extends AssetsState {}

class ReadyState extends AssetsState {}

class AssetsBloc extends Bloc<Event, AssetsState> {
  AssetsState current;

  @override
  AssetsState get initialState => EmptyState();

  @override
  Stream<AssetsState> mapEventToState(Event event) async* {
    var sp = await SharedPreferences.getInstance();
    var ip = sp.getString("IP");
    if (ip == null)
      yield EmptyState();
    else {
      print(event);
      if (event is PlayEvent) {
        var ambienceInPlay = current.ambiences.indexOf(event.name);
        if (current.ambienceInPlayIndex == ambienceInPlay) {
          yield current;
        } else {
          print("play" + event.name);
          await http.post("http://$ip:8080/play",
              body: {"type": event.type, "name": event.name});

          current.ambienceInPlayIndex = ambienceInPlay;
          current = AssetsState.copyFrom(current);
          yield current;
        }
      } else if (event is StopEvent) {
        if (current.ambienceInPlayIndex == -1)
          yield current;
        else {
          await http.post("http://$ip:8080/play",
              body: {"type": event.type, "name": "none"});
          current.ambienceInPlayIndex = -1;

          current = AssetsState.copyFrom(current);
          yield current;
        }
      } else if (event is GetAssetsEvent) {
        print(event);
        try {
          var ambiences = http
              .get("http://$ip:8080/ambiences")
              .then((res) => {"ambiences": jsonDecode(res.body)});
          var sfx = http
              .get("http://$ip:8080/sfx")
              .then((res) => {"sfx": jsonDecode(res.body)});
          var response = await Future.wait([ambiences, sfx]);
          current = ReadyState()
            ..sfx = response[1]["sfx"] as List<dynamic>
            ..ambiences = response[0]["ambiences"] as List<dynamic>;
          yield current;
        } catch (e) {
          print(e);
        }
      } else
        yield EmptyState();
    }
  }
}
