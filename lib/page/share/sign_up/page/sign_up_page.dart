//
// Created by BlackRose on 29/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/bloc/common_new/dang_ky_bloc.dart';
import 'package:eportal/bloc/common_new/dang_nhap_bloc.dart';
import 'package:eportal/enum/data_bloc_status.dart';
import 'package:eportal/event/common_new/dang_ky_event.dart';
import 'package:eportal/event/common_new/dang_nhap_event.dart';
import 'package:eportal/model/api/request/common_new/dang_ky_request.dart';
import 'package:eportal/model/api/request/common_new/data/dang_ky_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/dang_nhap_data_request.dart';
import 'package:eportal/model/api/response/common_new/data/dang_ky_data_response.dart';
import 'package:eportal/page/anonymous/default/page/default_page.dart';
import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/base/page_widget/base_page_widget.dart';
import 'package:eportal/page/widget/default_capcha_text_form_field.dart';
import 'package:eportal/page/widget/default_text_form_field.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/default_button/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpPage extends BasePageWidget {
  const SignUpPage({super.key});

  @override
  State<StatefulWidget> createState() => SignUpPageState();
}

class SignUpPageState
    extends BasePageState<SignUpPage> {
  late DangKyBloc dangKyBloc;
  DangKyEvent dangKyEvent = DangKyEvent(request: DangKyRequest(obj: DangKyDataRequest()));

  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  @override
  void initBloc() {
    dangKyBloc = DangKyBloc();
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    dangKyBloc.close();
  }


  @override
  void getMoreData() {
    callApi();
  }

  @override
  void initDataLoading() {
  }


  @override
  void callApi() {
    dangKyBloc.add(dangKyEvent);
  }

  @override
  PreferredSizeWidget? getAppBar(BuildContext context) => defaultTabBar();

  @override
  Widget pageUI(BuildContext context) => BlocProvider(
    create: (_) => dangKyBloc,
    child: BlocListener<DangKyBloc,
        DataSingleState<DangKyDataResponse>>(
      listener: (BuildContext context, state) {
        handlerActionDataSingleState<DangKyDataResponse>(state,
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
                "Đăng ký tài khoản",
                style: AppTextStyle.titlePage.copyWith(
                    overflow: TextOverflow.visible,
                    fontSize: 18,
                    color: AppColor.colorOfIconActive),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 30, bottom: 20),
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                      height: 150,
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Image.asset(
                          'assets/images/app.png',
                          alignment: Alignment.center,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  DefaultTextFormField(
                    icon: FontAwesomeIcons.user,
                    controller: userNameController,
                    hintText: "Tài khoản",
                    labelText: "Tài khoản",
                    helperText: "Ví dụ: abc",
                    required: true,
                  ),
                  DefaultTextFormField(
                    icon: FontAwesomeIcons.envelope,
                    controller: emailController,
                    maxLength: 150,
                    hintText: "Email",
                    labelText: "Email",
                    helperText: "Ví dụ: abc@gmail.com",
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
                      text: 'Lấy lại mật khẩu',
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: GestureDetector(
                        onTap: () => openHomePage(),
                        child: Center(
                            child: Text(
                              'Trải nghiệm không đăng nhập',
                              style: AppTextStyle.titleAppbarPage
                                  .copyWith(color: Colors.black, fontWeight: FontWeight.normal),
                            ))),
                  ),
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
      processDemo()
          .then((value) => showCenterMessage("Lấy lại mật khẩu thành công vui lòng kiểm tra email để lấy mật khẩu mới"))
          .then((value) => backPage(userNameController.text));
    }
  }

  void openSignUp() {

  }

  void openForgotPassword() {

  }

  openHomePage() {
    nextPageWithoutBack((context) => DefaultPage());
  }
}