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
  final String? imageUrl;
  final String? title;
  final String? content;
  final GestureTapCallback? onTap;

  const NewsWidget(
      {super.key, this.imageUrl, this.title, this.content, this.onTap});

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 5,
          color: AppColor.colorOfApp,
          shadowColor: AppColor.colorOfDrawer,
          borderOnForeground: false,
          margin: const EdgeInsets.all(5),
          shape: const RoundedRectangleBorder(
              side: BorderSide(color: AppColor.colorOfDrawer, width: 0.2),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Container(
            padding: const EdgeInsets.all(2),
            child: Row(
              mainAxisSize: MainAxisSize.max,
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
                  thickness: 2,
                  width: 5,
                  color: Colors.black,
                ),
                Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${title.replaceWhenNullOrWhiteSpace()}\n\n',
                          style: AppTextStyle.title,
                          maxLines: 3,
                        ),
                        const Divider(
                          height: 5,
                          color: Colors.transparent,
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
        ),
      );
}
