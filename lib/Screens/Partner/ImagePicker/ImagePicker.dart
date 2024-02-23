import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePicker extends StatefulWidget {
  const ImagePicker({super.key});

  @override
  State<ImagePicker> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  XFile? ImageXFile;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        backgroundImage:
            ImageXFile == null ? null : FileImage(File(ImageXFile!.path)),
        child: ImageXFile == null
            ? Image.asset(
                'Assets/Images/Icons/ImagePicker.png',
                fit: BoxFit.cover,
              )
            : null);
  }
}
