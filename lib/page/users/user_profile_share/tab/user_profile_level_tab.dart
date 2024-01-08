//
// Created by BlackRose on 05/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//

import 'package:eportal/model/api/response/admin/data/job_user_list_by_user_name_data_response.dart';
import 'package:eportal/page/base/page_state/base_page_keep_state.dart';
import 'package:eportal/page/base/page_widget/base_page_widget.dart';
import 'package:eportal/page/widget/default_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../extension/string_extension.dart';

class UserProfileLevelTab extends BasePageWidget {
  final JobUserListByUserNameDataResponse? data;

  const UserProfileLevelTab({super.key, this.data});

  @override
  State<StatefulWidget> createState() => UserProfileLevelTabState();
}

class UserProfileLevelTabState extends BasePageKeepState<UserProfileLevelTab> {
  TextEditingController educationController = TextEditingController();

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
      educationController.text = widget.data!.education.supportHtml();
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
                controller: educationController,
                maxLines: 40,
                minLines: 40,
                maxLength: 1000,
                hintText: "Trình độ học vấn",
                labelText: "Trình độ học vấn",
                helperText: "Ví dụ: Tốt nghiệp đại học",
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
