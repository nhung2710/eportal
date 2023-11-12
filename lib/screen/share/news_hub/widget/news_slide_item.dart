import 'package:eportal/constant/application_constant.dart';
import 'package:eportal/extension/string_extension.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/image/image_loading.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 11/8/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class NewsSlideItem extends StatelessWidget {
  final String? imageUrl;
  final String? title;

  const NewsSlideItem(
      {super.key,
      this.imageUrl = ApplicationConstant.URL_NEWS,
      this.title =
          "Khủng hoảng thịt cừu tại Úc, người chăn nuôi phải mang cho không"});

  @override
  Widget build(BuildContext context) => Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(2),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              width: double.infinity,
              child: ImageLoading(
                  imageUrl: imageUrl.replaceWhenNullOrWhiteSpace(
                      ApplicationConstant.URL_NEWS),
                  imageBuilder: (context, imageProvider) {
                    return Image(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    );
                  }),
            ),
          ),
          Text(
            title.replaceWhenNullOrWhiteSpace(
                "Khủng hoảng thịt cừu tại Úc, người chăn nuôi phải mang cho không"),
            maxLines: 2,
            textAlign: TextAlign.justify,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.titlePage,
          )
        ],
      ));
}
