import 'package:eportal/model/api/response/common_new/data/work_search_data_response.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_elevation.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/button/phone_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../extension/string_extension.dart';
import '../../../../widget/button/email_button.dart';
import '../../../../widget/text_icon/text_icon.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class WorkSearchDetailPage extends BasePage {
  WorkSearchDataResponse workSearchDataResponse;

  WorkSearchDetailPage({
    super.key,
    required this.workSearchDataResponse,
  });

  @override
  State<StatefulWidget> createState() => _WorkSearchDetailPageState();
}

class _WorkSearchDetailPageState extends BasePageState<WorkSearchDetailPage> {
  @override
  Widget pageUI(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: [
            Card(
              elevation: AppElevation.sizeOfNormal,
              color: AppColor.colorOfApp,
              shadowColor: AppColor.colorOfIcon,
              borderOnForeground: true,
              shape: const RoundedRectangleBorder(
                  side: BorderSide(color: AppColor.colorOfDrawer, width: 0.1),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextIcon(
                    text: widget.workSearchDataResponse.title,
                    icon: FontAwesomeIcons.tags,
                    textStyle: AppTextStyle.title
                        .copyWith(color: Colors.black, fontSize: 12),
                    isHasBorder: false,
                  ),
                  TextIcon(
                    text: widget.workSearchDataResponse.description,
                    icon: FontAwesomeIcons.briefcase,
                    textStyle: AppTextStyle.title
                        .copyWith(color: Colors.black, fontSize: 12),
                    isHasBorder: false,
                  ),
                  TextIcon(
                    text: widget.workSearchDataResponse.ages,
                    icon: FontAwesomeIcons.child,
                    textStyle: AppTextStyle.title
                        .copyWith(color: Colors.black, fontSize: 12),
                    isHasBorder: false,
                  ),
                  TextIcon(
                    text: widget.workSearchDataResponse.workTime,
                    icon: FontAwesomeIcons.businessTime,
                    textStyle: AppTextStyle.title
                        .copyWith(color: Colors.black, fontSize: 12),
                    isHasBorder: false,
                  ),
                  TextIcon(
                    text: widget.workSearchDataResponse.requirement,
                    icon: FontAwesomeIcons.bookmark,
                    textStyle: AppTextStyle.title
                        .copyWith(color: Colors.red, fontSize: 16),
                    isHasBorder: false,
                  ),
                  TextIcon(
                    text: widget.workSearchDataResponse.requirementsProfile,
                    icon: FontAwesomeIcons.folderPlus,
                    textStyle: AppTextStyle.title
                        .copyWith(color: Colors.black, fontSize: 12),
                    isHasBorder: false,
                  ),
                  TextIcon(
                    text: widget.workSearchDataResponse.benefit,
                    icon: FontAwesomeIcons.thumbsUp,
                    textStyle: AppTextStyle.title
                        .copyWith(color: Colors.blue, fontSize: 16),
                    isHasBorder: false,
                  ),
                  TextIcon(
                    text: widget.workSearchDataResponse.contactUser,
                    icon: FontAwesomeIcons.addressBook,
                    textStyle: AppTextStyle.title
                        .copyWith(color: Colors.black, fontSize: 12),
                    isHasBorder: false,
                  ),
                  TextIcon(
                    text: widget.workSearchDataResponse.contactAddress,
                    icon: FontAwesomeIcons.locationDot,
                    textStyle: AppTextStyle.title
                        .copyWith(color: Colors.black, fontSize: 12),
                    isHasBorder: false,
                  ),
                ],
              ),
            ),
            PhoneButton(phone: widget.workSearchDataResponse.contactMobile),
            EmailButton(email: widget.workSearchDataResponse.contactEmail),
          ],
        ),
      );

  @override
  String getPageTitle(BuildContext context) => "Chi tiết";
}
