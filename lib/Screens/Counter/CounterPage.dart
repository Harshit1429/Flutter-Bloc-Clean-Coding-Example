import 'package:bstat_examples/bloc/Counter/counter_bloc.dart';
import 'package:bstat_examples/bloc/Counter/counter_event.dart';
import 'package:bstat_examples/bloc/Counter/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    print('All rebuilt');

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc , CounterState>(builder: (context, state) {
            print('Only rebuilt');
            return Center(
              child: Text(state.counter.toString(),style: TextStyle(fontSize: 60,color: Colors.black),)
              ,
            );
          },),
          SizedBox(
            height: 21,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(onPressed: () {
                context.read<CounterBloc>().add(IncrementCounter());
              }, child: const Text('Increase')),
              ElevatedButton(onPressed: () {
               context.read<CounterBloc>().add(DecrementCounter());
              }, child: const Text('Decrease')),
            ],
          )
        ],
      ),
    );
  }
}
