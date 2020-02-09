import 'package:d_and_d_soundboard_app/bloc/app_event.dart';
import 'package:d_and_d_soundboard_app/bloc/assets_bloc.dart';
import 'package:flutter/material.dart';

class AudioGridItem extends StatelessWidget {
  final String name;
  final type;
  final AssetsBloc bloc;
  final regex = new RegExp(r"(\.+)");
  final bool inPlay;

  AudioGridItem._private(this.bloc, this.name, this.type, this.inPlay);

  factory AudioGridItem.ambience(bloc, name, inPlay) =>
      AudioGridItem._private(bloc, name, AudioType.Ambience, inPlay);

  factory AudioGridItem.sfx(bloc, name) =>
      AudioGridItem._private(bloc, name, AudioType.SFX, false);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 6,
        child: Card(
            color: inPlay ? Colors.lightBlueAccent : Colors.white,
            margin: EdgeInsets.all(8),
            child: InkWell(
                onTap: () => bloc.add(AppEvent.play(type, name)),
                child: Center(child: Text(name.split(regex)[0])))));
  }
}
