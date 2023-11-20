import 'package:eportal/screen/share/work_search/page/work_search_page.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_elevation.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/expandable_fab/expandable_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Text(
                          "Trình độ học vấn",
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
                        child: Text(
                          widget.homeJobUserListDataResponse.education
                              .replaceWhenNullOrWhiteSpace(),
                          overflow: TextOverflow.visible,
                          style: AppTextStyle.title
                              .copyWith(color: AppColor.colorOfIcon),
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
                          "Kinh nghiệm làm việc",
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
                        child: Text(
                          widget.homeJobUserListDataResponse.careerGoals
                              .replaceWhenNullOrWhiteSpace(),
                          overflow: TextOverflow.visible,
                          style: AppTextStyle.title
                              .copyWith(color: AppColor.colorOfIcon),
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
                          "Mục tiêu",
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
                        child: Text(
                          widget.homeJobUserListDataResponse.workExperience
                              .replaceWhenNullOrWhiteSpace(),
                          overflow: TextOverflow.visible,
                          style: AppTextStyle.title
                              .copyWith(color: AppColor.colorOfIcon),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  @override
  String getPageTitle(BuildContext context) =>
      widget.homeJobUserListDataResponse.title.replaceWhenNullOrWhiteSpace();
}
