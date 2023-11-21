import 'package:flutter/material.dart';

import '../../../../extension/datetime_extension.dart';
import '../../../../widget/base/base_page.dart';
import '../../../../widget/input/field_input.dart';

//
// Created by BlackRose on 14/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class ChangeUserInfoPage extends BasePage {
  const ChangeUserInfoPage({super.key});

  @override
  State<StatefulWidget> createState() => _ChangeUserInfoPageState();
}

class _ChangeUserInfoPageState extends BasePageState<ChangeUserInfoPage> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController birthDayController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  var focusNode = FocusNode();
  DateTime birthDay = DateTime.now();

  @override
  void initDataLoading() {
    focusNode.addListener(() {
      print(focusNode.hasFocus);
      if (focusNode.hasFocus) {
        focusNode.unfocus();
        openDateTimePicker();
      }
    });
    // TODO: implement initDataLoading
    super.initDataLoading();
  }

  @override
  String getPageTitle(BuildContext context) => "Thay thông tin";

  @override
  Color currentBackgroundColor(BuildContext context) => Colors.white;

  @override
  Widget pageUI(BuildContext context) => ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: FieldInput(
              controller: fullNameController,
              maxLength: 50,
              textInputAction: TextInputAction.next,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Họ và tên không được để trống';
                }
                return null;
              },
              hintText: 'Họ và tên',
              icon: Icons.account_box,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: FieldInput(
              controller: birthDayController,
              maxLength: 50,
              textInputAction: TextInputAction.next,
              focusNode: focusNode,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Ngày tháng năm sinh không được để trống';
                }
                return null;
              },
              hintText: 'Năm sinh',
              icon: Icons.date_range,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: FieldInput(
              controller: emailController,
              maxLength: 50,
              textInputAction: TextInputAction.next,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Địa chỉ thư điện tử không được để trống';
                }
                return null;
              },
              hintText: 'Địa chỉ thư điện tử',
              icon: Icons.email,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: FieldInput(
                controller: phoneController,
                keyboardType: TextInputType.number,
                maxLength: 50,
                textInputAction: TextInputAction.next,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Điện thoại không được để trống';
                  }
                  return null;
                },
                hintText: 'Điện thoại',
                icon: Icons.phone),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: FieldInput(
              controller: addressController,
              maxLength: 50,
              textInputAction: TextInputAction.done,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Địa chỉ không được để trống';
                }
                return null;
              },
              onFieldSubmitted: (value) => _changeUserInfo(context),
              hintText: 'Địa chỉ',
              icon: Icons.home,
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 10),
              child: ElevatedButton(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: const Text('Thay đổi thông tin'),
                ),
                onPressed: () => _changeUserInfo(context),
              )),
        ],
      );

  _changeUserInfo(BuildContext context) {
    if (isValid()) {
      loadDataDemo().then((value) {
        showCenterMessage("Thay đổi thông tin thành công")
            .then((value) => backPage());
      });
    }
  }

  Future<void> openDateTimePicker() async {
    DateTime? pickerDate = await showDatePicker(
        context: context,
        initialDate: birthDay,
        confirmText: "Chọn ngày",
        cancelText: "Hủy",
        keyboardType: TextInputType.datetime,
        firstDate: DateTime(1900),
        lastDate: DateTime.now());
    if (pickerDate != null) {
      birthDay = pickerDate;
      birthDayController.text =
          pickerDate.toFormatDateTime(format: 'dd/MM/yyyy');
    }
  }
}
