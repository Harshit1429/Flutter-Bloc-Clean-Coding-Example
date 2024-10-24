import 'package:bstat_examples/bloc/Switch%20&%20Slider/SwitchAndSliderBloc.dart';
import 'package:bstat_examples/bloc/Switch%20&%20Slider/SwitchAndSliderEvent.dart';
import 'package:bstat_examples/bloc/Switch%20&%20Slider/SwitchAndSliderState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchSlider extends StatefulWidget {
  const SwitchSlider({super.key});

  @override
  State<SwitchSlider> createState() => _SwitchSliderState();
}

class _SwitchSliderState extends State<SwitchSlider> {
  @override
  Widget build(BuildContext context) {
    print('all build');

    return Scaffold(

      appBar: AppBar(
        title: const Text("Bloc With Switch and Slider"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          BlocBuilder<SwitchBloc , SwitchSate>(builder: (context, state) {
            return  Column(
              children: [
                Switch(value: state.isSwitch, onChanged: (value) {
                 context.read<SwitchBloc>().add(EnableDisableSwitch());
                 print('notification');
                },),
                const SizedBox(
                  height: 11,
                ),
                Container(
                  height: 250,
                  width: 250 ,
                  color: Colors.red.withOpacity(state.sliderValue),
                ),
                SizedBox(
                  height: 11,
                ),
                Slider(value: state.sliderValue, onChanged: (value) {
               context.read<SwitchBloc>().add(ValueOfSlider(value: value));
               print('Slider');

                },)
              ],
            );

          },)
        ],
      ),
    );
  }
}
