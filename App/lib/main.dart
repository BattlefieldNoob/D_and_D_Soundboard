import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bloc/assets_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'D&D Soundboard',
      routes: {
        "/": (context) => BlocProvider(
            create: (context) => AssetsBloc(),
            child: MyHomePage(title: 'D&D Soundboard')),
        "/settings": (context) => Settings()
      },
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.accent)),
      initialRoute: "/",
    );
  }
}

class Settings extends StatelessWidget {
  final ipRegExt =
      new RegExp(r'^(\d?\d?\d)\.(\d?\d?\d)\.(\d?\d?\d)\.(\d?\d?\d)$');

  @override
  Widget build(BuildContext context) {
    var ip = ModalRoute.of(context).settings.arguments;
    if (ip == null) ip = "10.0.2.2";

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
              TextFormField(
                onFieldSubmitted: (text) async {
                  var sp = await SharedPreferences.getInstance();
                  sp.setString("IP", text);
                },
                validator: (text) {
                  if (!ipRegExt.hasMatch(text)) {
                    return "ip is incorrect";
                  }
                  return null;
                },
                initialValue: ip,
                autovalidate: true,
              )
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
        var mess = socket.receive();
        var sp = await SharedPreferences.getInstance();
        var ip = String.fromCharCodes(mess.data);
        sp.setString("IP", ip);
        socket.close();
        Scaffold.of(context).showSnackBar(SnackBar(
            duration: Duration(seconds: 2), content: Text("IP FOUND!")));
        await Future.delayed(Duration(seconds: 2));
        Navigator.of(context).pop(ip);
      }
    });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AssetsBloc bloc;

  String ip;

  TabController _tabController;

  final tabs = <Tab>[Tab(text: "Ambience"), Tab(text: "Sfx")];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    bloc = BlocProvider.of<AssetsBloc>(context);
    bloc.add(GetAssetsEvent());

    SharedPreferences.getInstance().then((sp) {
      ip = sp.getString("IP");
    });
  }

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          tabs: tabs,
          controller: _tabController,
        ),
        title: Text(widget.title),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/settings", arguments: ip)
                  .then((_) {
                SharedPreferences.getInstance().then((sp) {
                  ip = sp.getString("IP");
                  bloc.add(GetAssetsEvent());
                });
              });
            },
            child: Center(widthFactor: 2, child: Icon(Icons.settings)),
          )
        ],
      ),
      body: Container(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: TabBarView(
              controller: _tabController,
              children: tabs.map((Tab tab) {
                return BlocBuilder<AssetsBloc, AssetsState>(
                    condition: (prevState, state) {
                  return !(prevState == state);
                }, builder: (context, state) {
                  if (state is EmptyState) {
                    return Center(child: Text("No assets"));
                  } else {
                    var elements = state.sfx;
                    var playingIndex = -1;
                    if (tab.text == "Ambience") {
                      elements = state.ambiences;
                      playingIndex = state.ambienceInPlayIndex;
                    }
                    return Column(
                      children: <Widget>[
                        SizedBox(
                          height: 8,
                        ),
                        getTabTitle(tab),
                        SizedBox(
                          height: 8,
                        ),
                        getTabList(elements, playingIndex),
                      ],
                    );
                  }
                });
              }).toList())), // This trailing comma makes auto-formatting nicer for build methods.
      floatingActionButton: FloatingActionButton(
          onPressed: () => bloc.add(GetAssetsEvent()),
          child: Icon(Icons.refresh)),
    );
  }

  Widget getTabTitle(Tab tab) {
    if (tab.text == "Ambience") {
      return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "Ambiences",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            FlatButton(
                child: Text("Stop All"), onPressed: () => bloc.add(StopEvent()))
          ]);
    } else {
      return Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            "Sfx",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ));
    }
  }

  Widget getTabList(List<dynamic> elements, int playingIndex) {
    return Expanded(
        child: GridView.builder(
            itemBuilder: (context, int index) {
              return AmbienceListItem(
                  bloc, elements[index], index == playingIndex);
            },
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemCount: elements.length));
  }
}

class AmbienceListItem extends StatelessWidget {
  final String name;
  final type = "ambience";
  final AssetsBloc bloc;
  final regex = new RegExp(r"(\.+)");
  final bool inPlay;
  AmbienceListItem(this.bloc, this.name, this.inPlay);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 6,
        child: Card(
            color: inPlay ? Colors.lightBlueAccent : Colors.white,
            margin: EdgeInsets.all(8),
            child: InkWell(
                onTap: () => bloc.add(PlayEvent(type, name)),
                child: Center(child: Text(name.split(regex)[0])))));
  }
}

class SfxListItem extends StatelessWidget {
  final String name;
  final type = "sfx";
  final AssetsBloc bloc;
  final regex = new RegExp(r"(\.+)");
  SfxListItem(this.bloc, this.name);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 6,
        child: Card(
            margin: EdgeInsets.all(8),
            child: InkWell(
                onTap: () => bloc.add(PlayEvent(type, name)),
                child: Center(child: Text(name.split(regex)[0])))));
  }
}
