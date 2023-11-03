import 'package:carousel_slider/carousel_slider.dart';
import 'package:eportal/constant/application_constant.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/image/image_loading.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 11/3/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class MediaPage extends BasePage{
  const MediaPage({super.key});


  @override
  State<StatefulWidget> createState() => _MediaPageState();
}

class _MediaPageState extends BasePageState<MediaPage>{
  @override
  Widget pageUI(BuildContext context) => Container(
    padding: const EdgeInsets.fromLTRB(8,0,8,0),
    color: Colors.black12,
    height: double.infinity,
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: 50,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5
              ),
              itemBuilder: (BuildContext context, int index) {
                int _page = index~/ApplicationConstant.URL_NEW.length;
                int _index = index - (_page*ApplicationConstant.URL_NEW.length);
                return ImageLoading(
                    imageUrl: ApplicationConstant.URL_NEW[_index],
                    imageBuilder: (context, imageProvider)
                    {
                      return ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                        child: Image(image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      );
                    }
                );
              },
            ),
          )

        ],
      ),
    ),
  );

}