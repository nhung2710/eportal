//
// Created by BlackRose on 29/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:eportal/bloc/common_new/dang_nhap_bloc.dart';
import 'package:eportal/event/common_new/dang_nhap_event.dart';
import 'package:eportal/model/api/request/common_new/dang_nhap_request.dart';
import 'package:eportal/model/api/request/common_new/data/dang_nhap_data_request.dart';
import 'package:eportal/model/api/response/common_new/data/dang_nhap_data_response.dart';
import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/base/page_widget/base_page_widget.dart';
import 'package:eportal/page/share/forgot_password/page/forgot_password_page.dart';
import 'package:eportal/page/share/sign_up/page/sign_up_page.dart';
import 'package:eportal/page/widget/default_button.dart';
import 'package:eportal/page/widget/default_capcha_text_form_field.dart';
import 'package:eportal/page/widget/default_password_form_field.dart';
import 'package:eportal/page/widget/default_text_form_field.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../enum/data_bloc_status.dart';
import '../../../anonymous/default/page/default_page.dart';

class SignInPage extends BasePageWidget {
  const SignInPage({super.key});

  @override
  State<StatefulWidget> createState() => SignInPageState();
}

class SignInPageState
    extends BasePageState<SignInPage> {
  late DangNhapBloc dangNhapBloc;
  DangNhapEvent dangNhapEvent = DangNhapEvent(request: DangNhapRequest(obj: DangNhapDataRequest()));

  TextEditingController userNameController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  int number = 0;
  @override
  void initBloc() {
    dangNhapBloc = DangNhapBloc();
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    dangNhapBloc.close();
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
    dangNhapBloc.add(dangNhapEvent);
  }


  @override
  Widget pageUI(BuildContext context) => BlocProvider(
    create: (_) => dangNhapBloc,
    child: BlocListener<DangNhapBloc,
        DataSingleState<DangNhapDataResponse>>(
      listener: (BuildContext context, state) {
        handlerActionDataSingleState<DangNhapDataResponse>(state,
                (obj) async {
              showCenterMessage("Bạn đã gửi câu hỏi thành công")
                  .then((value) => backPage());
            });
        if(state.status == DataBlocStatus.error){
          number++;
          setState(() {

          });
        }
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Text(
                "Đăng nhập",
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
                  DefaultPasswordFormField(
                    icon: FontAwesomeIcons.lock,
                    controller: passWordController,
                    hintText: "Mật khẩu",
                    labelText: "Mật khẩu",
                    helperText: "Ví dụ: xyz",
                    required: true,
                  ),
                  number < 3 ? Container() : DefaultCapchaTextFormField(
                    helperText: "Ví dụ: AAAAAA",
                    onFieldSubmitted: (v)=> submitForm(),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: DefaultButton(
                      onPressed: () => submitForm(),
                      text: 'Đăng nhập ',
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          style: AppTextStyle.titleAppbarPage.copyWith(
                              color: Colors.black, fontWeight: FontWeight.normal),
                          children: <TextSpan>[
                            const TextSpan(text: 'Bạn chưa có tài khoản? '),
                            TextSpan(
                                text: 'Đăng ký',
                                style: AppTextStyle.titleAppbarPage
                                    .copyWith(color: AppColor.colorOfIcon),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => openSignUp()),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: GestureDetector(
                        onTap: () => openForgotPassword(),
                        child: Center(
                            child: Text(
                              'Quên mật khẩu',
                              style: AppTextStyle.titleAppbarPage
                                  .copyWith(color: AppColor.colorOfIcon),
                            ))),
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
      dangNhapEvent.request.obj.userName = userNameController.text;
      dangNhapEvent.request.obj.passWord = passWordController.text;
      callApi();
    }
  }

  void openSignUp() {
    nextPage((context) => const SignUpPage()).then((value){
      if(value!=null){
        userNameController.text = value.toString();
        passWordController.clear();
      }
    });

  }

  void openForgotPassword() {
    nextPage((context) => const ForgotPasswordPage()).then((value){
      if(value!=null){
        userNameController.text = value.toString();
        passWordController.clear();
      }
    });
  }

  openHomePage() {
    nextPageWithoutBack((context) => DefaultPage());
  }
}