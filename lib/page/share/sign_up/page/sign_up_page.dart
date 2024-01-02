//
// Created by BlackRose on 29/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/bloc/common_new/dang_ky_bloc.dart';
import 'package:eportal/event/common_new/dang_ky_event.dart';
import 'package:eportal/model/api/request/common_new/dang_ky_request.dart';
import 'package:eportal/model/api/request/common_new/data/dang_ky_data_request.dart';
import 'package:eportal/model/api/response/common_new/data/dang_ky_data_response.dart';
import 'package:eportal/model/share/default_model_select_item_data_response.dart';
import 'package:eportal/page/anonymous/default/page/default_page.dart';
import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/base/page_widget/base_page_widget.dart';
import 'package:eportal/page/widget/default_capcha_text_form_field.dart';
import 'package:eportal/page/widget/default_password_form_field.dart';
import 'package:eportal/page/widget/default_select_item_data_response.dart';
import 'package:eportal/page/widget/default_text_form_field.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/default_button/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../extension/string_extension.dart';

class SignUpPage extends BasePageWidget {
  const SignUpPage({super.key});

  @override
  State<StatefulWidget> createState() => SignUpPageState();
}

class SignUpPageState extends BasePageState<SignUpPage> {
  late DangKyBloc dangKyBloc;
  DangKyEvent dangKyEvent =
      DangKyEvent(request: DangKyRequest(obj: DangKyDataRequest()));

  final TextEditingController hoVaTenController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController soDienThoaiController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();
  final TextEditingController passWordConfirmController =
      TextEditingController();
  DefaultModelSelectItemDataResponse<int>? role;
  final List<DefaultModelSelectItemDataResponse<int>> roles = [
    DefaultModelSelectItemDataResponse(item: 1, text: "Doanh nghiệp"),
    DefaultModelSelectItemDataResponse(item: 0, text: "Người lao động")
  ];

  @override
  void initBloc() {
    dangKyBloc = DangKyBloc();
    role = roles.first;
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
  void initDataLoading() {}

  @override
  void callApi() {
    dangKyBloc.add(dangKyEvent);
  }

  @override
  PreferredSizeWidget? getAppBar(BuildContext context) => defaultTabBar();

  @override
  Widget pageUI(BuildContext context) => BlocProvider(
        create: (_) => dangKyBloc,
        child: BlocListener<DangKyBloc, DataSingleState<DangKyDataResponse>>(
          listener: (BuildContext context, state) {
            handlerActionDataSingleState<DangKyDataResponse>(state,
                (obj) async {
              if((obj?.userName).isNullOrWhiteSpace())
                {
                  showCenterError(obj?.userName);
                }
              else{
                showCenterMessage("Bạn đã tạo tài khoản thành công")
                    .then((value) => backPage({"userName":obj?.userName.replaceWhenNullOrWhiteSpace(emailController.text),"password":passWordController.text,}));
              }

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
                        margin: const EdgeInsets.only(top: 20, bottom: 5),
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
                      DefaultSelectItemDataResponse<
                          DefaultModelSelectItemDataResponse<int>>(
                        icon: FontAwesomeIcons.crosshairs,
                        selectedItem: role,
                        hintText: "Vai trò",
                        labelText: "Vai trò",
                        helperText: "Ví dụ: ${role?.text}",
                        list: roles,
                        itemAsString:
                            (DefaultModelSelectItemDataResponse<int> u) =>
                                u.text.supportHtml(),
                        onChanged:
                            (DefaultModelSelectItemDataResponse<int>? data) {
                          if (role != data) {
                            role = data;
                          }
                        },
                        title: 'Giới tính',
                      ),
                      DefaultTextFormField(
                        icon: FontAwesomeIcons.user,
                        controller: hoVaTenController,
                        hintText: "Họ và tên",
                        labelText: "Họ và tên",
                        helperText: "Ví dụ: Nguyễn Văn A",
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
                      DefaultTextFormField(
                        icon: FontAwesomeIcons.mobile,
                        controller: soDienThoaiController,
                        maxLength: 20,
                        hintText: "Điện thoại",
                        labelText: "Điện thoại",
                        helperText: "Ví dụ: 0000000000",
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
                      DefaultPasswordFormField(
                        icon: FontAwesomeIcons.lock,
                        controller: passWordConfirmController,
                        hintText: "Nhập lại mật khẩu",
                        labelText: "Nhập lại mật khẩu",
                        helperText: "Ví dụ: xyz",
                        required: true,
                        validator: (v)
                        {
                          if(passWordController.text!= v) {
                            return "Nhập lại mật khẩu không khớp với mật khẩu đã nhập ";
                          }
                          return null;
                        },
                      ),
                      DefaultCapchaTextFormField(
                        helperText: "Ví dụ: AAAAAA",
                        onFieldSubmitted: (v) => submitForm(),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: DefaultButton(
                          onPressed: () => submitForm(),
                          text: 'Tạo tài khoản',
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: GestureDetector(
                            onTap: () => openHomePage(),
                            child: Center(
                                child: Text(
                              'Trải nghiệm không đăng nhập',
                              style: AppTextStyle.titleAppbarPage.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
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
      var fullNames = hoVaTenController.text.split(' ').where((element) => !element.isNullOrWhiteSpace()).map((e) => e.capitalize()).toList();
      if(fullNames.isEmpty){
        showCenterError("Vui lòng nhập họ và tên");
        return;
      }
      dangKyEvent.request.obj.ten = fullNames.removeLast();
      dangKyEvent.request.obj.hoDem = fullNames.join(" ");
      dangKyEvent.request.obj.email = emailController.text;
      dangKyEvent.request.obj.soDienThoai = soDienThoaiController.text;
      dangKyEvent.request.obj.passWord = passWordController.text;
      dangKyEvent.request.obj.role = role?.item;
      callApi();
    }
  }

  void openSignUp() {}

  void openForgotPassword() {}

  openHomePage() {
    nextPageWithoutBack((context) => DefaultPage());
  }
}
