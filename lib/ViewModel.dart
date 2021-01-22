import 'dart:async';
class DataBloc{

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
}