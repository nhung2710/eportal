import 'dart:math';

import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_elevation.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 20/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class NotificationDetailPage extends BasePage {
  const NotificationDetailPage({super.key});

  @override
  State<StatefulWidget> createState() => _NotificationDetailPageState();
}

class _NotificationDetailPageState
    extends BasePageState<NotificationDetailPage> {
  @override
  Widget pageUI(BuildContext context) => SingleChildScrollView(
        child: Card(
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
                        "Thông báo ${Random().nextInt(1000) + 1}",
                        style: AppTextStyle.title,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ],
                ),
                const Divider(
                  height: 20,
                  color: AppColor.colorOfDrawer,
                ),
                Text(
                  "${Random().nextInt(1000) + 1} ${List.generate(Random().nextInt(1000), (index) => "Nội dung").join(" - ")}",
                  style: AppTextStyle.normal,
                  overflow: TextOverflow.visible,
                ),
              ],
            ),
          ),
        ),
      );

  @override
  void callApi() {
    // TODO: implement callApi
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
  }

  @override
  void getMoreData() {
    // TODO: implement getMoreData
  }

  @override
  void initBloc() {
    // TODO: implement initBloc
  }

  @override
  void initDataLoading() {
    // TODO: implement initDataLoading
  }
}
