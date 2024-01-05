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
  final TextEditingController hoTenTextEditingController = TextEditingController();
  final TextEditingController chucVuTextEditingController = TextEditingController();
  final TextEditingController noiCongTacTextEditingController = TextEditingController();
  final TextEditingController soDienThoaiTextEditingController = TextEditingController();
  final TextEditingController emailTextEditingController = TextEditingController();
  final TextEditingController moiQuanHeTextEditingController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    hoTenTextEditingController.text= widget.data.hoTen.replaceWhenNullOrWhiteSpace();
    chucVuTextEditingController.text= widget.data.chucVu.replaceWhenNullOrWhiteSpace();
    noiCongTacTextEditingController.text= widget.data.noiCongTac.replaceWhenNullOrWhiteSpace();
    soDienThoaiTextEditingController.text= widget.data.soDienThoai.replaceWhenNullOrWhiteSpace();
    emailTextEditingController.text= widget.data.email.replaceWhenNullOrWhiteSpace();
    moiQuanHeTextEditingController.text= widget.data.moiQuanHe.replaceWhenNullOrWhiteSpace();
    super.initState();
  }
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: DefaultTextFormField(
                        icon: FontAwesomeIcons.user,
                        controller: hoTenTextEditingController,
                        hintText: "Họ và tên",
                        labelText: "Họ và tên",
                        helperText: "Ví dụ: Nguyễn Văn A",
                        required: true,
                        validator: (value){
                          widget.data.hoTen = value;
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20,top: 15),
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
                  controller: chucVuTextEditingController,
                  hintText: "Chức vụ",
                  labelText: "Chức vụ",
                  helperText: "Ví dụ: Nhân viên",
                  required: true,
                  validator: (value){
                    widget.data.chucVu = value;
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
                    widget.data.noiCongTac = value;
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
                    widget.data.soDienThoai = value;
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
                    widget.data.email = value;
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
                    widget.data.moiQuanHe = value;
                    return null;
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}