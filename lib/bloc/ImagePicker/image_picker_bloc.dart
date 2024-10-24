import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../Utils/ImagePickerUtil.dart';
import 'image_picker_event.dart';
import 'image_picker_state.dart';


class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePick imagePick ;

  ImagePickerBloc(this.imagePick) : super(ImagePickerState()) {
    on<CameraPicked>(_pickImage);
    on<GalleryPicked>(_gallary);
  }
  Future<void> _pickImage(ImagePickerEvent event , Emitter<ImagePickerState> emit) async {
    XFile? file = await imagePick.cameraCapture();
    emit(state.copyWith(file: file));
  }
  Future<void> _gallary(ImagePickerEvent event , Emitter<ImagePickerState> emit) async{
    final XFile? file = await imagePick.galleryPick();
    emit(state.copyWith(file: file));
  }
}
