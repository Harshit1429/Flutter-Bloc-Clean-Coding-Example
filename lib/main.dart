import 'package:bstat_examples/Screens/Counter/CounterPage.dart';
import 'package:bstat_examples/Utils/ImagePickerUtil.dart';
import 'package:bstat_examples/bloc/ApiCall/api_call_bloc.dart';
import 'package:bstat_examples/bloc/Counter/counter_bloc.dart';
import 'package:bstat_examples/bloc/GetAPI/get_api_bloc.dart';
import 'package:bstat_examples/bloc/ImagePicker/image_picker_bloc.dart';
import 'package:bstat_examples/bloc/Switch%20&%20Slider/SwitchAndSliderBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Screens/ApiCall/ApiCall.dart';
import 'Screens/GetApi/GetApi.dart';
import 'Screens/ImagePicker/ImagePicker.dart';
import 'Screens/Switch & Slider/Switch & Slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc(),
        ),
        BlocProvider(
          create: (context) => SwitchBloc(),
        ),
        BlocProvider(create: (context) => ImagePickerBloc(ImagePick()),
        ),
        BlocProvider(create: (context) => GetApiBloc(),),
        BlocProvider(create: (context) => ApiCallBloc(),)
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Apicall(),
      ),
    );
  }
}

