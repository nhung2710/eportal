//
// Created by BlackRose on 02/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//

import 'package:eportal/bloc/common_new/dang_nhap_bloc.dart';
import 'package:eportal/enum/data_bloc_status.dart';
import 'package:eportal/event/common_new/dang_nhap_event.dart';
import 'package:eportal/model/api/request/common_new/dang_nhap_request.dart';
import 'package:eportal/model/api/request/common_new/data/dang_nhap_data_request.dart';
import 'package:eportal/model/api/response/common_new/data/dang_nhap_data_response.dart';
import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/base/page_widget/base_page_widget.dart';
import 'package:eportal/page/widget/default_button.dart';
import 'package:eportal/page/widget/default_capcha_text_form_field.dart';
import 'package:eportal/page/widget/default_password_form_field.dart';
import 'package:eportal/page/widget/default_text_form_field.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChangeUserPasswordPage extends BasePageWidget {
  const ChangeUserPasswordPage({super.key});

  @override
  State<StatefulWidget> createState() => ChangeUserPasswordPageState();
}

class ChangeUserPasswordPageState extends BasePageState<ChangeUserPasswordPage> {
  late DangNhapBloc dangNhapBloc;
  DangNhapEvent dangNhapEvent =
  DangNhapEvent(request: DangNhapRequest(obj: DangNhapDataRequest()));

  final TextEditingController passWordOldController = TextEditingController();
  final TextEditingController passWordNewController = TextEditingController();
  final TextEditingController passWordNewConfirmController =
  TextEditingController();
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
  void initDataLoading() {}

  @override
  void callApi() {
    dangNhapBloc.add(dangNhapEvent);
  }

  @override
  PreferredSizeWidget? getAppBar(BuildContext context) => defaultTabBar();

  @override
  Widget pageUI(BuildContext context) => BlocProvider(
    create: (_) => dangNhapBloc,
    child:
    BlocListener<DangNhapBloc, DataSingleState<DangNhapDataResponse>>(
      listener: (BuildContext context, state) {
        handlerActionDataSingleState<DangNhapDataResponse>(state,
                (obj) async {
              showCenterMessage("Bạn đã thay đổi mật khẩu thành công")
                  .then((value) => backPage());
            });
        if (state.status == DataBlocStatus.error) {
          number++;
          setState(() {});
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
                "Thay đổi mật khẩu",
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
                      height: 200,
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
                  DefaultPasswordFormField(
                    icon: FontAwesomeIcons.lock,
                    controller: passWordOldController,
                    hintText: "Mật khẩu cũ",
                    labelText: "Mật khẩu cũ",
                    helperText: "Ví dụ: xyz",
                    required: true,
                  ),
                  DefaultPasswordFormField(
                    icon: FontAwesomeIcons.lock,
                    controller: passWordNewController,
                    hintText: "Mật khẩu mới",
                    labelText: "Mật khẩu mới",
                    helperText: "Ví dụ: xyz",
                    required: true,
                  ),
                  DefaultPasswordFormField(
                    icon: FontAwesomeIcons.lock,
                    controller: passWordNewConfirmController,
                    hintText: "Nhập lại mật khẩu mới",
                    labelText: "Nhập lại mật khẩu mới",
                    helperText: "Ví dụ: xyz",
                    required: true,
                    validator: (v)
                    {
                      if(passWordNewController.text!= v) {
                        return "Nhập lại mật khẩu mới không khớp với mật khẩu mới đã nhập ";
                      }
                      return null;
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: DefaultButton(
                      onPressed: () => submitForm(),
                      text: 'Thay đổi mật khẩu',
                    ),
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
          .then((value) => showCenterMessage(
          "Bạn đã thay đổi mật khẩu thành công"))
          .then((value) => backPage());
    }
  }

}