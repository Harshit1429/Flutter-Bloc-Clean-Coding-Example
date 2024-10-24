import 'dart:io';

import 'package:bstat_examples/bloc/ImagePicker/image_picker_bloc.dart';
import 'package:bstat_examples/bloc/ImagePicker/image_picker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/ImagePicker/image_picker_event.dart';

class ImageGetter extends StatefulWidget {
  const ImageGetter({super.key});

  @override
  State<ImageGetter> createState() => _ImageGetterState();
}

class _ImageGetterState extends State<ImageGetter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Image Picker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<ImagePickerBloc , ImagePickerState>(builder: (context, state) {
            return Column(
              children: [
                state.file == null ?
                    const CircleAvatar(
                      maxRadius: 60,
                      child: Icon(Icons.person,color: Colors.black,),
                    )
                    :
                    Image.file(File(state.file!.path.toString()),height: 200,width: 200,),
                SizedBox(
                  height: 11,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(onPressed: () {
                       context.read<ImagePickerBloc>().add(CameraPicked());
                    }, child: const Text("Camera")),
                    TextButton(onPressed: () {
                      context.read<ImagePickerBloc>().add(GalleryPicked());
                    }, child: const Text("Gallery"))
                  ],
                )
               
              ],
            );
          },)
        ],
      ),
    );
  }
}
