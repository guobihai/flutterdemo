import 'package:flutterdemo/bloc/bloc_index.dart';
import 'package:rxdart/rxdart.dart';

class ApplicationBloc implements BlocBase {
  // ignore: close_sinks
  BehaviorSubject<int> _appEvent = BehaviorSubject<int>();

  Sink<int> get _appEventSink => _appEvent.sink;

  Stream<int> get appEventStream => _appEvent.stream;

  void sendAppEvent(int type) {
    _appEventSink.add(type);
  }

  @override
  void dispose() {
    _appEvent.close();
  }
}
