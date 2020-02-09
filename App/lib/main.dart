import 'package:d_and_d_soundboard_app/bloc/app_event.dart';
import 'package:d_and_d_soundboard_app/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/app_state.dart';
import 'bloc/assets_bloc.dart';
import 'ui/audio_grid_item.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AssetsBloc(),
        child: MaterialApp(
          title: 'D&D Soundboard',
          routes: {
            "/": (context) => SoundBoard(title: 'D&D Soundboard'),
            "/settings": (context) => Settings()
          },
          theme: ThemeData(
              primarySwatch: Colors.blue,
              buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.accent)),
          initialRoute: "/",
        ));
  }
}

class SoundboardTab extends Tab {
  final AudioType type;

  SoundboardTab(this.type) : super(text: type.toString().split('.')[1]);
}

class SoundBoard extends StatefulWidget {
  SoundBoard({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SoundBoardState createState() => _SoundBoardState();
}

class _SoundBoardState extends State<SoundBoard>
    with SingleTickerProviderStateMixin {
  AssetsBloc bloc;

  TabController _tabController;

  final tabs = <SoundboardTab>[
    SoundboardTab(AudioType.Ambience),
    SoundboardTab(AudioType.SFX)
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    bloc = BlocProvider.of<AssetsBloc>(context);
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
              Navigator.pushNamed(context, "/settings");
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
              children: tabs.map((SoundboardTab tab) {
                return BlocBuilder<AssetsBloc, AppState>(
                    condition: (prevState, state) {
                  return !(prevState == state);
                }, builder: (context, state) {
                  if (state is Ready) {
                    var elements = state.sfx;
                    var playingIndex = -1;
                    if (tab.type == AudioType.Ambience) {
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
                        getTabList(elements, playingIndex,
                            tab.type == AudioType.Ambience),
                      ],
                    );
                  } else {
                    return Center(child: Text("No assets"));
                  }
                });
              }).toList())), // This trailing comma makes auto-formatting nicer for build methods.
      floatingActionButton: FloatingActionButton(
          onPressed: () => bloc.add(AppEvent.getAsset()),
          child: Icon(Icons.refresh)),
    );
  }

  Widget getTabTitle(SoundboardTab tab) {
    if (tab.type == AudioType.Ambience) {
      return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "Ambiences",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            FlatButton(
                child: Text("Stop All"),
                onPressed: () => bloc.add(AppEvent.stop()))
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

  Widget getTabList(List<dynamic> elements, int playingIndex, bool isAmbience) {
    return Expanded(
        child: GridView.builder(
            itemBuilder: (context, int index) {
              return isAmbience
                  ? AudioGridItem.ambience(
                      bloc, elements[index], index == playingIndex)
                  : AudioGridItem.sfx(bloc, elements[index]);
            },
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemCount: elements.length));
  }
}
