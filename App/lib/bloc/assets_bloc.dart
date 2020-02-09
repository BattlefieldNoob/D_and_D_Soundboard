import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_event.dart';
import 'app_state.dart';

enum AudioType { SFX, Ambience }

class AssetsBloc extends Bloc<AppEvent, AppState> {
  final assetsTopic = "d&dSoundboard/assets";
  final getAssetsTopic = 'd&dSoundboard/getAssets';
  final playbackTopic = 'd&dSoundboard/playback';

  MqttClient client;

  AssetsBloc() {
    initState();
  }

  void initState() async {
    var sp = await SharedPreferences.getInstance();
    var ip = sp.getString("IP");
    if (ip != null) add(AppEvent.setIP(ip));
  }

  Future initMQTT() async {
    try {
      client.port = 1883;
      client.logging(on: true);
      client.keepAlivePeriod = 30;

      final MqttConnectMessage connMess = MqttConnectMessage()
          .withClientIdentifier('D&D')
          .startClean() // Non persistent session for testing
          .keepAliveFor(30)
          .withWillQos(MqttQos.atMostOnce);

      client.connectionMessage = connMess;
      var status = await client.connect();
      print(status);
      client.subscribe(assetsTopic, MqttQos.atLeastOnce);
      client.published.listen((data) {
        print(String.fromCharCodes(data.payload.message));
      });
      client.published
          .where((mess) => mess.variableHeader.topicName == assetsTopic)
          .map((mess) => jsonDecode(String.fromCharCodes(mess.payload.message)))
          .listen((data) =>
              add(AppEvent.updateAsset(data["sfx"], data["ambiences"])));
      add(AppEvent.getAsset());
    } catch (e) {
      print(e);
    }
  }

  @override
  AppState get initialState => AppState.empty();

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    AppState current = state;

    if (current is Connecting) {
      if (event is Get) {
        sendToServer(getAssetsTopic, {});
        yield current;
      } else if (event is Update) {
        yield AppState.ready(
            ip: current.ip,
            ambienceInPlayIndex: -1,
            sfx: event.sfx,
            ambiences: event.ambiences);
      }
    }

    if (current is Ready) {
      if (event is Get) {
        sendToServer(getAssetsTopic, {});
        yield current;
      } else if (event is Update) {
        yield AppState.ready(
            ip: current.ip,
            ambienceInPlayIndex: -1,
            sfx: event.sfx,
            ambiences: event.ambiences);
      } else if (event is Play) {
        if (event.type == AudioType.Ambience) {
          var ambienceInPlay = current.ambiences.indexOf(event.name);
          if (current.ambienceInPlayIndex == ambienceInPlay) {
            yield current;
          } else {
            yield current.copyWith(ambienceInPlayIndex: ambienceInPlay);
          }
        }
        print("play" + event.name);
        var data = {
          "type": event.type.toString().split('.')[1],
          "name": event.name
        };
        sendToServer(playbackTopic, data);
      } else if (event is Stop) {
        if (current.ambienceInPlayIndex == -1)
          yield current;
        else {
          var data = {"type": "Ambience", "name": "none"};
          sendToServer(playbackTopic, data);
          yield current.copyWith(ambienceInPlayIndex: -1);
        }
      }
    }

    if (event is SetIP) {
      if (client != null) client.disconnect();
      //client = MqttClient("test.mosquitto.org", "");
      client = MqttClient(event.ip, "");
      await initMQTT();
      yield AppState.connecting(event.ip);
    }
  }

  void sendToServer(String topic, Map<String, dynamic> data) {
    if (client == null ||
        client.connectionStatus.state != MqttConnectionState.connected) return;

    var payload = MqttClientPayloadBuilder();
    payload.addString(jsonEncode(data));
    client.publishMessage(topic, MqttQos.atLeastOnce, payload.payload);
  }
}
