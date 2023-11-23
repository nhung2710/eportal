import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 23/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DefaultButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const DefaultButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: AppColor.colorOfIcon),
        onPressed: onPressed,
        child: Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          child: Center(
            child: Text(text,
                style: AppTextStyle.titlePage.copyWith(color: Colors.white)),
          ),
        ),
      );
}
