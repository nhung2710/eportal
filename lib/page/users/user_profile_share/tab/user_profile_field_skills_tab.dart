

//
// Created by BlackRose on 05/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//

import 'package:eportal/model/api/request/admin/data/job_user_refer_add_data_request.dart';
import 'package:eportal/model/api/response/admin/data/job_user_list_by_user_name_data_response.dart';
import 'package:eportal/page/widget/default_card_item.dart';
import 'package:eportal/page/widget/default_text_form_field.dart';
import 'package:eportal/style/app_size_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../extension/string_extension.dart';



//
// Created by BlackRose on 05/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//

import 'package:eportal/model/api/request/admin/data/job_user_refer_add_data_request.dart';
import 'package:eportal/page/widget/default_card_item.dart';
import 'package:eportal/page/widget/default_text_form_field.dart';
import 'package:eportal/style/app_size_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../extension/string_extension.dart';

class UserProfileFieldSkillsTab extends StatefulWidget{

  final JobUserListByUserNameDataResponse? data;

  const UserProfileFieldSkillsTab({super.key,this.data});


  @override
  State<StatefulWidget> createState() => UserProfileFieldSkillsTabState();
}

class UserProfileFieldSkillsTabState extends State<UserProfileFieldSkillsTab>{
  final TextEditingController hoTenTextEditingController = TextEditingController();
  final TextEditingController chucVuTextEditingController = TextEditingController();
  final TextEditingController noiCongTacTextEditingController = TextEditingController();
  final TextEditingController soDienThoaiTextEditingController = TextEditingController();
  final TextEditingController emailTextEditingController = TextEditingController();
  final TextEditingController moiQuanHeTextEditingController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.symmetric(horizontal:  10,vertical: 5),
    child: Row(
      children: [
        Expanded(
          child: Column(
            children: [
              DefaultTextFormField(
                icon: FontAwesomeIcons.user,
                controller: chucVuTextEditingController,
                hintText: "Chức vụ",
                labelText: "Chức vụ",
                helperText: "Ví dụ: Nhân viên",
                required: true,
                validator: (value){
                  return null;
                },
              ),
              DefaultTextFormField(
                icon: FontAwesomeIcons.user,
                controller: noiCongTacTextEditingController,
                hintText: "Nơi công tác",
                labelText: "Nơi công tác",
                helperText: "Ví dụ: Công ty A",
                required: true,
                validator: (value){
                  return null;
                },
              ),
              DefaultTextFormField(
                icon: FontAwesomeIcons.user,
                controller: soDienThoaiTextEditingController,
                hintText: "Số điện thoại",
                labelText: "Số điện thoại",
                helperText: "Ví dụ: 000000000",
                required: true,
                validator: (value){
                  return null;
                },
              ),
              DefaultTextFormField(
                icon: FontAwesomeIcons.user,
                controller: emailTextEditingController,
                hintText: "Email",
                labelText: "Email",
                helperText: "Ví dụ: abc@gmail.com",
                required: true,
                validator: (value){
                  return null;
                },
              ),
              DefaultTextFormField(
                icon: FontAwesomeIcons.user,
                controller: moiQuanHeTextEditingController,
                hintText: "Mối quan hệ",
                labelText: "Mối quan hệ",
                helperText: "Ví dụ: Đồng nghiệp",
                required: true,
                validator: (value){
                  return null;
                },
              ),
            ],
          ),
        ),
      ],
    ),
  );
}