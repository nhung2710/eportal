import 'package:eportal/model/api/response/common_new/data/work_search_data_response.dart';
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
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextIcon(
              text: widget.workSearchDataResponse.title,
              icon: FontAwesomeIcons.tags,
            ),
            TextIcon(
              text: widget.workSearchDataResponse.description,
              icon: FontAwesomeIcons.briefcase,
            ),
            TextIcon(
              text: widget.workSearchDataResponse.ages,
              icon: FontAwesomeIcons.child,
            ),
            TextIcon(
              text: widget.workSearchDataResponse.workTime,
              icon: FontAwesomeIcons.businessTime,
            ),
            TextIcon(
              text: widget.workSearchDataResponse.requirement,
              icon: FontAwesomeIcons.bookmark,
            ),
            TextIcon(
              text: widget.workSearchDataResponse.requirementsProfile,
              icon: FontAwesomeIcons.folderPlus,
            ),
            TextIcon(
              text: widget.workSearchDataResponse.benefit,
              icon: FontAwesomeIcons.thumbsUp,
            ),
            TextIcon(
              text: widget.workSearchDataResponse.contactUser,
              icon: FontAwesomeIcons.addressBook,
            ),
            TextIcon(
              text: widget.workSearchDataResponse.contactAddress,
              icon: FontAwesomeIcons.locationDot,
            ),
            PhoneButton(phone: widget.workSearchDataResponse.contactMobile),
            EmailButton(email: widget.workSearchDataResponse.contactEmail),
          ],
        ),
      );

  @override
  String getPageTitle(BuildContext context) =>
      widget.workSearchDataResponse.title.supportHtml();
}
