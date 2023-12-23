//
// Created by BlackRose on 12/23/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:eportal/bloc/test/data_example_test_bloc.dart';
import 'package:eportal/model/api/request/common_new/data/work_search_data_request.dart';
import 'package:eportal/model/api/request/common_new/work_search_request.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/default_button/default_button.dart';
import 'package:eportal/widget/dialog/filter_job_dialog.dart';
import 'package:eportal/widget/input/capcha_input.dart';
import 'package:eportal/widget/input/field_input.dart';
import 'package:eportal/widget/input/password_input.dart';
import 'package:flutter/material.dart';

import '../../../../extension/string_extension.dart';

class ManagementOfBannersAddPage extends BasePage {
  const ManagementOfBannersAddPage({super.key});

  @override
  State<StatefulWidget> createState() => _ManagementOfBannersAddPageState();
}

class _ManagementOfBannersAddPageState
    extends BasePageState<ManagementOfBannersAddPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  DataExampleTestEvent dataExampleTestEvent = DataExampleTestEvent(
      request: DataExampleTestRequest(obj: DataExampleTestDataRequest()));
  WorkSearchRequest request = WorkSearchRequest(obj: WorkSearchDataRequest());
  late DataExampleTestBloc dataExampleTestBloc;

  @override
  String getPageTitle(BuildContext context) => "Tạo banner";

  @override
  void initBloc() {
    dataExampleTestBloc = DataExampleTestBloc();
  }

  @override
  void disposeBloc() {
    dataExampleTestBloc.close();
  }

  @override
  void getMoreData() {
    // TODO: implement getMoreData
    dataExampleTestEvent.request.obj.nextData();
    callApi();
  }

  @override
  void initDataLoading() {
    // TODO: implement initDataLoading
    dataExampleTestEvent.request.obj.reloadData();
    callApi();
  }

  @override
  void callApi() {
    dataExampleTestBloc.add(dataExampleTestEvent);
  }

  final filterJobDialogKey = GlobalKey<FilterJobDialogState>();
  late FilterJobDialog filterJobDialog = FilterJobDialog(
    key: filterJobDialogKey,
    data: request.obj,
    onPressed: () => initDataLoading(),
  );

  @override
  Widget pageUI(BuildContext context) => ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 30, bottom: 20),
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              height: 150,
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.asset(
                  'assets/images/logoapp.png',
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: FieldInput(
              controller: firstNameController,
              textInputAction: TextInputAction.next,
              hintText: "Họ",
              validator: (text) {
                if (text.isNullOrWhiteSpace()) {
                  return 'Họ không được để trống';
                }
                return null;
              },
              icon: Icons.people,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: FieldInput(
              controller: lastNameController,
              textInputAction: TextInputAction.next,
              validator: (text) {
                if (text.isNullOrWhiteSpace()) {
                  return 'Tên không được để trống';
                }
                return null;
              },
              hintText: "Tên",
              icon: Icons.person,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: FieldInput(
              controller: emailController,
              textInputAction: TextInputAction.next,
              validator: (text) {
                if (text.isNullOrWhiteSpace()) {
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
                if (text.isNullOrWhiteSpace()) {
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
            child: PasswordInput(
              obscureText: true,
              controller: passwordController,
              textInputAction: TextInputAction.next,
              validator: (text) {
                if (text.isNullOrWhiteSpace()) {
                  return 'Mật khẩu không được để trống';
                }
                return null;
              },
              hintText: "Mật khẩu",
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: PasswordInput(
              obscureText: true,
              controller: confirmController,
              textInputAction: TextInputAction.next,
              validator: (text) {
                if (text.isNullOrWhiteSpace()) {
                  return 'Mật khẩu xác nhận không được để trống';
                }
                if (text != passwordController.text) {
                  return 'Mật khẩu xác nhận không khớp';
                }
                return null;
              },
              hintText: "Mật khẩu xác nhận",
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
                text: 'Tạo',
                onPressed: () => _send(context),
              )),
        ],
      );

  _send(BuildContext context) {
    showCenterMessage("Đã xoá dữ liệu thành công").then((value) => backPage());
  }
}
