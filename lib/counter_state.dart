import 'package:meta/meta.dart';
@immutable
abstract class CounterState {}

 class CounterInitial extends CounterState {}
class ChangeValueFromCounter extends CounterState {
  final int counter;
  ChangeValueFromCounter({required this.counter});
}