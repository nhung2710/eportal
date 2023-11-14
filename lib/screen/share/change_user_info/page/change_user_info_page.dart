import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../widget/base/base_page.dart';

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

  @override
  String getPageTitle(BuildContext context) => "Thay thông tin";

  @override
  Color currentBackgroundColor(BuildContext context) => Colors.white;

  @override
  Widget pageUI(BuildContext context) => ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 30),
            child: Image.asset(
              'assets/images/Logo.jpg',
              alignment: Alignment.center,
              height: 125,
              width: 125,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: TextFormField(
              controller: fullNameController,
              maxLength: 50,
              textInputAction: TextInputAction.next,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Tên đầy đủ không được để trống';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Tên đầy đủ',
                counterText: "",
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: TextFormField(
              controller: birthDayController,
              maxLength: 50,
              textInputAction: TextInputAction.next,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Ngày tháng năm sinh không được để trống';
                }
                return null;
              },
              onTap: () async {
                FocusScope.of(context).unfocus();
                DateTime? pickerDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now());
                if (pickerDate != null) {
                  birthDayController.text =
                      DateFormat('dd/MM/yyyy').format(pickerDate);
                }
              },
              decoration: const InputDecoration(
                labelText: 'Ngày tháng năm sinh',
                counterText: "",
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: TextFormField(
              controller: emailController,
              maxLength: 50,
              textInputAction: TextInputAction.next,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Địa chỉ thư điện tử không được để trống';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Địa chỉ thư điện tử',
                counterText: "",
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.number,
              maxLength: 50,
              textInputAction: TextInputAction.next,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Số điện thoại không được để trống';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Số điện thoại',
                counterText: "",
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: TextFormField(
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
              decoration: const InputDecoration(
                labelText: 'Địa chỉ',
                counterText: "",
              ),
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
}
