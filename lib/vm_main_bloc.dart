import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'vm_main_event.dart';
part 'vm_main_state.dart';

class VmMainBloc extends Bloc<VmMainEvent, VmMainState> {
  VmMainBloc() : super(VmMainInitial());

  @override
  Stream<VmMainState> mapEventToState(
    VmMainEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
