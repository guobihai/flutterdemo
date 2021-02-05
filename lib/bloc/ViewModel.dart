import 'dart:async';

import 'package:flutterdemo/bloc/bloc_index.dart';
class DataBloc extends BlocBase{

  StreamController<String> _streamController =StreamController<String>();
  ///事件订阅对象
  StreamSink get streamSink =>_streamController.sink;
  Stream<String> get  dataSteam => _streamController.stream;

  init(){
    streamSink.add("event");
  }

  close(){
    _streamController.close();
  }

  @override
  void dispose() {
    close();
  }
}