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
  final Color backgroundColor;

  const DefaultButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.backgroundColor = AppColor.colorOfIcon});

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
        onPressed: onPressed,
        child: Container(
          padding: const EdgeInsets.all(5),
          width: double.infinity,
          child: Center(
            child: Text(text,
                style: AppTextStyle.textButton.copyWith(color: Colors.white)),
          ),
        ),
      );
}
