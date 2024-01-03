//
// Created by BlackRose on 03/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//

import 'package:eportal/model/api/response/common_new/data/home_business_list_data_response.dart';
import 'package:eportal/page/widget/default_card_item.dart';
import 'package:eportal/page/widget/default_image_network.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/image/image_loading.dart';
import 'package:flutter/material.dart';

import '../../../../extension/string_extension.dart';

class EnterpriseItem extends StatelessWidget{
  final HomeBusinessListDataResponse data;
  final ValueChanged<HomeBusinessListDataResponse> onClickItem;

  const EnterpriseItem({super.key,required this.data,required this.onClickItem});
  @override
  Widget build(BuildContext context) => DefaultCardItem(
    onTap: ()=> onClickItem(data),
    child: Column(
      children: [
        AspectRatio(
          aspectRatio: 16/9,
          child: ClipRRect(
              borderRadius:
              const BorderRadius.all(Radius.circular(5.0)),
              child: DefaultImageNetwork(
                  imageUrl: data.logo.getImageUrl())),

        ),
        Container(
            margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
            child: Text(data.businessVn.supportHtml(),style: AppTextStyle.title.copyWith(),maxLines: 2,textAlign: TextAlign.justify,)
        ),
      ],
    ),
  );
}