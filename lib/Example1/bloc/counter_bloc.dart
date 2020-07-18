import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial());

  @override
  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {
    if (event is CounterIncrease) {
      int count = event.count;
      print("Increase $count");
      yield SuccessState(count + 1);
    } else if (event is CounterDecraese) {
      int count = event.count;
      print("Decrease $count");
      yield SuccessState(count - 1);
    }
  }
}
