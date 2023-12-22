import 'package:eportal/model/api/response/admin/data/job_user_list_by_user_name_data_response.dart';
import 'package:flutter/material.dart';

import '../../../../extension/string_extension.dart';
import '../../../../widget/base/base_page.dart';
import '../../../../widget/input/field_input.dart';

//
// Created by BlackRose on 29/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class ProfileEditLevelTab extends BasePage {
  JobUserListByUserNameDataResponse data;

  ProfileEditLevelTab({super.key, required this.data});

  @override
  State<StatefulWidget> createState() => ProfileEditLevelTabState();
}

class ProfileEditLevelTabState
    extends BaseScreenStateActive<ProfileEditLevelTab> {
  TextEditingController educationController = TextEditingController();

  @override
  void initDataLoading() {}

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
    educationController.text =
        widget.data.education.supportHtml();
  }

  @override
  Widget pageUI(BuildContext context) => ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: FieldInput(
              controller: educationController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.multiline,
              maxLength: 2000,
              minLines: 20,
              maxLines: 50,
              icon: Icons.description,
              hintText: "Trình độ học vấn",
            ),
          ),
        ],
      );
}
