import 'package:flutter/material.dart';

import '../../extension/string_extension.dart';
import '../../style/app_color.dart';
import '../../style/app_text_style.dart';
import '../image/image_loading.dart';

//
// Created by BlackRose on 15/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class NewsWidget extends StatelessWidget {
  String? imageUrl;
  String? title;
  String? content;

  NewsWidget({this.imageUrl, this.title, this.content});

  @override
  Widget build(BuildContext context) => Card(
        elevation: 10,
        color: AppColor.colorOfApp,
        shadowColor: AppColor.colorOfDrawer,
        child: Container(
          padding: const EdgeInsets.all(5),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: ImageLoading(
                    imageUrl: imageUrl.getImageUrl(),
                    imageBuilder: (BuildContext context,
                        ImageProvider<Object> imageProvider) {
                      return ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5.0)),
                        child: Image(
                          image: imageProvider,
                          fit: BoxFit.fill,
                        ),
                      );
                    },
                  )),
              const VerticalDivider(
                width: 5,
              ),
              Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Text(
                        title.replaceWhenNullOrWhiteSpace(),
                        style: AppTextStyle.title,
                        maxLines: 3,
                      ),
                      Text(
                        content.replaceWhenNullOrWhiteSpace(),
                        maxLines: 3,
                        style: AppTextStyle.normal,
                      ),
                    ],
                  )),
            ],
          ),
        ),
      );
}
