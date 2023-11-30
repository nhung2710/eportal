import 'package:eportal/style/app_color.dart';
import 'package:eportal/widget/default_button/default_button.dart';
import 'package:flutter/material.dart';

import '../../style/app_text_style.dart';

//
// Created by BlackRose on 30/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class ChooseImageFileDialog extends StatelessWidget {
  const ChooseImageFileDialog({super.key});

  @override
  Widget build(BuildContext context) => Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Bạn muốn chọn ảnh?",
              style:
                  AppTextStyle.titlePage.copyWith(color: AppColor.colorOfIcon),
            ),
            const SizedBox(
              height: 20,
            ),
            DefaultButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              text: 'Máy ảnh',
            ),
            const SizedBox(
              height: 20,
            ),
            DefaultButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              text: 'Thư viện ảnh',
            ),
          ],
        ),
      );
}
