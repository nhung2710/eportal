import '../../style/app_text_style.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class ShowFullInfo extends StatelessWidget {
  GestureTapCallback? onTap;

  ShowFullInfo({super.key, this.onTap});

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Container(
          color: Colors.transparent,
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.only(top: 2, bottom: 2, right: 10),
          width: double.infinity,
          child: Text(
            "Xem tất cả >>",
            style: AppTextStyle.titleChild1.copyWith(color: Colors.blue),
            textAlign: TextAlign.end,
          ),
        ),
      );
}
