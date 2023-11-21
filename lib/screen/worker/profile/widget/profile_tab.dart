import 'dart:math';

import 'package:eportal/style/app_elevation.dart';
import 'package:flutter/material.dart';

import '../../../../style/app_color.dart';
import '../../../../style/app_text_style.dart';
import '../../../../widget/base/base_page.dart';
import '../../../../widget/expandable_fab/expandable_fab.dart';
import '../../profile_add/page/profile_add_page.dart';
import '../../profile_edit/page/profile_edit_page.dart';

//
// Created by BlackRose on 20/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class ProfileTab extends BasePage {
  const ProfileTab({super.key});

  @override
  State<StatefulWidget> createState() => _ProfileTabState();
}

class _ProfileTabState extends BasePageStateActive<ProfileTab> {
  @override
  bool isHasAppBar(BuildContext context) => false;

  @override
  Widget? getFloatingActionButton(BuildContext context) =>
      ExpandableFab(initNumberGroup: 1, children: [
        ActionButton(
          icon: const Icon(Icons.add, color: Colors.white),
          onPressed: () {
            loadDataDemo()
                .then((value) => nextPage((context) => const ProfileAddPage()));
          },
        ),
      ]);

  @override
  Widget pageUI(BuildContext context) => SingleChildScrollView(
        child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: Random().nextInt(10) + 1,
            itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    loadDataDemo().then((value) =>
                        nextPage((context) => const ProfileEditPage()));
                  },
                  child: Card(
                    elevation: AppElevation.sizeOfNormal,
                    color: AppColor.colorOfApp,
                    shadowColor: AppColor.colorOfIcon,
                    borderOnForeground: false,
                    margin: const EdgeInsets.all(5),
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(
                            color: AppColor.colorOfDrawer, width: 0.2),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                  flex: 3,
                                  child: Text(
                                    "Tên",
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
                                  child: Text(
                                    "Nguyễn Văn A",
                                    style: AppTextStyle.title.copyWith(
                                        overflow: TextOverflow.visible,
                                        color: AppColor.colorOfIcon),
                                  )),
                            ],
                          ),
                          const Divider(
                            height: 20,
                            color: AppColor.colorOfDrawer,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                  flex: 3,
                                  child: Text(
                                    "Năm sinh",
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
                                  child: Text(
                                    "${Random().nextInt(20) + 1990}",
                                    style: AppTextStyle.title.copyWith(
                                        overflow: TextOverflow.visible,
                                        color: AppColor.colorOfIcon),
                                  )),
                            ],
                          ),
                          const Divider(
                            height: 20,
                            color: AppColor.colorOfDrawer,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                  flex: 3,
                                  child: Text(
                                    "Địa chỉ",
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
                                  child: Text(
                                    "abc ngõ abc đường abc phường abc quận abc thành phố ABC",
                                    style: AppTextStyle.title.copyWith(
                                        overflow: TextOverflow.visible,
                                        color: AppColor.colorOfIcon),
                                  )),
                            ],
                          ),
                          const Divider(
                            height: 20,
                            color: AppColor.colorOfDrawer,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                  flex: 3,
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
                                  child: Text(
                                    "abc@gmail.com",
                                    style: AppTextStyle.title.copyWith(
                                        overflow: TextOverflow.visible,
                                        color: AppColor.colorOfIcon),
                                  )),
                            ],
                          ),
                          const Divider(
                            height: 20,
                            color: AppColor.colorOfDrawer,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                  flex: 3,
                                  child: Text(
                                    "Điện thoại",
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
                                  child: Text(
                                    "0386110030",
                                    style: AppTextStyle.title.copyWith(
                                        overflow: TextOverflow.visible,
                                        color: AppColor.colorOfIcon),
                                  )),
                            ],
                          ),
                          const Divider(
                            height: 20,
                            color: AppColor.colorOfDrawer,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                  flex: 3,
                                  child: Text(
                                    "Ngành nghề",
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
                                  child: Text(
                                    "IT",
                                    style: AppTextStyle.title.copyWith(
                                        overflow: TextOverflow.visible,
                                        color: AppColor.colorOfIcon),
                                  )),
                            ],
                          ),
                          const Divider(
                            height: 20,
                            color: AppColor.colorOfDrawer,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                  flex: 3,
                                  child: Text(
                                    "Chuyên môn",
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
                                  child: Text(
                                    "C#, Java, Javascipt",
                                    style: AppTextStyle.title.copyWith(
                                        overflow: TextOverflow.visible,
                                        color: AppColor.colorOfIcon),
                                  )),
                            ],
                          ),
                          const Divider(
                            height: 20,
                            color: AppColor.colorOfDrawer,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                  flex: 3,
                                  child: Text(
                                    "Kinh nghiệm",
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
                                  child: Text(
                                    "${Random().nextInt(16) + 1} năm",
                                    style: AppTextStyle.title.copyWith(
                                        overflow: TextOverflow.visible,
                                        color: AppColor.colorOfIcon),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
      );
}
