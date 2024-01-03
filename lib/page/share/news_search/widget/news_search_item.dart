//
// Created by BlackRose on 02/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//

import 'package:eportal/model/api/response/common_new/data/home_news_list_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/news_search_data_response.dart';
import 'package:eportal/page/widget/default_card_item.dart';
import 'package:eportal/page/widget/default_image_network.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/image/image_loading.dart';
import 'package:flutter/material.dart';

import '../../../../extension/string_extension.dart';

class NewsSearchItem extends StatelessWidget{
  final NewsSearchDataResponse data;
  final ValueChanged<NewsSearchDataResponse> onClickItem;

  const NewsSearchItem({super.key,required this.data,required this.onClickItem});
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
                  imageUrl: data.imagePath.getImageUrl(),)),

        ),
        Container(
            margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
            child: Text(data.title.supportHtml(),style: AppTextStyle.title.copyWith(),maxLines: 2,textAlign: TextAlign.justify,)
        ),
        Container(
            margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
            child: Align(
                alignment: Alignment.centerRight,
                child: Text(data.publishedDate.formatDateTimeApi(),style: AppTextStyle.normalChild1.copyWith(),maxLines: 2,textAlign: TextAlign.end,))
        )
      ],
    ),
  );
}