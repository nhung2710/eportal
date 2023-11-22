import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_elevation.dart';
import 'package:eportal/style/app_size_icon.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 20/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class SettingPageModel {
  IconData icon;
  String title;
  WidgetBuilder builder;

  SettingPageModel(
      {required this.icon, required this.title, required this.builder});
}

class SettingItemViewer extends StatelessWidget {
  final SettingPageModel settingPageModel;
  final GestureTapCallback onTap;

  const SettingItemViewer(
      {super.key, required this.settingPageModel, required this.onTap});

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Card(
            margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
            elevation: AppElevation.sizeOfNormal,
            borderOnForeground: false,
            color: AppColor.colorOfApp,
            shadowColor: AppColor.colorOfIcon,
            shape: const RoundedRectangleBorder(
                side: BorderSide(color: AppColor.colorOfDrawer, width: 0.1),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Icon(
                    settingPageModel.icon,
                    color: AppColor.colorOfIcon,
                    size: AppSizeIcon.sizeOfNormal,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                        margin: const EdgeInsets.only(right: 10, left: 10),
                        child: Text(settingPageModel.title,
                            textAlign: TextAlign.start,
                            style: AppTextStyle.title
                                .copyWith(color: AppColor.colorOfIcon))),
                  ),
                  const Icon(
                    Icons.navigate_next_sharp,
                    color: AppColor.colorOfIcon,
                    size: AppSizeIcon.sizeOfNormal,
                  )
                ],
              ),
            )),
      );
}
