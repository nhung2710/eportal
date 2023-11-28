import 'package:eportal/style/app_color.dart';
import 'package:eportal/widget/full_data_item/full_data_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//
// Created by BlackRose on 28/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DocumentItem extends StatelessWidget {
  final bool isShowFull;
  final GestureTapCallback? onTap;
  final String? title;
  final String? noCode;
  final String? date;

  DocumentItem({
    this.onTap,
    this.isShowFull = false,
    this.title,
    this.noCode,
    this.date,
  });

  @override
  Widget build(BuildContext context) => FullDataItem(
        onTap: onTap,
        isShowFull: isShowFull,
        dataItems: [
          DataItem(text: title, icon: FontAwesomeIcons.tags, isShowFull: true),
          DataItem(
              text: noCode, icon: FontAwesomeIcons.hashtag, isShowFull: true),
          DataItem(
            text: date,
            icon: FontAwesomeIcons.calendarPlus,
            isShowFull: true,
          ),
        ],
      );
}
