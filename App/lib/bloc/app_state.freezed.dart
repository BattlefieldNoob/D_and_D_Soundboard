// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

abstract class _$AppState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result empty(),
    @required Result connecting(String ip),
    @required
        Result ready(String ip, int ambienceInPlayIndex, List<dynamic> sfx,
            List<dynamic> ambiences),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result empty(),
    Result connecting(String ip),
    Result ready(String ip, int ambienceInPlayIndex, List<dynamic> sfx,
        List<dynamic> ambiences),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result empty(Empty value),
    @required Result connecting(Connecting value),
    @required Result ready(Ready value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result empty(Empty value),
    Result connecting(Connecting value),
    Result ready(Ready value),
    @required Result orElse(),
  });
}

class _$Empty with DiagnosticableTreeMixin implements Empty {
  const _$Empty();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
    return 'AppState.empty()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'AppState.empty'));
  }

  @override
  bool operator ==(dynamic other) {
    return other is Empty;
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result empty(),
    @required Result connecting(String ip),
    @required
        Result ready(String ip, int ambienceInPlayIndex, List<dynamic> sfx,
            List<dynamic> ambiences),
  }) {
    assert(empty != null);
    assert(connecting != null);
    assert(ready != null);
    return empty();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result empty(),
    Result connecting(String ip),
    Result ready(String ip, int ambienceInPlayIndex, List<dynamic> sfx,
        List<dynamic> ambiences),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result empty(Empty value),
    @required Result connecting(Connecting value),
    @required Result ready(Ready value),
  }) {
    assert(empty != null);
    assert(connecting != null);
    assert(ready != null);
    return empty(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result empty(Empty value),
    Result connecting(Connecting value),
    Result ready(Ready value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class Empty implements AppState {
  const factory Empty() = _$Empty;
}

class _$Connecting with DiagnosticableTreeMixin implements Connecting {
  const _$Connecting(this.ip);

  @override
  final String ip;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
    return 'AppState.connecting(ip: $ip)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppState.connecting'))
      ..add(DiagnosticsProperty('ip', ip));
  }

  @override
  bool operator ==(dynamic other) {
    return other is Connecting && (identical(other.ip, ip) || other.ip == ip);
  }

  @override
  int get hashCode => runtimeType.hashCode ^ ip.hashCode;

  @override
  _$Connecting copyWith({
    Object ip = immutable,
  }) {
    return _$Connecting(
      ip == immutable ? this.ip : ip as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result empty(),
    @required Result connecting(String ip),
    @required
        Result ready(String ip, int ambienceInPlayIndex, List<dynamic> sfx,
            List<dynamic> ambiences),
  }) {
    assert(empty != null);
    assert(connecting != null);
    assert(ready != null);
    return connecting(ip);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result empty(),
    Result connecting(String ip),
    Result ready(String ip, int ambienceInPlayIndex, List<dynamic> sfx,
        List<dynamic> ambiences),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (connecting != null) {
      return connecting(ip);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result empty(Empty value),
    @required Result connecting(Connecting value),
    @required Result ready(Ready value),
  }) {
    assert(empty != null);
    assert(connecting != null);
    assert(ready != null);
    return connecting(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result empty(Empty value),
    Result connecting(Connecting value),
    Result ready(Ready value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (connecting != null) {
      return connecting(this);
    }
    return orElse();
  }
}

abstract class Connecting implements AppState {
  const factory Connecting(String ip) = _$Connecting;

  String get ip;

  Connecting copyWith({String ip});
}

class _$Ready with DiagnosticableTreeMixin implements Ready {
  const _$Ready({this.ip, this.ambienceInPlayIndex, this.sfx, this.ambiences});

  @override
  final String ip;
  @override
  final int ambienceInPlayIndex;
  @override
  final List<dynamic> sfx;
  @override
  final List<dynamic> ambiences;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
    return 'AppState.ready(ip: $ip, ambienceInPlayIndex: $ambienceInPlayIndex, sfx: $sfx, ambiences: $ambiences)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppState.ready'))
      ..add(DiagnosticsProperty('ip', ip))
      ..add(DiagnosticsProperty('ambienceInPlayIndex', ambienceInPlayIndex))
      ..add(DiagnosticsProperty('sfx', sfx))
      ..add(DiagnosticsProperty('ambiences', ambiences));
  }

  @override
  bool operator ==(dynamic other) {
    return other is Ready &&
        (identical(other.ip, ip) || other.ip == ip) &&
        (identical(other.ambienceInPlayIndex, ambienceInPlayIndex) ||
            other.ambienceInPlayIndex == ambienceInPlayIndex) &&
        (identical(other.sfx, sfx) || other.sfx == sfx) &&
        (identical(other.ambiences, ambiences) || other.ambiences == ambiences);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      ip.hashCode ^
      ambienceInPlayIndex.hashCode ^
      sfx.hashCode ^
      ambiences.hashCode;

  @override
  _$Ready copyWith({
    Object ip = immutable,
    Object ambienceInPlayIndex = immutable,
    Object sfx = immutable,
    Object ambiences = immutable,
  }) {
    return _$Ready(
      ip: ip == immutable ? this.ip : ip as String,
      ambienceInPlayIndex: ambienceInPlayIndex == immutable
          ? this.ambienceInPlayIndex
          : ambienceInPlayIndex as int,
      sfx: sfx == immutable ? this.sfx : sfx as List<dynamic>,
      ambiences:
          ambiences == immutable ? this.ambiences : ambiences as List<dynamic>,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result empty(),
    @required Result connecting(String ip),
    @required
        Result ready(String ip, int ambienceInPlayIndex, List<dynamic> sfx,
            List<dynamic> ambiences),
  }) {
    assert(empty != null);
    assert(connecting != null);
    assert(ready != null);
    return ready(ip, ambienceInPlayIndex, sfx, ambiences);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result empty(),
    Result connecting(String ip),
    Result ready(String ip, int ambienceInPlayIndex, List<dynamic> sfx,
        List<dynamic> ambiences),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (ready != null) {
      return ready(ip, ambienceInPlayIndex, sfx, ambiences);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result empty(Empty value),
    @required Result connecting(Connecting value),
    @required Result ready(Ready value),
  }) {
    assert(empty != null);
    assert(connecting != null);
    assert(ready != null);
    return ready(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result empty(Empty value),
    Result connecting(Connecting value),
    Result ready(Ready value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class Ready implements AppState {
  const factory Ready(
      {String ip,
      int ambienceInPlayIndex,
      List<dynamic> sfx,
      List<dynamic> ambiences}) = _$Ready;

  String get ip;
  int get ambienceInPlayIndex;
  List<dynamic> get sfx;
  List<dynamic> get ambiences;

  Ready copyWith(
      {String ip,
      int ambienceInPlayIndex,
      List<dynamic> sfx,
      List<dynamic> ambiences});
}
