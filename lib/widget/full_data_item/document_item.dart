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
  final String? docUnitName;
  final String? contents;
  final String? noCode;
  final String? signerName;

  DocumentItem({
    this.onTap,
    this.isShowFull = false,
    this.title,
    this.docUnitName,
    this.contents,
    this.noCode,
    this.signerName,
  });

  @override
  Widget build(BuildContext context) => FullDataItem(
        onTap: onTap,
        isShowFull: isShowFull,
        dataItems: [
          DataItem(text: title, icon: FontAwesomeIcons.tags, isShowFull: true),
          DataItem(
              text: docUnitName,
              icon: FontAwesomeIcons.globe,
              isShowFull: true),
          DataItem(
              text: contents,
              icon: FontAwesomeIcons.noteSticky,
              isShowFull: true),
          DataItem(
              text: noCode, icon: FontAwesomeIcons.hashtag, isShowFull: true),
          DataItem(
            text: signerName,
            icon: FontAwesomeIcons.userPen,
            isShowFull: true,
          ),
        ],
      );
}
