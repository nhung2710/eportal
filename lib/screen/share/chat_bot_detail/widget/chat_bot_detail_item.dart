//
// Created by BlackRose on 21/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:eportal/model/api/response/admin/data/chat_bot_chi_tiet_hoi_thoai_data_response.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_elevation.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/text_icon/text_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../extension/string_extension.dart';

class ChatBotDetailItem extends StatelessWidget {
  final GestureTapCallback onTap;
  final ChatBotChiTietHoiThoaiDataResponse data;
  const ChatBotDetailItem({super.key,
    required this.data,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: Card(
      elevation: AppElevation.sizeOfNormal,
      color: AppColor.colorOfApp,
      shadowColor: AppColor.colorOfIcon,
      borderOnForeground: false,
      margin: const EdgeInsets.all(5),
      shape: const RoundedRectangleBorder(
          side: BorderSide(color: AppColor.colorOfDrawer, width: 0.2),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextIcon(
                text: data.noiDungText,
                overflow: TextOverflow.visible,
                icon: FontAwesomeIcons.tags,
                textStyle: AppTextStyle.title
                    .copyWith(color: Colors.black, fontSize: 12),
                isHasBorder: false,
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Html(
                  data: (data.noiDungHTML).replaceWhenNullOrWhiteSpace(),
                  style: {
                    '#': Style(
                      fontSize: FontSize(16),
                    ),
                  },
                ),
              ),
            ]),
      ),
    ),
  );

}