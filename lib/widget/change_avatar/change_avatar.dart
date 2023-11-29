import 'dart:convert';
import 'dart:io';

import 'package:eportal/widget/image/image_loading.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

//
// Created by BlackRose on 29/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class ChangeAvatar extends StatefulWidget {
  ValueChanged<String> changed;

  ChangeAvatar({super.key, required this.changed});

  @override
  State<StatefulWidget> createState() => _ChangeAvatarState();
}

class _ChangeAvatarState extends State<ChangeAvatar> {
  final ImagePicker picker = ImagePicker();
  String? path = null;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => selectImage(),
        child: path == null
            ? ImageLoading(
                imageUrl: 'https://via.placeholder.com/100',
                imageBuilder: (context, imageProvider) {
                  // you can access to imageProvider
                  return CircleAvatar(
                    // or any widget that use imageProvider like (PhotoView)
                    backgroundImage: imageProvider,
                  );
                })
            : CircleAvatar(
                backgroundImage: FileImage(File(path!)),
              ),
      );

  selectImage() async {
    if (Platform.isWindows) {
      FilePickerResult? result = await FilePicker.platform
          .pickFiles(type: FileType.image, withData: true);
      if (result?.files.first.path != null) {
        path = result!.files.first.path;
        setState(() {});
        String base64Image = base64Encode(result.files.first.bytes!);
        widget.changed(base64Image);
      }
    } else {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        path = image.path;
        setState(() {});
        String base64Image = base64Encode(await image.readAsBytes());
        widget.changed(base64Image);
      }
    }
  }
}
