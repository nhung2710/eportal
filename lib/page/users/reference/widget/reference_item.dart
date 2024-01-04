//
// Created by BlackRose on 04/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//
import 'package:eportal/model/api/request/admin/data/job_user_refer_add_data_request.dart';
import 'package:eportal/page/widget/default_card_item.dart';
import 'package:eportal/page/widget/default_text_form_field.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_size_icon.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../extension/string_extension.dart';

class ReferenceItem extends StatefulWidget{
  final JobUserReferAddDataRequest data;
  final ValueChanged<JobUserReferAddDataRequest> onClickItem;
  final ValueChanged<JobUserReferAddDataRequest> onDeleteItem;

  const ReferenceItem({super.key,required this.data,required this.onClickItem,required this.onDeleteItem});


  @override
  State<StatefulWidget> createState() => ReferenceItemState();
}

class ReferenceItemState extends State<ReferenceItem>{
  @override
  Widget build(BuildContext context) => DefaultCardItem(
    onTap: ()=> widget.onClickItem(widget.data),
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal:  10,vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: DefaultTextFormField(
                        icon: FontAwesomeIcons.user,
                        hintText: "Họ và tên",
                        labelText: "Họ và tên",
                        helperText: "Ví dụ: Nguyễn Văn A",
                        required: true,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: GestureDetector(
                        onTap: ()=> widget.onDeleteItem(widget.data),
                        child: const Icon(FontAwesomeIcons.xmark,
                          color: Colors.red,
                          size: AppSizeIcon.sizeOfNormal,),
                      ),
                    )
                  ],
                ),
                DefaultTextFormField(
                  icon: FontAwesomeIcons.user,
                  hintText: "Chức vụ",
                  labelText: "Chức vụ",
                  helperText: "Ví dụ: Nhân viên",
                  required: true,
                ),
                DefaultTextFormField(
                  icon: FontAwesomeIcons.user,
                  hintText: "Nơi công tác",
                  labelText: "Nơi công tác",
                  helperText: "Ví dụ: Công ty A",
                  required: true,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}