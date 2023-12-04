import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/input/field_input.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//
// Created by BlackRose on 04/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class ChangeBusinessInfoContractTab extends BasePage {
  const ChangeBusinessInfoContractTab({super.key});

  @override
  State<StatefulWidget> createState() => ChangeBusinessInfoContractTabState();
}

class ChangeBusinessInfoContractTabState
    extends BaseScreenStateActive<ChangeBusinessInfoContractTab> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget pageUI(BuildContext context) => ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: FieldInput(
              controller: fullNameController,
              maxLength: 14,
              textInputAction: TextInputAction.next,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Họ và tên không được để trống';
                }
                return null;
              },
              hintText: 'Họ và tên',
              icon: FontAwesomeIcons.idCard,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: FieldInput(
              controller: emailController,
              maxLength: 100,
              textInputAction: TextInputAction.next,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Email không được để trống';
                }
                return null;
              },
              hintText: 'Email',
              icon: FontAwesomeIcons.envelopesBulk,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: FieldInput(
              controller: phoneController,
              maxLength: 100,
              textInputAction: TextInputAction.next,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Số điện thoại không được để trống';
                }
                return null;
              },
              hintText: 'Số điện thoại',
              icon: FontAwesomeIcons.phone,
            ),
          ),
        ],
      );
}
