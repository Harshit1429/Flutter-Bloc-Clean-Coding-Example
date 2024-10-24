import 'package:bloc/bloc.dart';
import 'package:bstat_examples/bloc/Counter/counter_event.dart';
import 'package:bstat_examples/bloc/Counter/counter_state.dart';

 class CounterBloc extends Bloc<CounterEvents , CounterState> {

   CounterBloc() : super(const CounterState()){
     on<IncrementCounter>(_increment);
     on<DecrementCounter>(_decrement);

   }
   void _increment(IncrementCounter event , Emitter<CounterState> emit){
     emit(state.copyWith(counter: state.counter +1 ));
   }
   void _decrement(DecrementCounter event , Emitter<CounterState> emit){
     emit(state.copyWith(counter: state.counter -1));
   }
 }