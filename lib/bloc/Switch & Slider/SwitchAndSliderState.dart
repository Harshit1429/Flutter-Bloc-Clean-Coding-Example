import 'dart:ffi';

import 'package:equatable/equatable.dart';

class SwitchSate extends Equatable {

  final bool isSwitch ;
  final double sliderValue ;

  const SwitchSate({
    this.isSwitch = false ,
    this.sliderValue = 0.0
});

  SwitchSate copywith({bool? isSwitch , double? sliderValue }){
    return SwitchSate(
      isSwitch: isSwitch ?? this.isSwitch ,
      sliderValue:  sliderValue ?? this.sliderValue
    );

}

  @override
  List<Object?> get props => [isSwitch , sliderValue];

}