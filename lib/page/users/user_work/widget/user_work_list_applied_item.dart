//
// Created by BlackRose on 08/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//
import 'package:eportal/model/api/response/admin/data/work_send_list_data_response.dart';
import 'package:eportal/page/widget/default_card_item.dart';
import 'package:eportal/page/widget/default_image_network.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:flutter/material.dart';

import '../../../../extension/string_extension.dart';

class UserWorkListAppliedItem extends StatelessWidget{
  final WorkSendListDataResponse data;
  final ValueChanged<WorkSendListDataResponse> onClickItem;

  const UserWorkListAppliedItem({super.key,required this.data,required this.onClickItem});
  @override
  Widget build(BuildContext context) => DefaultCardItem(
    onTap: ()=> onClickItem(data),
    child: Column(
      children: [
        AspectRatio(
          aspectRatio: 16/9,
          child: DefaultImageNetwork(
            fit: BoxFit.scaleDown,
            fitError: BoxFit.fill,
            imageUrl: data.imageURL.getImageUrl(),
          ),

        ),
        Container(
            margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
            child: Text(data.title.supportHtml(),style: AppTextStyle.title.copyWith(),maxLines: 3,textAlign: TextAlign.justify,)
        ),
        Container(
            margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
            child: Align(
                alignment: Alignment.centerRight,
                child: Text(data.expiredDate.formatDateTimeApi(),style: AppTextStyle.normalChild1.copyWith(color: Colors.red),maxLines: 1,textAlign: TextAlign.end,))
        )
      ],
    ),
  );
}