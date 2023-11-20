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
class ContractPage extends BasePage {
  const ContractPage({super.key});

  @override
  State<StatefulWidget> createState() => _ContractPageState();
}

class _ContractPageState extends BasePageState<ContractPage> {
  TextEditingController textEditingController = TextEditingController();

  @override
  String getPageTitle(BuildContext context) => "Liên hệ";

  @override
  Widget pageUI(BuildContext context) => Card(
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Text(
                          "Tên công ty",
                          style: AppTextStyle.title
                              .copyWith(overflow: TextOverflow.visible),
                        )),
                    const VerticalDivider(
                      thickness: 2,
                      width: 5,
                      color: Colors.transparent,
                    ),
                    Expanded(
                        flex: 3,
                        child: GestureDetector(
                          onTap: () => _launchHotline("02963831123"),
                          child: Text(
                            "TRUNG TÂM DỊCH VỤ VIỆC LÀM TỈNH HÒA BÌNH",
                            textAlign: TextAlign.end,
                            style: AppTextStyle.title.copyWith(
                                overflow: TextOverflow.visible,
                                color: AppColor.colorOfIcon),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Text(
                          "Địa chỉ",
                          style: AppTextStyle.title
                              .copyWith(overflow: TextOverflow.visible),
                        )),
                    Expanded(
                        flex: 3,
                        child: GestureDetector(
                          onTap: () => _launchHotline("02963831123"),
                          child: Text(
                            "570 đường Trần Hưng Đạo, Hòa Bình, Vietnam",
                            textAlign: TextAlign.end,
                            style: AppTextStyle.title.copyWith(
                                overflow: TextOverflow.visible,
                                color: AppColor.colorOfIcon),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Text(
                          "Số điện thoại",
                          style: AppTextStyle.title
                              .copyWith(overflow: TextOverflow.visible),
                        )),
                    Expanded(
                        flex: 3,
                        child: GestureDetector(
                          onTap: () => _launchHotline("0943305444"),
                          child: Text(
                            "094 330 54 44",
                            textAlign: TextAlign.end,
                            style: AppTextStyle.title.copyWith(
                                overflow: TextOverflow.visible,
                                color: AppColor.colorOfIcon),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Text(
                          "Email",
                          style: AppTextStyle.title
                              .copyWith(overflow: TextOverflow.visible),
                        )),
                    Expanded(
                        flex: 3,
                        child: GestureDetector(
                          onTap: () =>
                              _launchEmail("vieclamhoabinh.media@gmail.com"),
                          child: Text(
                            "vieclamhoabinh.media@gmail.com",
                            textAlign: TextAlign.end,
                            style: AppTextStyle.title.copyWith(
                                overflow: TextOverflow.visible,
                                color: AppColor.colorOfIcon),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Text(
                          "Website",
                          style: AppTextStyle.title
                              .copyWith(overflow: TextOverflow.visible),
                        )),
                    Expanded(
                        flex: 3,
                        child: GestureDetector(
                          onTap: () => _launchWeb("www.eportal.top"),
                          child: Text(
                            "www.eportal.top",
                            textAlign: TextAlign.end,
                            style: AppTextStyle.title.copyWith(
                                overflow: TextOverflow.visible,
                                color: AppColor.colorOfIcon),
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
                          "Facebook",
                          style: AppTextStyle.title
                              .copyWith(overflow: TextOverflow.visible),
                        )),
                    Expanded(
                        flex: 3,
                        child: GestureDetector(
                          onTap: () => _launchEmail(
                              "Trung tâm Dịch vụ việc làm Hòa Bình"),
                          child: Text(
                            "Trung tâm Dịch vụ việc làm Hòa Bình",
                            textAlign: TextAlign.end,
                            style: AppTextStyle.title.copyWith(
                                overflow: TextOverflow.visible,
                                color: AppColor.colorOfIcon),
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
                          "Zalo",
                          style: AppTextStyle.title
                              .copyWith(overflow: TextOverflow.visible),
                        )),
                    Expanded(
                        flex: 3,
                        child: GestureDetector(
                          onTap: () => _launchEmail(
                              "Trung tâm Dịch vụ việc làm Hòa Bình"),
                          child: Text(
                            textAlign: TextAlign.end,
                            "Trung tâm Dịch vụ việc làm Hòa Bình",
                            style: AppTextStyle.title.copyWith(
                                overflow: TextOverflow.visible,
                                color: AppColor.colorOfIcon),
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  void _launchHotline(String hotline) {
    launchUrl(Uri(scheme: 'tel', path: hotline));
  }

  void _launchEmail(String email) {
    launchUrl(
        Uri(scheme: 'mailto', path: '${email}subject=Yêu cầu hỗ trợ&body='));
  }

  void _launchWeb(String website) {
    launchUrl(Uri.parse(website));
  }
}
