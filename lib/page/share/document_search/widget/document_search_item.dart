//
// Created by BlackRose on 02/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//

import 'package:eportal/model/api/response/common_new/data/document_list_data_response.dart';
import 'package:eportal/page/widget/default_card_item.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:flutter/material.dart';

import '../../../../extension/string_extension.dart';

class DocumentSearchItem extends StatelessWidget{
  final DocumentListDataResponse data;
  final ValueChanged<DocumentListDataResponse> onClickItem;

  const DocumentSearchItem({super.key,required this.data,required this.onClickItem});
  @override
  Widget build(BuildContext context) => DefaultCardItem(
    onTap: ()=> onClickItem(data),
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Expanded(
                    child: Text(data.docUnitName.supportHtml(),style: AppTextStyle.title.copyWith(fontWeight: FontWeight.w900,color: AppColor.colorOfIcon),maxLines: 4,textAlign: TextAlign.start)),
                Expanded(
                    child: Text(data.noCode.supportHtml(),style: AppTextStyle.title.copyWith(fontWeight: FontWeight.w900,color: AppColor.colorOfIcon),maxLines: 4,textAlign: TextAlign.end)),
              ],
            ),
          ),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Text(data.documentName.supportHtml(),style: AppTextStyle.title.copyWith(),maxLines: 3,textAlign: TextAlign.start,)
          ),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Text(data.contents.supportHtml(),style: AppTextStyle.normal.copyWith(),maxLines: 2,textAlign: TextAlign.start,)
          ),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(data.effectDate.formatDateTimeApi(),style: AppTextStyle.normalChild1.copyWith(),maxLines: 2,textAlign: TextAlign.end,))
          )
        ],
      ),
    ),
  );
}