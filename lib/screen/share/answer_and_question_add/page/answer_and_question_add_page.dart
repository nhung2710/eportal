import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/input/capcha_input.dart';
import 'package:eportal/widget/input/field_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/common_new/faq_add_question_bloc.dart';
import '../../../../event/common_new/faq_add_question_event.dart';
import '../../../../extension/string_extension.dart';
import '../../../../model/api/request/common_new/data/faq_add_question_data_request.dart';
import '../../../../model/api/request/common_new/faq_add_question_request.dart';
import '../../../../model/api/response/common_new/data/faq_add_question_data_response.dart';
import '../../../../widget/default_button/default_button.dart';

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
  FaqAddQuestionBloc faqAddQuestionBloc = FaqAddQuestionBloc();

  @override
  String getPageTitle(BuildContext context) => "Gửi câu hỏi";

  @override
  Color currentBackgroundColor(BuildContext context) => Colors.white;

  @override
  Widget pageUI(BuildContext context) => BlocProvider(
        create: (_) => faqAddQuestionBloc,
        child: BlocListener<FaqAddQuestionBloc,
            DataSingleState<FaqAddQuestionDataResponse>>(
          listener: (BuildContext context,
              DataSingleState<FaqAddQuestionDataResponse> state) {
            handlerActionDataSingleState<FaqAddQuestionDataResponse>(state,
                (obj) async {
              showCenterMessage("Bạn đã gửi câu hỏi thành công")
                  .then((value) => backPage());
            });
          },
          child: SingleChildScrollView(
            child: ListView(
              shrinkWrap: true,
              children: [
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
                      if (text.isNullOrWhiteSpace()) {
                        return 'Nội dung không được để trống';
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
                    child: DefaultButton(
                      text: 'Gửi',
                      onPressed: () => _send(context),
                    )),
              ],
            ),
          ),
        ),
      );

  _send(BuildContext context) {
    if (isValid()) {
      faqAddQuestionBloc.add(FaqAddQuestionEvent(
          request: FaqAddQuestionRequest(
              obj: FaqAddQuestionDataRequest(
                  hoTen: fullNameController.text,
                  email: emailController.text,
                  noiDung: contentController.text,
                  phone: phoneController.text))));
    }
  }
}
