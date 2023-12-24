//
// Created by BlackRose on 12/24/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_elevation.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/text_icon/text_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../model/api/response/admin/data/job_user_history_list_data_response.dart';

class ProfileHistoryItem extends StatelessWidget {
  final JobUserHistoryListDataResponse data;

  const ProfileHistoryItem({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) => Card(
        elevation: AppElevation.sizeOfNormal,
        color: AppColor.colorOfApp,
        shadowColor: AppColor.colorOfIcon,
        borderOnForeground: false,
        margin: const EdgeInsets.all(5),
        shape: const RoundedRectangleBorder(
            side: BorderSide(color: AppColor.colorOfDrawer, width: 0.2),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextIcon(
                  text: data.search,
                  overflow: TextOverflow.visible,
                  icon: FontAwesomeIcons.tags,
                  textStyle: AppTextStyle.title
                      .copyWith(color: Colors.black, fontSize: 12),
                  isHasBorder: false,
                ),
              ]),
        ),
      );
}
