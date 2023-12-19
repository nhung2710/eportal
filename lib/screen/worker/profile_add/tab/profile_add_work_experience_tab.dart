import 'package:flutter/material.dart';

import '../../../../widget/base/base_page.dart';
import '../../../../widget/input/field_input.dart';

//
// Created by BlackRose on 29/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class ProfileAddWorkExperienceTab extends BasePage {
  const ProfileAddWorkExperienceTab({super.key});

  @override
  State<StatefulWidget> createState() => ProfileAddWorkExperienceTabState();
}

class ProfileAddWorkExperienceTabState
    extends BaseScreenStateActive<ProfileAddWorkExperienceTab> {
  TextEditingController experienceController = TextEditingController();

  @override
  Widget pageUI(BuildContext context) => ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: FieldInput(
              controller: experienceController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.multiline,
              maxLength: 2000,
              minLines: 5,
              maxLines: 50,
              icon: Icons.description,
              hintText: "Kinh nghiệm làm việc",
            ),
          ),
        ],
      );
}
