//
// Created by BlackRose on 28/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/base/page_widget/base_page_widget.dart';
import 'package:eportal/page/widget/default_button.dart';
import 'package:eportal/page/widget/default_capcha_text_form_field.dart';
import 'package:eportal/page/widget/default_text_form_field.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RequestSupportPage extends BasePageWidget {
  const RequestSupportPage({super.key});

  @override
  State<StatefulWidget> createState() => RequestSupportPageState();
}

class RequestSupportPageState extends BasePageState<RequestSupportPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController contentController = TextEditingController();

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

  }

  @override
  void initDataLoading() {
    // TODO: implement initDataLoading
  }


  @override
  PreferredSizeWidget? getAppBar(BuildContext context) => defaultTabBar();
  @override
  Widget pageUI(BuildContext context) => Container(
    margin: const EdgeInsets.all(10),
    child: ListView(
      shrinkWrap: true,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text(
            "Gửi yêu cầu hỗ trợ",
            style: AppTextStyle.titlePage.copyWith(
                overflow: TextOverflow.visible,
                fontSize: 18,
                color: AppColor.colorOfIconActive),
          ),
        ),
        DefaultTextFormField(
          icon: FontAwesomeIcons.user,
          hintText: "Họ và tên",
          labelText: "Họ và tên",
          helperText: "Ví dụ: Nguyễn Văn A",
        ),
        DefaultTextFormField(
          icon: FontAwesomeIcons.mobile,
          hintText: "Email",
          labelText: "Email",
          helperText: "Ví dụ: abc@gmail.com",
        ),
        DefaultTextFormField(
          icon: FontAwesomeIcons.mobileScreenButton,
          hintText: "Số điện thoại",
          labelText: "Số điện thoại",
          helperText: "Ví dụ: 0380000000",
        ),
        DefaultTextFormField(
          icon: FontAwesomeIcons.envelope,
          hintText: "Địa chỉ",
          labelText: "Địa chỉ",
          helperText: "Ví dụ: Số 1 ngách 1 ngõ 1 đường 1 quận 1 phường 1",
        ),
        DefaultTextFormField(
          icon: FontAwesomeIcons.noteSticky,
          maxLength: 1000,
          minLines: 5,
          maxLines: 10,
          hintText: "Ghi chú",
          labelText: "Ghi chú",
          helperText: "Ví dụ: abc",
        ),

        DefaultCapchaTextFormField(
          helperText: "Ví dụ: AAAAAA",
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: DefaultButton(
            onPressed: () => sendRequestSupport(),
            text: 'Gửi',

          ),
        ),
      ],
    ),
  );

  void sendRequestSupport() {
    showCenterMessage("Gửi yêu cầu thành công").then((value) => backPage());
  }

}