import 'package:flutter/material.dart';

import '../../../../widget/base/base_page.dart';
import '../../../../widget/default_button/default_button.dart';
import '../../../../widget/input/date_input.dart';
import '../../../../widget/input/field_input.dart';

//
// Created by BlackRose on 20/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class ReferrerEditPage extends BasePage {
  const ReferrerEditPage({super.key});

  @override
  State<StatefulWidget> createState() => _ReferrerEditPageState();
}

class _ReferrerEditPageState extends BasePageState<ReferrerEditPage> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController birthDayController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void initDataLoading() {
    // TODO: implement initDataLoading
    super.initDataLoading();
  }

  @override
  String getPageTitle(BuildContext context) => "Sửa người tham khảo";

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
            child: DateInput(
              controller: birthDayController,
              textInputAction: TextInputAction.next,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Ngày tháng năm sinh không được để trống';
                }
                return null;
              },
              hintText: 'Năm sinh',
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
              child: DefaultButton(
                text: 'Sửa',
                onPressed: () => _changeUserInfo(context),
              )),
        ],
      );

  _changeUserInfo(BuildContext context) {
    if (isValid()) {
      showCenterMessage("Sửa người tham khảo thành công")
          .then((value) => backPage());
    }
  }
}
