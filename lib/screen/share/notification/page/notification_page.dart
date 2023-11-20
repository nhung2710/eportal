import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../style/app_color.dart';
import '../../../../style/app_text_style.dart';
import '../../../../widget/base/base_page.dart';

//
// Created by BlackRose on 20/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class NotificationPage extends BasePage {
  const NotificationPage({super.key});

  @override
  State<StatefulWidget> createState() => _NotificationPageState();
}

class _NotificationPageState extends BasePageStateActive<NotificationPage> {
  @override
  bool isHasAppBar(BuildContext context) => false;


  @override
  Widget pageUI(BuildContext context) => SingleChildScrollView(
    child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: Random().nextInt(100)+1,
        itemBuilder: (context,index)=> Card(
          elevation: 5,
          color: AppColor.colorOfApp,
          shadowColor: AppColor.colorOfDrawer,
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
                Row(
                  children: [
                    const Icon(
                      Icons.notifications_active,
                      color: AppColor.colorOfIcon,
                      size: 20,
                    ),
                    const VerticalDivider(
                      width: 10,
                      color: AppColor.colorOfDrawer,
                    ),
                    Expanded(
                      child: Text(
                        "Thông báo",
                        style: AppTextStyle.title
                            .copyWith(overflow: TextOverflow.visible),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  height: 20,
                  color: AppColor.colorOfDrawer,
                ),
                Text(
                  "${index+1} Nội dung Nội dung Nội dung Nội dung Nội dung Nội dung Nội dung Nội dung Nội dung Nội dung Nội dung Nội dung Nội dung Nội dung Nội dung Nội dung ",
                  style: AppTextStyle.normal
                      .copyWith(overflow: TextOverflow.visible),
                ),

              ],
            ),
          ),
        )
    ),
  );
}