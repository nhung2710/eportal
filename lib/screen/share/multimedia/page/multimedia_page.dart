import 'package:eportal/constant/application_constant.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/image/image_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

//
// Created by BlackRose on 11/7/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class MultimediaPage extends BasePage {
  const MultimediaPage({super.key});

  @override
  State<StatefulWidget> createState() => _MultimediaPageState();
}

class _MultimediaPageState extends BasePageStateActive<MultimediaPage> {
  @override
  bool isHasAppBar(BuildContext context) => false;

  @override
  Widget pageUI(BuildContext context) => SingleChildScrollView(
        child: MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          itemCount: 500,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            int _page = index ~/ ApplicationConstant.URL_NEW.length;
            int _index = index - (_page * ApplicationConstant.URL_NEW.length);
            return ImageLoading(
                imageUrl: ApplicationConstant.URL_NEW[_index],
                imageBuilder: (context, imageProvider) {
                  return ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    child: Image(
                      image: imageProvider,
                      fit: BoxFit.fill,
                    ),
                  );
                });
          },
        ),
      );
}
