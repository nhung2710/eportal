import 'package:flutter/material.dart';

import '../../../../widget/base/base_page.dart';
import '../../../../widget/input/field_input.dart';

//
// Created by BlackRose on 29/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class ProfileAddFieldSkillsTab extends BasePage {
  ProfileAddFieldSkillsTab({super.key});

  @override
  State<StatefulWidget> createState() => ProfileAddFieldSkillsTabState();
}

class ProfileAddFieldSkillsTabState
    extends BaseScreenStateActive<ProfileAddFieldSkillsTab> {
  TextEditingController skillController = TextEditingController();

  @override
  Widget pageUI(BuildContext context) => ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: FieldInput(
              controller: skillController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.multiline,
              maxLength: 2000,
              minLines: 20,
              maxLines: 50,
              icon: Icons.description,
              hintText: "Kỹ năng sở trường",
            ),
          ),
        ],
      );
}
