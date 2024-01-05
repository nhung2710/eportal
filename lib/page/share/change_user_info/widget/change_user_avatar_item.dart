//
// Created by BlackRose on 05/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//
import 'dart:convert';
import 'dart:io';

import 'package:eportal/page/widget/default_image_network.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_elevation.dart';
import 'package:eportal/style/app_size_icon.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/dialog/choose_image_file_dialog.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class ChangeUserAvatarItem extends StatefulWidget{
  ValueChanged<String> changed;

  ChangeUserAvatarItem({super.key,required this.changed});

  @override
  State<StatefulWidget> createState() => ChangeUserAvatarItemState();
}

class ChangeUserAvatarItemState extends State<ChangeUserAvatarItem>{
  final ImagePicker picker = ImagePicker();
  String? path = null;
  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: ()=> selectImage(),
    child: path != null ? CircleAvatar(
      backgroundColor: AppColor.colorOfIcon,
      radius: 100,
      child: CircleAvatar(
        backgroundImage: FileImage(File(path!)),
        foregroundColor: Colors.transparent,
        backgroundColor: Colors.white,
        radius: 99,
      ),
    ) :  DefaultImageNetwork(
      imageUrl:
      "https://www.w3schools.com/bootstrap5/img_avatar12.png",
      localImageError: "assets/images/userLogo.png",
      imageBuilder: (context, imageProvider) => CircleAvatar(
        backgroundColor: AppColor.colorOfIcon,
        radius: 100,
        child: CircleAvatar(
          backgroundImage: imageProvider,
          foregroundColor: Colors.transparent,
          backgroundColor: Colors.white,
          radius: 99,
        ),
      ),
    ),
  );


  selectImage() async {
    showModalBottomSheet(
        context: context,
        elevation: AppElevation.sizeOfNormal,
        useSafeArea: true,
        barrierColor: Colors.transparent,
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 20, // here increase or decrease in width
        ),
        builder: (context) => Container(
          padding: const EdgeInsets.only(top: 20),
          child: Wrap(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  openCamera();
                },
                child: ListTile(
                  leading: const Icon(
                    FontAwesomeIcons.camera,
                    color: AppColor.colorOfIcon,
                    size: AppSizeIcon.sizeOfNormal,
                  ),
                  title: Text("Máy ảnh",style: AppTextStyle.title.copyWith(overflow: TextOverflow.visible),),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  openGallery();
                },
                child: ListTile(
                  leading: const Icon(
                    FontAwesomeIcons.file,
                    color: AppColor.colorOfIcon,
                    size: AppSizeIcon.sizeOfNormal,
                  ),
                  title: Text("Bộ sưu tập",style: AppTextStyle.title.copyWith(overflow: TextOverflow.visible),),
                ),
              ),
            ],
          ),
        ));

  }

  Future openCamera() async {
    if (Platform.isWindows) {
      FilePickerResult? result = await FilePicker.platform
          .pickFiles(type: FileType.image, withData: true);
      if (result?.files.first.path != null) {
        path = result!.files.first.path;
        setState(() {});
        String base64Image = base64Encode(result.files.first.bytes!);
        widget.changed(base64Image);
      }
    }
    else{

      final XFile? image = await picker.pickImage(
          source: ImageSource.camera);
      if (image != null) {
        path = image.path;
        setState(() {});
        String base64Image = base64Encode(await image.readAsBytes());
        widget.changed(base64Image);
      }
    }
  }

  Future openGallery() async {
    if (Platform.isWindows) {
      FilePickerResult? result = await FilePicker.platform
          .pickFiles(type: FileType.image, withData: true);
      if (result?.files.first.path != null) {
        path = result!.files.first.path;
        setState(() {});
        String base64Image = base64Encode(result.files.first.bytes!);
        widget.changed(base64Image);
      }
    }
    else{

      final XFile? image = await picker.pickImage(
          source: ImageSource.gallery);
      if (image != null) {
        path = image.path;
        setState(() {});
        String base64Image = base64Encode(await image.readAsBytes());
      widget.changed(base64Image);
    }
    }
  }
}