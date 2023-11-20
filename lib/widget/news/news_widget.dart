import 'package:eportal/style/app_elevation.dart';
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
  final String? imageError;
  final String? title;
  final String? content;
  final String? time;
  final GestureTapCallback? onTap;
  final bool isHasImage;

  const NewsWidget(
      {super.key,
      this.imageUrl,
      this.title,
      this.content,
      this.onTap,
      this.time,
      this.imageError,
      this.isHasImage = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: AppElevation.sizeOfNormal,
        color: AppColor.colorOfApp,
        shadowColor: AppColor.colorOfIcon,
        borderOnForeground: false,
        margin: const EdgeInsets.all(5),
        shape: const RoundedRectangleBorder(
            side: BorderSide(color: AppColor.colorOfDrawer, width: 0.2),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Container(
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              isHasImage
                  ? Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 100,
                        child: ImageLoading(
                          imageUrl: imageUrl.getImageUrl(),
                          imageError: imageError,
                          imageBuilder: (BuildContext context,
                              ImageProvider<Object> imageProvider) {
                            return ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5.0)),
                              child: Image(
                                image: imageProvider,
                                fit: BoxFit.contain,
                              ),
                            );
                          },
                        ),
                      ))
                  : Container(),
              isHasImage
                  ? const VerticalDivider(
                      thickness: 2,
                      width: 5,
                      color: Colors.black,
                    )
                  : Container(),
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
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          time.replaceWhenNullOrWhiteSpace(),
                          maxLines: 1,
                          textAlign: TextAlign.right,
                          style: AppTextStyle.normalChild1,
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
