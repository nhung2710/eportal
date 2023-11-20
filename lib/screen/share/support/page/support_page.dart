import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../extension/string_extension.dart';
import '../../../../style/app_color.dart';
import '../../../../widget/image/image_loading.dart';

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
  String email = "abc@gmail.com";
  String website = "www.abc.com.vn";
  String hotline = "0386110030";
  String companyName = "CÔNG TY TRÁCH NHIỆM HỮU HẠN MỘT THÀNH VIÊN A";
  String companyAddress =
      "số 1 ngách 2 ngõ 22 phố Nguyễn Văn A phường Nguyễn Văn B Quận A Thành phố C";

  @override
  String getPageTitle(BuildContext context) => "Hỗ trợ";

  @override
  Widget pageUI(BuildContext context) => Card(
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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                  flex: 3,
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
                  flex: 4,
                  child: Text(
                    companyName,
                    style: AppTextStyle.title.copyWith(
                        overflow: TextOverflow.visible,
                        color: AppColor.colorOfIcon),
                  )),
            ],
          ),
          const Divider(
            height: 50,
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
                    "Hotline",
                    style: AppTextStyle.title
                        .copyWith(overflow: TextOverflow.visible),
                  )),
              const VerticalDivider(
                thickness: 2,
                width: 5,
                color: Colors.transparent,
              ),
              Expanded(
                  flex: 4,
                  child: GestureDetector(
                    onTap: _launchHotline,
                    child: Text(
                      hotline,
                      style: AppTextStyle.title.copyWith(
                          overflow: TextOverflow.visible,
                          color: AppColor.colorOfIcon),
                    ),
                  )),
            ],
          ),
          const Divider(
            height: 50,
            color: AppColor.colorOfDrawer,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                  flex: 3,
                  child: Text(
                    "Địa chỉ",
                    style: AppTextStyle.title
                        .copyWith(overflow: TextOverflow.visible),
                  )),
              const VerticalDivider(
                thickness: 2,
                width: 5,
                color: Colors.transparent,
              ),
              Expanded(
                  flex: 4,
                  child: Text(
                    companyAddress,
                    style: AppTextStyle.title.copyWith(
                        overflow: TextOverflow.visible,
                        color: AppColor.colorOfIcon),
                  )),
            ],
          ),
          const Divider(
            height: 50,
            color: AppColor.colorOfDrawer,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                  flex: 3,
                  child: Text(
                    "Email",
                    style: AppTextStyle.title
                        .copyWith(overflow: TextOverflow.visible),
                  )),
              const VerticalDivider(
                thickness: 2,
                width: 5,
                color: Colors.transparent,
              ),
              Expanded(
                  flex: 4,
                  child: GestureDetector(
                    onTap: _launchEmail,
                    child: Text(
                      email,
                      style: AppTextStyle.title.copyWith(
                          overflow: TextOverflow.visible,
                          color: AppColor.colorOfIcon),
                    ),
                  )),
            ],
          ),
          const Divider(
            height: 50,
            color: AppColor.colorOfDrawer,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                  flex: 3,
                  child: Text(
                    '${"Website".replaceWhenNullOrWhiteSpace()}',
                    style: AppTextStyle.title
                        .copyWith(overflow: TextOverflow.visible),
                  )),
              const VerticalDivider(
                thickness: 2,
                width: 5,
                color: Colors.transparent,
              ),
              Expanded(
                  flex: 4,
                  child: GestureDetector(
                    onTap: _launchWeb,
                    child: Text(
                      website,
                      style: AppTextStyle.title.copyWith(
                          overflow: TextOverflow.visible,
                          color: AppColor.colorOfIcon),
                    ),
                  )),
            ],
          ),
        ],
      ),
    ),
  );

  void _launchHotline() {
    launchUrl(Uri(scheme: 'tel', path: hotline));
  }

  void _launchEmail() {
    launchUrl(
        Uri(scheme: 'mailto', path: '${email}subject=Yêu cầu hỗ trợ&body='));
  }

  void _launchWeb() {
    launchUrl(Uri.parse(website));
  }
}
