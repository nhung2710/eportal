//
// Created by BlackRose on 12/23/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../style/app_text_style.dart';

class CustomMarkerLocation extends StatefulWidget {
  String title;

  CustomMarkerLocation({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => CustomMarkerLocationState();
}

class CustomMarkerLocationState extends State<CustomMarkerLocation> {
  @override
  Widget build(BuildContext context) => GestureDetector(
      onTap: () => showTitle(context),
      child: Icon(FontAwesomeIcons.locationDot, color: Colors.red));

  showTitle(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 500),
        action: SnackBarAction(
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
          label: '',
        ),
        backgroundColor: AppColor.colorOfIcon,
        content: Text(
          widget.title,
          style: AppTextStyle.textButton.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
