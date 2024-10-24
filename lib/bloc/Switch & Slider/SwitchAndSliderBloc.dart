import 'package:bstat_examples/bloc/Switch%20&%20Slider/SwitchAndSliderEvent.dart';
import 'package:bstat_examples/bloc/Switch%20&%20Slider/SwitchAndSliderState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchBloc extends Bloc<SwitchEvent , SwitchSate>{
  SwitchBloc() : super(const SwitchSate()){
    on<EnableDisableSwitch>(_enableSwitch);
    on<ValueOfSlider>(_sliderValue);
  }


  void _enableSwitch(EnableDisableSwitch events , Emitter<SwitchSate> emit){
    emit(state.copywith(isSwitch: !state.isSwitch));
  }
  void _sliderValue(ValueOfSlider events , Emitter<SwitchSate> emit){
    emit(state.copywith(sliderValue: events.value.toDouble()));
  }
}