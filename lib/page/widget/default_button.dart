//
// Created by BlackRose on 12/28/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


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
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
          decoration: BoxDecoration(
              border: Border.all(
                color: backgroundColor,
              ),
              color: backgroundColor,
              borderRadius: const BorderRadius.all(
                  Radius.circular(20)
              )
          ),
          child: Text(text,
              textAlign: TextAlign.center,
              style: AppTextStyle.textButton.copyWith(color: Colors.white)),
        ),
      ),
    ],
  );
}
