import 'package:eportal/style/app_color.dart';
import 'package:eportal/widget/default_button/default_button.dart';
import 'package:eportal/widget/dialog/choose_action_dialog.dart';
import 'package:flutter/material.dart';

import '../../style/app_text_style.dart';

//
// Created by BlackRose on 30/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class ChooseImageFileDialog extends StatelessWidget {
  const ChooseImageFileDialog({super.key});

  @override
  Widget build(BuildContext context) => ChooseActionDialog(
        title: "Bạn muốn chọn ảnh?",
        items: [
          ChooseActionDialogItem(
              title: "Máy ảnh", clickAction: () => {}, result: true),
          ChooseActionDialogItem(
              title: "Thư viện ảnh", clickAction: () => {}, result: false)
        ],
      );
}
