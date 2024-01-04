//
// Created by BlackRose on 04/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//

import 'package:eportal/model/api/response/admin/data/chat_bot_chi_tiet_hoi_thoai_data_response.dart';
import 'package:eportal/page/widget/default_card_item.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_size_icon.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../extension/string_extension.dart';

class ChatBotConversationDetailItem extends StatelessWidget{
  final ChatBotChiTietHoiThoaiDataResponse data;
  final ValueChanged<ChatBotChiTietHoiThoaiDataResponse> onClickItem;

  const ChatBotConversationDetailItem({super.key,required this.data,required this.onClickItem});


  @override
  Widget build(BuildContext context) => DefaultCardItem(
    onTap: ()=> onClickItem(data),
    child: Container(
      margin: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
              child: Html(
                data: (data.noiDungHTML).replaceWhenNullOrWhiteSpace(),
                style: {
                  '#': Style(
                    fontSize: FontSize(16),
                  ),
                },
              )
          ),
          Divider(
            height: 20,
            color: Colors.grey.withOpacity(0.5),
          ),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(data.createdDate.formatDateTimeApi(),style: AppTextStyle.normalChild1.copyWith(),maxLines: 2,textAlign: TextAlign.end,))
          )
        ],
      ),
    ),
  );
}