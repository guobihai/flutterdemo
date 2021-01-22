import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutterdemo/Text.dart';

import 'ViewModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
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

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  DataBloc _dataBloc;

  // ignore: close_sinks

  // StreamBuilder streamBuilder = new StreamBuilder(
  //     stream: dataSteam,
  //     initialData: ['none'],
  //     builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
  //       return Container();
  //     });
  // StreamController<String> _streamController;
  //
  // ///事件订阅对象
  // StreamSubscription _dataSubscription;
  // StreamSink _streamSink;
  // Stream<String> dataSteam;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dataBloc = new DataBloc();
    var text = new Text1("name", 111);

    var text2 = new Text2();

    // _streamController = StreamController<String>();
    // //入口
    // _streamSink = _streamController.sink;
    //
    // //数据流
    // dataSteam = _streamController.stream;
    //
    //
    //
    // _streamSink.add("event");
  }

  StreamBuilder getStreamBuilder() {
    return new StreamBuilder<String>(
        stream: _dataBloc.dataSteam,
        initialData: 'data',
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          var _data = snapshot.data;
          print("data is $_data");
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many timesddd  dcx:',
                ),
                Text(
                  _data,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          );
        });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _dataBloc.close();
  }

  void _incrementCounter() {
    // setState(() {
    // This call to setState tells the Flutter framework that something has
    // changed in this State, which causes it to rerun the build method below
    // so that the display can reflect the updated values. If we changed
    // _counter without calling setState(), then the build method would not be
    // called again, and so nothing would appear to happen.
    _counter++;

    _dataBloc.streamSink.add(_counter.toString());
    // });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: getStreamBuilder(),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
