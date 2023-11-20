import 'package:eportal/model/setting_page_model.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_size_icon.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//
// Created by BlackRose on 11/8/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class SettingItem extends StatelessWidget {
  final SettingPageModel settingPageModel;
  final GestureTapCallback onTap;

  const SettingItem(
      {super.key, required this.settingPageModel, required this.onTap});

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Card(
            margin: const EdgeInsets.only(top: 5, left: 10),
            elevation: 5,
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
                    FontAwesomeIcons.angleRight,
                    color: AppColor.colorOfIcon,
                    size: AppSizeIcon.sizeOfNormal,
                  )
                ],
              ),
            )),
      );
}
