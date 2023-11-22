import 'package:eportal/model/api/response/common_new/data/faq_question_search_data_response.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_elevation.dart';
import 'package:eportal/style/app_size_icon.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/text_icon/text_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../extension/string_extension.dart';

//
// Created by BlackRose on 11/8/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class AnswerAndQuestionItem extends StatelessWidget {
  final GestureTapCallback onTap;
  final FaqQuestionSearchDataResponse data;
  int index;

  AnswerAndQuestionItem(
      {super.key,
      required this.onTap,
      required this.data,
      required this.index});

  @override
  Widget build(BuildContext context) => Card(
        elevation: AppElevation.sizeOfNormal,
        color: AppColor.colorOfApp,
        shadowColor: AppColor.colorOfIcon,
        borderOnForeground: false,
        margin: const EdgeInsets.all(5),
        shape: const RoundedRectangleBorder(
            side: BorderSide(color: AppColor.colorOfDrawer, width: 0.2),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: TextIcon(
                isHasBorder: false,
                icon: FontAwesomeIcons.tag,
                text: index.toString(),
                textStyle: AppTextStyle.title,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: TextIcon(
                isHasBorder: false,
                icon: FontAwesomeIcons.question,
                text: data.contents,
                textStyle: AppTextStyle.normal,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: TextIcon(
                isHasBorder: false,
                icon: FontAwesomeIcons.noteSticky,
                text: data.answerOb?.contents,
                textStyle: AppTextStyle.normal,
              ),
            )
          ],
        ),
      );
}
