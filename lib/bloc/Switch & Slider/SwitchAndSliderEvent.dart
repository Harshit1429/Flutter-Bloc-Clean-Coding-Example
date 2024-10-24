import 'package:equatable/equatable.dart';

abstract class SwitchEvent extends Equatable {
  const SwitchEvent();
  @override
  List<Object?> get props => [];

}

class EnableDisableSwitch extends SwitchEvent {}

class ValueOfSlider extends SwitchEvent {
  final double value ;
  const ValueOfSlider({
    required this.value
});
}