part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

class CounterIncrease extends CounterEvent {
  final int count;
  CounterIncrease({@required this.count});
}

class CounterDecraese extends CounterEvent {
  final int count;
  CounterDecraese({@required this.count});
}
