part of 'counter_bloc.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}

class SuccessState extends CounterState {
  final int count;
  SuccessState(this.count);
}
