import 'package:flutter/material.dart';

import '../../../../widget/base/base_page.dart';
import '../../../../widget/input/field_input.dart';

//
// Created by BlackRose on 29/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class ProfileAddCareerGoalsTab extends BasePage {
  ProfileAddCareerGoalsTab({super.key});

  @override
  State<StatefulWidget> createState() => ProfileAddCareerGoalsTabState();
}

class ProfileAddCareerGoalsTabState
    extends BaseScreenStateActive<ProfileAddCareerGoalsTab> {
  TextEditingController objectiveController = TextEditingController();

  @override
  Widget pageUI(BuildContext context) => ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: FieldInput(
              controller: objectiveController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.multiline,
              maxLength: 2000,
              minLines: 5,
              maxLines: 50,
              icon: Icons.description,
              hintText: "Mục tiêu nghề nghiệp",
            ),
          ),
        ],
      );
}
