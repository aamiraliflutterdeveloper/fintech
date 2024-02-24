import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerManager {
  static XFile? _pickedFileFromGallery;
  static XFile? _pickedFileFromCamera;
  static List<XFile>? _imageFileList;

  // ************************************** Gallery **************************************

  static Future<File?> getImageFromGallery(BuildContext context) async {
    // using pop to hide the image choose options menu
    Navigator.pop(context);
    final _picker = ImagePicker();

    try {
      _pickedFileFromGallery =
          await _picker.pickImage(source: ImageSource.gallery);
      if (_pickedFileFromGallery != null) {
        return File(_pickedFileFromGallery!.path);
      }
      return null;
    } on Exception catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  // ************************************** Camera **************************************
  static Future<File?> getImageFromCamera(BuildContext context) async {
    // using pop to hide the image choose options menu
    Navigator.pop(context);
    final _picker = ImagePicker();
    try {
      _pickedFileFromCamera =
          await _picker.pickImage(source: ImageSource.camera);
      if (_pickedFileFromCamera != null) {
        return File(_pickedFileFromCamera!.path);
      }
      return null;
    } on Exception catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  // ************************************** Multi Gallery **************************************

  static Future<List<XFile>?> getMultiImageFromGallery(
      BuildContext context) async {
    // using pop to hide the image choose options menu

    final _picker = ImagePicker();

    try {
      _imageFileList = await _picker.pickMultiImage();
      if (_imageFileList != null) {
        return _imageFileList;
      }
      return null;
    } on Exception catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
