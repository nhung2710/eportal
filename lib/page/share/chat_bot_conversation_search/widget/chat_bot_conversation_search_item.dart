//
// Created by BlackRose on 04/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//

import 'package:eportal/extension/error_extension.dart';
import 'package:eportal/model/api/response/admin/data/chat_bot_danh_sach_hoi_thoai_data_response.dart';
import 'package:eportal/page/widget/default_card_item.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_size_icon.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../extension/string_extension.dart';


class ChatBotConversationSearchItem extends StatelessWidget{
  final ChatBotDanhSachHoiThoaiDataResponse data;
  final ValueChanged<ChatBotDanhSachHoiThoaiDataResponse> onClickItem;

  const ChatBotConversationSearchItem({super.key,required this.data,required this.onClickItem});

  double getRate(String? danhDauSao) {
    return ErrorExtension().handleFunctionError(() => double.tryParse(danhDauSao??"0")??0)??0;
  }
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
              child: Row(
                children: [
                  const Icon(FontAwesomeIcons.tag,
                    color: AppColor.colorOfIcon,
                    size: AppSizeIcon.sizeOfNormal,),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(child: Text(data.tenHoiThoai.supportHtml(),style: AppTextStyle.titlePage.copyWith(),maxLines: 1,textAlign: TextAlign.start,)),
                ],
              )
          ),
          Divider(
            height: 20,
            color: Colors.grey.withOpacity(0.5),
          ),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
              child: RatingBarIndicator(
                rating: getRate(data.danhDauSao),
                unratedColor: Colors.grey,
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: AppColor.colorOfIcon,
                  size: AppSizeIcon.sizeOfNormal
                ),
                itemCount: 5,
                itemSize: AppSizeIcon.sizeOfNormal * 2,
                direction: Axis.horizontal,
              )
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
