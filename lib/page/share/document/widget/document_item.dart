//
// Created by BlackRose on 02/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//

import 'package:eportal/model/api/response/common_new/data/home_document_list_data_response.dart';
import 'package:eportal/page/widget/default_card_item.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/image/image_loading.dart';
import 'package:flutter/material.dart';

import '../../../../extension/string_extension.dart';

class DocumentItem extends StatelessWidget{
  final HomeDocumentListDataResponse data;
  final ValueChanged<HomeDocumentListDataResponse> onClickItem;

  const DocumentItem({super.key,required this.data,required this.onClickItem});
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
                  flex: 2,
                    child: Text(data.docUnitName.supportHtml(),style: AppTextStyle.title.copyWith(fontWeight: FontWeight.w900,color: AppColor.colorOfIcon),maxLines: 4,textAlign: TextAlign.start)),
                Expanded(
                  flex: 1,
                    child: Text(data.noCode.supportHtml(),style: AppTextStyle.title.copyWith(fontWeight: FontWeight.w900,fontSize: 9,color: Colors.green),maxLines: 4,textAlign: TextAlign.end)),
              ],
            ),
          ),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Text("${data.documentName.supportHtml()}\n\n\n\n",style: AppTextStyle.title.copyWith(),maxLines: 4,textAlign: TextAlign.start,)
          ),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Text("${data.contents.supportHtml()}\n\n\n\n",style: AppTextStyle.normal.copyWith(),maxLines: 4,textAlign: TextAlign.start,)
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