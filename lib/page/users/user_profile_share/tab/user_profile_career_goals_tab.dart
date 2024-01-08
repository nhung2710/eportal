//
// Created by BlackRose on 05/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//

import 'package:eportal/model/api/response/admin/data/job_user_list_by_user_name_data_response.dart';
import 'package:eportal/page/base/page_state/base_page_keep_state.dart';
import 'package:eportal/page/widget/default_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../extension/string_extension.dart';

class UserProfileCareerGoalsTab extends StatefulWidget {
  final JobUserListByUserNameDataResponse? data;

  const UserProfileCareerGoalsTab({super.key, this.data});

  @override
  State<StatefulWidget> createState() => UserProfileCareerGoalsTabState();
}

class UserProfileCareerGoalsTabState
    extends BasePageKeepState<UserProfileCareerGoalsTab> {
  TextEditingController objectiveController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
    if (widget.data != null) {
      objectiveController.text = widget.data!.careerGoals.supportHtml();
    }
  }

  @override
  void initDataLoading() {
    // TODO: implement initDataLoading
  }

  @override
  Widget pageUI(BuildContext context) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            Expanded(
              child: DefaultTextFormField(
                icon: FontAwesomeIcons.tag,
                controller: objectiveController,
                maxLines: 40,
                minLines: 40,
                maxLength: 1000,
                hintText: "Mục tiêu nghề nghiệp",
                labelText: "Mục tiêu nghề nghiệp",
                helperText: "Ví dụ: làm việc",
                required: true,
                validator: (value) {
                  return null;
                },
              ),
            ),
          ],
        ),
      );
}
