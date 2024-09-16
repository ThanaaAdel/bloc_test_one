import 'package:bloc_test_one/counter_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    int counter = 0;
    on<CounterEvent>((event, emit) {
      if (event is Increment) {
        counter = counter + 1;
        emit(ChangeValueFromCounter(counter: counter));
      } else if (event is Decrement) {
        counter = counter - 1;
        emit(ChangeValueFromCounter(counter: counter));
      } else if (event is Reset) {
        counter = 0;
        emit(ChangeValueFromCounter(counter: counter));
      }
    });
  }
}
