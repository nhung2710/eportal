import 'package:flutter/material.dart';

import '../../../../widget/base/base_page.dart';
import '../../../../widget/input/field_input.dart';

//
// Created by BlackRose on 29/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class ProfileAddLevelTab extends BasePage {
  const ProfileAddLevelTab({super.key});

  @override
  State<StatefulWidget> createState() => _ProfileAddLevelTabState();
}

class _ProfileAddLevelTabState
    extends BaseScreenStateActive<ProfileAddLevelTab> {
  TextEditingController educationController = TextEditingController();

  @override
  Widget pageUI(BuildContext context) => ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: FieldInput(
              controller: educationController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.multiline,
              maxLength: 2000,
              minLines: 20,
              maxLines: 50,
              icon: Icons.description,
              hintText: "Trình độ học vấn",
            ),
          ),
        ],
      );
}
