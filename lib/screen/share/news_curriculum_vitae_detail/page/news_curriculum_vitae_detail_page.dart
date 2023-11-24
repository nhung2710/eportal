import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_elevation.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/text_icon/text_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../extension/string_extension.dart';
import '../../../../model/api/response/common_new/data/home_job_user_list_data_response.dart';

//
// Created by BlackRose on 20/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class NewsCurriculumVitaeDetailPage extends BasePage {
  HomeJobUserListDataResponse homeJobUserListDataResponse;

  NewsCurriculumVitaeDetailPage({
    super.key,
    required this.homeJobUserListDataResponse,
  });

  @override
  State<StatefulWidget> createState() => _NewsCurriculumVitaeDetailPageState();
}

class _NewsCurriculumVitaeDetailPageState
    extends BasePageState<NewsCurriculumVitaeDetailPage> {
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
                TextIcon(
                  text: widget.homeJobUserListDataResponse.title.supportHtml(),
                  icon: FontAwesomeIcons.tags,
                  textStyle: AppTextStyle.title
                      .copyWith(color: Colors.black, fontSize: 12),
                  isHasBorder: false,
                ),
                TextIcon(
                  text: widget.homeJobUserListDataResponse.education
                      .supportHtml(),
                  icon: FontAwesomeIcons.graduationCap,
                  textStyle: AppTextStyle.title
                      .copyWith(color: Colors.black, fontSize: 12),
                  isHasBorder: false,
                ),
                TextIcon(
                  text: widget.homeJobUserListDataResponse.careerGoals
                      .supportHtml(),
                  icon: FontAwesomeIcons.clockRotateLeft,
                  textStyle: AppTextStyle.title
                      .copyWith(color: Colors.black, fontSize: 12),
                  isHasBorder: false,
                ),
                TextIcon(
                  text: widget.homeJobUserListDataResponse.skillsForte
                      .supportHtml(),
                  icon: FontAwesomeIcons.globe,
                  textStyle: AppTextStyle.title
                      .copyWith(color: Colors.black, fontSize: 12),
                  isHasBorder: false,
                ),
                TextIcon(
                  text: widget.homeJobUserListDataResponse.workExperience
                      .supportHtml(),
                  icon: FontAwesomeIcons.bullseye,
                  textStyle: AppTextStyle.title
                      .copyWith(color: AppColor.colorOfIcon, fontSize: 14),
                  isHasBorder: false,
                ),
              ],
            ),
          ),
        ),
      );

  @override
  String getPageTitle(BuildContext context) =>
      widget.homeJobUserListDataResponse.title.replaceWhenNullOrWhiteSpace();
}
