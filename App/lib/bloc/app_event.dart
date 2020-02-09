import 'package:d_and_d_soundboard_app/bloc/assets_bloc.dart';
import 'package:flutter/foundation.dart';

part 'app_event.freezed.dart';

@immutable
abstract class AppEvent with _$AppEvent {
  const factory AppEvent.play(AudioType type, String name) = Play;
  const factory AppEvent.stop() = Stop;
  const factory AppEvent.updateAsset(
      List<dynamic> sfx, List<dynamic> ambiences) = Update;
  const factory AppEvent.getAsset() = Get;
  const factory AppEvent.setIP(String ip) = SetIP;
}
