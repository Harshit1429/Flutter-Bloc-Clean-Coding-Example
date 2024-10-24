import 'package:image_picker/image_picker.dart';

class ImagePick {

  ImagePicker imagePicker = ImagePicker();

  Future<XFile?> cameraCapture() async {
    final XFile? file = await imagePicker.pickImage(source: ImageSource.camera);
    return file;
  }
  Future<XFile?> galleryPick() async {
    final XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
     return file ;
  }

}