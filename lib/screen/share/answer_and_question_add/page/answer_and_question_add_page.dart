import 'package:eportal/application/global_application.dart';
import 'package:eportal/constant/application_constant.dart';
import 'package:eportal/screen/share/answer_and_question/widget/answer_and_question_item.dart';
import 'package:eportal/screen/share/sign_in/page/sign_in_page.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/input/capcha_input.dart';
import 'package:eportal/widget/input/field_input.dart';
import 'package:eportal/widget/input/password_input.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class AnswerAndQuestionAddPage extends BasePage {
  const AnswerAndQuestionAddPage({super.key});

  @override
  State<StatefulWidget> createState() => _AnswerAndQuestionAddPageState();
}

class _AnswerAndQuestionAddPageState
    extends BasePageState<AnswerAndQuestionAddPage> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  bool? isWorker = false;

  @override
  String getPageTitle(BuildContext context) => "Gửi câu hỏi";

  @override
  Color currentBackgroundColor(BuildContext context) => Colors.white;

  @override
  Widget pageUI(BuildContext context) => ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: FieldInput(
              controller: fullNameController,
              textInputAction: TextInputAction.next,
              hintText: "Họ và tên",
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Địa chỉ thư điện tử không được để trống';
                }
                return null;
              },
              icon: Icons.person,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: FieldInput(
              controller: emailController,
              textInputAction: TextInputAction.next,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Địa chỉ thư điện tử không được để trống';
                }
                return null;
              },
              hintText: "Địa chỉ thư điện tử",
              icon: Icons.email,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: FieldInput(
              controller: phoneController,
              textInputAction: TextInputAction.next,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Số điện thoại không được để trống';
                }
                return null;
              },
              icon: Icons.smartphone,
              hintText: "Điện thoại",
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: FieldInput(
              controller: contentController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.multiline,
              maxLength: 500,
              minLines: 10,
              maxLines: 20,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Tài khoản không được để trống';
                }
                return null;
              },
              icon: Icons.description,
              hintText: "Nội dung",
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: CapchaInput(
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (value) => _send(context),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.colorOfIcon),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: const Text('Gửi'),
                ),
                onPressed: () => _send(context),
              )),
        ],
      );

  _send(BuildContext context) {
    if (isValid()) {}
  }
}
