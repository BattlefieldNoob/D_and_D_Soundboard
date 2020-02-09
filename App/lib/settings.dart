import 'dart:io';

import 'package:d_and_d_soundboard_app/bloc/app_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/app_state.dart';
import 'bloc/assets_bloc.dart';

class Settings extends StatelessWidget {
  final ipRegExt =
      new RegExp(r'^(\d?\d?\d)\.(\d?\d?\d)\.(\d?\d?\d)\.(\d?\d?\d)$');

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AssetsBloc>(context);

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Builder(builder: (context) {
            return InkWell(
              onTap: () async {
                await getRaspberryIP(context);
              },
              child: Center(widthFactor: 2, child: Icon(Icons.search)),
            );
          })
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          heightFactor: 16,
          child: Column(
            children: <Widget>[
              Text("RASPBERRY IP"),
              BlocBuilder<AssetsBloc, AppState>(condition: (prevState, state) {
                return !(prevState == state);
              }, builder: (context, state) {
                var ip = "10.0.2.2";
                if (state is Connecting) {
                  ip = state.ip;
                }
                if (state is Ready) {
                  ip = state.ip;
                }
                return TextFormField(
                  onFieldSubmitted: (text) async {
                    bloc.add(AppEvent.setIP(text));
                  },
                  validator: (text) {
                    if (!ipRegExt.hasMatch(text)) {
                      return "ip is incorrect";
                    }
                    return null;
                  },
                  initialValue: ip,
                  autovalidate: true,
                );
              })
            ],
          ),
        ),
      ),
    );
  }

  Future getRaspberryIP(BuildContext context) async {
    print("Start Listen");
    var socket = await RawDatagramSocket.bind(InternetAddress.anyIPv4, 6024);
    socket.listen((event) async {
      print(event);
      if (event == RawSocketEvent.read) {
        final bloc = BlocProvider.of<AssetsBloc>(context);
        var mess = socket.receive();
        var ip = String.fromCharCodes(mess.data);
        bloc.add(AppEvent.setIP(ip));
        Scaffold.of(context).showSnackBar(SnackBar(
            duration: Duration(seconds: 2), content: Text("IP FOUND!")));
        socket.close();
      }
    });
  }
}
