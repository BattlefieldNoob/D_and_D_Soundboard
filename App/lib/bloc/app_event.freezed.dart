// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

abstract class _$AppEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result play(AudioType type, String name),
    @required Result stop(),
    @required Result updateAsset(List<dynamic> sfx, List<dynamic> ambiences),
    @required Result getAsset(),
    @required Result setIP(String ip),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result play(AudioType type, String name),
    Result stop(),
    Result updateAsset(List<dynamic> sfx, List<dynamic> ambiences),
    Result getAsset(),
    Result setIP(String ip),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result play(Play value),
    @required Result stop(Stop value),
    @required Result updateAsset(Update value),
    @required Result getAsset(Get value),
    @required Result setIP(SetIP value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result play(Play value),
    Result stop(Stop value),
    Result updateAsset(Update value),
    Result getAsset(Get value),
    Result setIP(SetIP value),
    @required Result orElse(),
  });
}

class _$Play with DiagnosticableTreeMixin implements Play {
  const _$Play(this.type, this.name);

  @override
  final AudioType type;
  @override
  final String name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
    return 'AppEvent.play(type: $type, name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppEvent.play'))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(dynamic other) {
    return other is Play &&
        (identical(other.type, type) || other.type == type) &&
        (identical(other.name, name) || other.name == name);
  }

  @override
  int get hashCode => runtimeType.hashCode ^ type.hashCode ^ name.hashCode;

  @override
  _$Play copyWith({
    Object type = immutable,
    Object name = immutable,
  }) {
    return _$Play(
      type == immutable ? this.type : type as AudioType,
      name == immutable ? this.name : name as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result play(AudioType type, String name),
    @required Result stop(),
    @required Result updateAsset(List<dynamic> sfx, List<dynamic> ambiences),
    @required Result getAsset(),
    @required Result setIP(String ip),
  }) {
    assert(play != null);
    assert(stop != null);
    assert(updateAsset != null);
    assert(getAsset != null);
    assert(setIP != null);
    return play(type, name);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result play(AudioType type, String name),
    Result stop(),
    Result updateAsset(List<dynamic> sfx, List<dynamic> ambiences),
    Result getAsset(),
    Result setIP(String ip),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (play != null) {
      return play(type, name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result play(Play value),
    @required Result stop(Stop value),
    @required Result updateAsset(Update value),
    @required Result getAsset(Get value),
    @required Result setIP(SetIP value),
  }) {
    assert(play != null);
    assert(stop != null);
    assert(updateAsset != null);
    assert(getAsset != null);
    assert(setIP != null);
    return play(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result play(Play value),
    Result stop(Stop value),
    Result updateAsset(Update value),
    Result getAsset(Get value),
    Result setIP(SetIP value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (play != null) {
      return play(this);
    }
    return orElse();
  }
}

abstract class Play implements AppEvent {
  const factory Play(AudioType type, String name) = _$Play;

  AudioType get type;
  String get name;

  Play copyWith({AudioType type, String name});
}

class _$Stop with DiagnosticableTreeMixin implements Stop {
  const _$Stop();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
    return 'AppEvent.stop()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'AppEvent.stop'));
  }

  @override
  bool operator ==(dynamic other) {
    return other is Stop;
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result play(AudioType type, String name),
    @required Result stop(),
    @required Result updateAsset(List<dynamic> sfx, List<dynamic> ambiences),
    @required Result getAsset(),
    @required Result setIP(String ip),
  }) {
    assert(play != null);
    assert(stop != null);
    assert(updateAsset != null);
    assert(getAsset != null);
    assert(setIP != null);
    return stop();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result play(AudioType type, String name),
    Result stop(),
    Result updateAsset(List<dynamic> sfx, List<dynamic> ambiences),
    Result getAsset(),
    Result setIP(String ip),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (stop != null) {
      return stop();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result play(Play value),
    @required Result stop(Stop value),
    @required Result updateAsset(Update value),
    @required Result getAsset(Get value),
    @required Result setIP(SetIP value),
  }) {
    assert(play != null);
    assert(stop != null);
    assert(updateAsset != null);
    assert(getAsset != null);
    assert(setIP != null);
    return stop(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result play(Play value),
    Result stop(Stop value),
    Result updateAsset(Update value),
    Result getAsset(Get value),
    Result setIP(SetIP value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (stop != null) {
      return stop(this);
    }
    return orElse();
  }
}

abstract class Stop implements AppEvent {
  const factory Stop() = _$Stop;
}

class _$Update with DiagnosticableTreeMixin implements Update {
  const _$Update(this.sfx, this.ambiences);

  @override
  final List<dynamic> sfx;
  @override
  final List<dynamic> ambiences;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
    return 'AppEvent.updateAsset(sfx: $sfx, ambiences: $ambiences)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppEvent.updateAsset'))
      ..add(DiagnosticsProperty('sfx', sfx))
      ..add(DiagnosticsProperty('ambiences', ambiences));
  }

  @override
  bool operator ==(dynamic other) {
    return other is Update &&
        (identical(other.sfx, sfx) || other.sfx == sfx) &&
        (identical(other.ambiences, ambiences) || other.ambiences == ambiences);
  }

  @override
  int get hashCode => runtimeType.hashCode ^ sfx.hashCode ^ ambiences.hashCode;

  @override
  _$Update copyWith({
    Object sfx = immutable,
    Object ambiences = immutable,
  }) {
    return _$Update(
      sfx == immutable ? this.sfx : sfx as List<dynamic>,
      ambiences == immutable ? this.ambiences : ambiences as List<dynamic>,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result play(AudioType type, String name),
    @required Result stop(),
    @required Result updateAsset(List<dynamic> sfx, List<dynamic> ambiences),
    @required Result getAsset(),
    @required Result setIP(String ip),
  }) {
    assert(play != null);
    assert(stop != null);
    assert(updateAsset != null);
    assert(getAsset != null);
    assert(setIP != null);
    return updateAsset(sfx, ambiences);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result play(AudioType type, String name),
    Result stop(),
    Result updateAsset(List<dynamic> sfx, List<dynamic> ambiences),
    Result getAsset(),
    Result setIP(String ip),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (updateAsset != null) {
      return updateAsset(sfx, ambiences);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result play(Play value),
    @required Result stop(Stop value),
    @required Result updateAsset(Update value),
    @required Result getAsset(Get value),
    @required Result setIP(SetIP value),
  }) {
    assert(play != null);
    assert(stop != null);
    assert(updateAsset != null);
    assert(getAsset != null);
    assert(setIP != null);
    return updateAsset(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result play(Play value),
    Result stop(Stop value),
    Result updateAsset(Update value),
    Result getAsset(Get value),
    Result setIP(SetIP value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (updateAsset != null) {
      return updateAsset(this);
    }
    return orElse();
  }
}

abstract class Update implements AppEvent {
  const factory Update(List<dynamic> sfx, List<dynamic> ambiences) = _$Update;

  List<dynamic> get sfx;
  List<dynamic> get ambiences;

  Update copyWith({List<dynamic> sfx, List<dynamic> ambiences});
}

class _$Get with DiagnosticableTreeMixin implements Get {
  const _$Get();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
    return 'AppEvent.getAsset()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'AppEvent.getAsset'));
  }

  @override
  bool operator ==(dynamic other) {
    return other is Get;
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result play(AudioType type, String name),
    @required Result stop(),
    @required Result updateAsset(List<dynamic> sfx, List<dynamic> ambiences),
    @required Result getAsset(),
    @required Result setIP(String ip),
  }) {
    assert(play != null);
    assert(stop != null);
    assert(updateAsset != null);
    assert(getAsset != null);
    assert(setIP != null);
    return getAsset();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result play(AudioType type, String name),
    Result stop(),
    Result updateAsset(List<dynamic> sfx, List<dynamic> ambiences),
    Result getAsset(),
    Result setIP(String ip),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getAsset != null) {
      return getAsset();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result play(Play value),
    @required Result stop(Stop value),
    @required Result updateAsset(Update value),
    @required Result getAsset(Get value),
    @required Result setIP(SetIP value),
  }) {
    assert(play != null);
    assert(stop != null);
    assert(updateAsset != null);
    assert(getAsset != null);
    assert(setIP != null);
    return getAsset(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result play(Play value),
    Result stop(Stop value),
    Result updateAsset(Update value),
    Result getAsset(Get value),
    Result setIP(SetIP value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getAsset != null) {
      return getAsset(this);
    }
    return orElse();
  }
}

abstract class Get implements AppEvent {
  const factory Get() = _$Get;
}

class _$SetIP with DiagnosticableTreeMixin implements SetIP {
  const _$SetIP(this.ip);

  @override
  final String ip;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
    return 'AppEvent.setIP(ip: $ip)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppEvent.setIP'))
      ..add(DiagnosticsProperty('ip', ip));
  }

  @override
  bool operator ==(dynamic other) {
    return other is SetIP && (identical(other.ip, ip) || other.ip == ip);
  }

  @override
  int get hashCode => runtimeType.hashCode ^ ip.hashCode;

  @override
  _$SetIP copyWith({
    Object ip = immutable,
  }) {
    return _$SetIP(
      ip == immutable ? this.ip : ip as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result play(AudioType type, String name),
    @required Result stop(),
    @required Result updateAsset(List<dynamic> sfx, List<dynamic> ambiences),
    @required Result getAsset(),
    @required Result setIP(String ip),
  }) {
    assert(play != null);
    assert(stop != null);
    assert(updateAsset != null);
    assert(getAsset != null);
    assert(setIP != null);
    return setIP(ip);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result play(AudioType type, String name),
    Result stop(),
    Result updateAsset(List<dynamic> sfx, List<dynamic> ambiences),
    Result getAsset(),
    Result setIP(String ip),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (setIP != null) {
      return setIP(ip);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result play(Play value),
    @required Result stop(Stop value),
    @required Result updateAsset(Update value),
    @required Result getAsset(Get value),
    @required Result setIP(SetIP value),
  }) {
    assert(play != null);
    assert(stop != null);
    assert(updateAsset != null);
    assert(getAsset != null);
    assert(setIP != null);
    return setIP(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result play(Play value),
    Result stop(Stop value),
    Result updateAsset(Update value),
    Result getAsset(Get value),
    Result setIP(SetIP value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (setIP != null) {
      return setIP(this);
    }
    return orElse();
  }
}

abstract class SetIP implements AppEvent {
  const factory SetIP(String ip) = _$SetIP;

  String get ip;

  SetIP copyWith({String ip});
}
