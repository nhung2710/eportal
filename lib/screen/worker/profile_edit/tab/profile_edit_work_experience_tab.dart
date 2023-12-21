import 'package:eportal/model/api/response/admin/data/job_user_list_by_user_name_data_response.dart';
import 'package:flutter/material.dart';

import '../../../../extension/string_extension.dart';
import '../../../../widget/base/base_page.dart';
import '../../../../widget/input/field_input.dart';

//
// Created by BlackRose on 29/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class ProfileEditWorkExperienceTab extends BasePage {
  JobUserListByUserNameDataResponse data;

  ProfileEditWorkExperienceTab({super.key, required this.data});

  @override
  State<StatefulWidget> createState() => ProfileEditWorkExperienceTabState();
}

class ProfileEditWorkExperienceTabState
    extends BaseScreenStateActive<ProfileEditWorkExperienceTab> {
  TextEditingController experienceController = TextEditingController();

  @override
  void initDataLoading() {
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
    experienceController.text =
        widget.data.workExperience.replaceWhenNullOrWhiteSpace();
  }

  @override
  Widget pageUI(BuildContext context) => ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: FieldInput(
              controller: experienceController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.multiline,
              maxLength: 2000,
              minLines: 20,
              maxLines: 50,
              icon: Icons.description,
              hintText: "Kinh nghiệm làm việc",
            ),
          ),
        ],
      );

}
