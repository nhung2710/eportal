import 'package:eportal/widget/full_data_item/full_data_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//
// Created by BlackRose on 28/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class AnswerAndQuestionItem extends StatelessWidget {
  final bool isShowFull;
  final GestureTapCallback? onTap;
  final String? question;
  final String? answer;

  const AnswerAndQuestionItem({
    this.onTap,
    this.isShowFull = false,
    this.question,
    this.answer,
  });

  @override
  Widget build(BuildContext context) => FullDataItem(
        onTap: onTap,
        isShowFull: isShowFull,
        dataItems: [
          DataItem(
              text: question,
              icon: FontAwesomeIcons.question,
              isShowFull: true),
          DataItem(
              text: answer, icon: FontAwesomeIcons.reply, isShowFull: true),
        ],
      );
}
