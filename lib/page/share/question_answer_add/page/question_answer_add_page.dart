//
// Created by BlackRose on 28/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:eportal/model/api/response/common_new/data/faq_add_question_data_response.dart';
import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/base/page_widget/base_page_widget.dart';
import 'package:eportal/page/widget/default_button.dart';
import 'package:eportal/page/widget/default_capcha_text_form_field.dart';
import 'package:eportal/page/widget/default_text_form_field.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../bloc/common_new/faq_add_question_bloc.dart';
import '../../../../event/common_new/faq_add_question_event.dart';
import '../../../../model/api/request/common_new/data/faq_add_question_data_request.dart';
import '../../../../model/api/request/common_new/faq_add_question_request.dart';
import '../../../../state/base/base_state.dart';

class QuestionAnswerAddPage extends BasePageWidget {
  const QuestionAnswerAddPage({super.key});

  @override
  State<StatefulWidget> createState() => QuestionAnswerAddPageState();
}

class QuestionAnswerAddPageState
    extends BasePageState<QuestionAnswerAddPage> {
  late FaqAddQuestionBloc faqAddQuestionBloc;
  FaqAddQuestionEvent faqAddQuestionEvent = FaqAddQuestionEvent(request: FaqAddQuestionRequest(obj: FaqAddQuestionDataRequest()));

  TextEditingController hoTenController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController noiDungController = TextEditingController();
  @override
  void initBloc() {
    faqAddQuestionBloc = FaqAddQuestionBloc();
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    faqAddQuestionBloc.close();
  }


  @override
  void getMoreData() {
    callApi();
  }

  @override
  void initDataLoading() {
  }

  @override
  PreferredSizeWidget? getAppBar(BuildContext context) => defaultTabBar();
  
  @override
  void callApi() {
    faqAddQuestionBloc.add(faqAddQuestionEvent);
  }


  @override
  Widget pageUI(BuildContext context) => BlocProvider(
    create: (_) => faqAddQuestionBloc,
    child: BlocListener<FaqAddQuestionBloc,
        DataSingleState<FaqAddQuestionDataResponse>>(
      listener: (BuildContext context, state) {
        handlerActionDataSingleState<FaqAddQuestionDataResponse>(state,
                (obj) async {
              showCenterMessage("Bạn đã gửi câu hỏi thành công")
                  .then((value) => backPage());
            });
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Text(
                "Gửi câu hỏi",
                style: AppTextStyle.titlePage.copyWith(
                    overflow: TextOverflow.visible,
                    fontSize: 18,
                    color: AppColor.colorOfIconActive),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  DefaultTextFormField(
                    icon: FontAwesomeIcons.user,
                    controller: hoTenController,
                    hintText: "Họ và tên",
                    labelText: "Họ và tên",
                    helperText: "Ví dụ: Nguyễn Văn A",
                    required: true,
                  ),
                  DefaultTextFormField(
                    icon: FontAwesomeIcons.envelope,
                    controller: emailController,
                    hintText: "Email",
                    labelText: "Email",
                    helperText: "Ví dụ: abc@gmail.com",
                    required: true,
                  ),
                  DefaultTextFormField(
                    icon: FontAwesomeIcons.mobileScreenButton,
                    controller: phoneController,
                    hintText: "Số điện thoại",
                    labelText: "Số điện thoại",
                    helperText: "Ví dụ: 0380000000",
                    required: true,
                  ),
                  DefaultTextFormField(
                    icon: FontAwesomeIcons.noteSticky,
                    controller: noiDungController,
                    maxLength: 1000,
                    minLines: 5,
                    maxLines: 10,
                    hintText: "Nội dung",
                    labelText: "Nội dung",
                    helperText: "Ví dụ: abc",
                    required: true,
                  ),

                  DefaultCapchaTextFormField(
                    helperText: "Ví dụ: AAAAAA",
                    onFieldSubmitted: (v)=> submitForm(),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: DefaultButton(
                      onPressed: () => submitForm(),
                      text: 'Tạo',

                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );

  void submitForm() {

    if (isValid()) {
      faqAddQuestionEvent.request.obj.hoTen = hoTenController.text;
      faqAddQuestionEvent.request.obj.email = emailController.text;
      faqAddQuestionEvent.request.obj.phone = phoneController.text;
      faqAddQuestionEvent.request.obj.noiDung = noiDungController.text;
      callApi();
    }
  }
}