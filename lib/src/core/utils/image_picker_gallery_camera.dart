import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nowdots_social_news/src/core/widgets/camera_capture.dart';

class ImagePickerGalleryCamera {
  static Future<XFile?> pickImageFromGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      return image;
    } catch (e) {
      return null;
    }
  }

  static Future<List<XFile>?> pickMultiImageFromGallery() async {
    try {
      final image = await ImagePicker().pickMultiImage();
      return image;
    } catch (e) {
      return null;
    }
  }

  static Future<XFile?> pickImageFromCamera(BuildContext context) async {
    try {
      final image = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CameraCapture(),
          ));
      return image;
    } catch (e) {
      return null;
    }
  }

  static Future<XFile?> pickImageFromGalleryOrCamera(
      BuildContext context) async {
    XFile? image;
    await showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            ListTile(
                leading: Icon(Icons.image_outlined),
                title: Text("Gallery"),
                onTap: () async {
                  image = await pickImageFromGallery();
                  Navigator.pop(context);
                }),
            ListTile(
                leading: Icon(Icons.camera_alt_outlined),
                title: Text("Camera"),
                onTap: () async {
                  image = await pickImageFromCamera(context);
                  Navigator.pop(context);
                })
          ],
        );
      },
    );
    return image;
  }
}
