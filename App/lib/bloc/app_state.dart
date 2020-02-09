import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

part 'app_state.freezed.dart';

@immutable
abstract class AppState with _$AppState {
  const factory AppState.empty() = Empty;
  const factory AppState.connecting(String ip) = Connecting;
  const factory AppState.ready(
      {String ip,
      int ambienceInPlayIndex,
      List<dynamic> sfx,
      List<dynamic> ambiences}) = Ready;
}
