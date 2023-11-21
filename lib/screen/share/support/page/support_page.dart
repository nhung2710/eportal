import 'package:eportal/style/app_elevation.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../style/app_color.dart';

//
// Created by BlackRose on 11/7/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class SupportPage extends BasePage {
  const SupportPage({super.key});

  @override
  State<StatefulWidget> createState() => _SupportPageState();
}

class _SupportPageState extends BasePageState<SupportPage> {
  TextEditingController textEditingController = TextEditingController();

  @override
  String getPageTitle(BuildContext context) => "Hỗ trợ";

  @override
  Widget pageUI(BuildContext context) => DefaultTabController(
        key: localKey,
        length: 2,
        child: Column(
          children: [
            const TabBar(
              indicatorColor: AppColor.colorOfIcon,
              unselectedLabelColor: AppColor.colorOfIcon,
              labelColor: AppColor.colorOfIcon,
              indicatorWeight: 1,
              tabs: [
                Tab(
                  text: "Nhà tuyển dụng",
                ),
                Tab(
                  text: "Người tìm việc",
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Card(
                          elevation: AppElevation.sizeOfNormal,
                          color: AppColor.colorOfApp,
                          shadowColor: AppColor.colorOfIcon,
                          borderOnForeground: false,
                          margin: const EdgeInsets.all(5),
                          shape: const RoundedRectangleBorder(
                              side: BorderSide(
                                  color: AppColor.colorOfDrawer, width: 0.2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                          flex: 1,
                                          child: Text(
                                            "Hotline",
                                            style: AppTextStyle.title.copyWith(
                                                overflow: TextOverflow.visible),
                                          )),
                                      const VerticalDivider(
                                        thickness: 2,
                                        width: 5,
                                        color: Colors.transparent,
                                      ),
                                      Expanded(
                                          flex: 4,
                                          child: GestureDetector(
                                            onTap: () =>
                                                _launchHotline("02963831123"),
                                            child: Text(
                                              "02963.831.123",
                                              style: AppTextStyle.title
                                                  .copyWith(
                                                      overflow:
                                                          TextOverflow.visible,
                                                      color:
                                                          AppColor.colorOfIcon),
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                                const Divider(
                                  height: 1,
                                  color: AppColor.colorOfDrawer,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                          flex: 1,
                                          child: Text(
                                            "Email",
                                            style: AppTextStyle.title.copyWith(
                                                overflow: TextOverflow.visible),
                                          )),
                                      const VerticalDivider(
                                        thickness: 2,
                                        width: 5,
                                        color: Colors.transparent,
                                      ),
                                      Expanded(
                                          flex: 4,
                                          child: GestureDetector(
                                            onTap: () => _launchEmail(
                                                "vieclamhoabinh@gmail.com@gmail.com"),
                                            child: Text(
                                              "vieclamhoabinh@gmail.com@gmail.com",
                                              style: AppTextStyle.title
                                                  .copyWith(
                                                      overflow:
                                                          TextOverflow.visible,
                                                      color:
                                                          AppColor.colorOfIcon),
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Card(
                          elevation: AppElevation.sizeOfNormal,
                          color: AppColor.colorOfApp,
                          shadowColor: AppColor.colorOfIcon,
                          borderOnForeground: false,
                          margin: const EdgeInsets.all(5),
                          shape: const RoundedRectangleBorder(
                              side: BorderSide(
                                  color: AppColor.colorOfDrawer, width: 0.2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                          flex: 1,
                                          child: Text(
                                            "Hotline",
                                            style: AppTextStyle.title.copyWith(
                                                overflow: TextOverflow.visible),
                                          )),
                                      const VerticalDivider(
                                        thickness: 2,
                                        width: 5,
                                        color: Colors.transparent,
                                      ),
                                      Expanded(
                                          flex: 4,
                                          child: GestureDetector(
                                            onTap: () =>
                                                _launchHotline("02963853566"),
                                            child: Text(
                                              "02963.853.566",
                                              style: AppTextStyle.title
                                                  .copyWith(
                                                      overflow:
                                                          TextOverflow.visible,
                                                      color:
                                                          AppColor.colorOfIcon),
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                                const Divider(
                                  height: 1,
                                  color: AppColor.colorOfDrawer,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                          flex: 1,
                                          child: Text(
                                            "Email",
                                            style: AppTextStyle.title.copyWith(
                                                overflow: TextOverflow.visible),
                                          )),
                                      const VerticalDivider(
                                        thickness: 2,
                                        width: 5,
                                        color: Colors.transparent,
                                      ),
                                      Expanded(
                                          flex: 4,
                                          child: GestureDetector(
                                            onTap: () => _launchEmail(
                                                "vieclamhoabinh@gmail.com@gmail.com"),
                                            child: Text(
                                              "vieclamhoabinh@gmail.com@gmail.com",
                                              style: AppTextStyle.title
                                                  .copyWith(
                                                      overflow:
                                                          TextOverflow.visible,
                                                      color:
                                                          AppColor.colorOfIcon),
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );

  void _launchHotline(String hotline) {
    launchUrl(Uri(scheme: 'tel', path: hotline));
  }

  void _launchEmail(String email) {
    launchUrl(
        Uri(scheme: 'mailto', path: '${email}subject=Yêu cầu hỗ trợ&body='));
  }
}
