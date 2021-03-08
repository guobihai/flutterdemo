import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/res/strings.dart';
import 'package:flutterdemo/ui/qrcode/qrcode_page.dart';
import 'package:flutterdemo/ui/setting_page.dart';
import 'package:flutterdemo/ui/user/user_login_page.dart';

import 'bloc/ViewModel.dart';
import 'common/global.dart';
import 'bloc/bloc_index.dart';

void main() {
  Global.init(() {
    runApp(BlocProvider(child: MyApp(), bloc: ApplicationBloc()));
  });
}

class MyApp extends BaseStatefulWidget {
  @override
  Widget getChild() {
    return BlocProvider(
      child: MyHomePage(
        title: "特性",
      ),
      bloc: DataBloc(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  DataBloc _dataBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dataBloc = BlocProvider.of<DataBloc>(context);
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
                RaisedButton(
                  onPressed: () {
                    NavigatorUtil.pushPage(context, SettingPage());
                  },
                  child: Text(
                    IntlUtil.getString(context, Ids.confirm),
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    NavigatorUtil.pushPage(context, UserLoginPage());
                  },
                  child: Text(
                    IntlUtil.getString(context, Ids.user_login),
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    NavigatorUtil.pushPage(context, QrcodePage());
                  },
                  child: Text(
                    '扫码',
                  ),
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

  void _incrementCounter() {
    _counter++;
    _dataBloc.streamSink.add(_counter.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
