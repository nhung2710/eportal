//
// Created by BlackRose on 02/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//
import 'package:eportal/model/api/response/common_new/data/home_news_list_data_response.dart';
import 'package:eportal/widget/image/image_loading.dart';
import 'package:flutter/cupertino.dart';

import '../../../../extension/string_extension.dart';
import '../../../widget/default_card_item.dart';

class NewsItem extends StatelessWidget{
  final HomeNewsListDataResponse data;

  const NewsItem({super.key,required this.data});
  @override
  Widget build(BuildContext context) => DefaultCardItem(
    child: Column(
      children: [
        AspectRatio(
          aspectRatio: 16/9,
          child: ClipRRect(
              borderRadius:
              const BorderRadius.all(Radius.circular(5.0)),
              child: ImageLoading(
                  imageUrl: data.imagePath.getImageUrl(),
                  imageBuilder: (context, imageProvider) {
                    return Image(
                      image: imageProvider,
                      fit: BoxFit.fill,
                    );
                  })),

        )
      ],
    ),
  );
}