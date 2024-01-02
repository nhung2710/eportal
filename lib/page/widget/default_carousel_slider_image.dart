//
// Created by BlackRose on 02/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//
import 'package:carousel_slider/carousel_slider.dart';
import 'package:eportal/page/widget/default_card_item.dart';
import 'package:eportal/widget/image/image_loading.dart';
import 'package:flutter/material.dart';

import '../../extension/string_extension.dart';
typedef DefaultCarouselSliderImageBuilder<T> = Widget Function(BuildContext context,int index,T item);

class DefaultCarouselSliderImage<T> extends StatefulWidget{
  final DefaultCarouselSliderImageBuilder<T> builder;
  final List<T> data;

  const DefaultCarouselSliderImage({super.key,required this.data,required this.builder});
  @override
  State<StatefulWidget> createState() => DefaultCarouselSliderImageState<T>();
}

class DefaultCarouselSliderImageState<T> extends State<DefaultCarouselSliderImage<T>>{
  final int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AspectRatio(
    aspectRatio: 16/9,
    child: CarouselSlider(
      disableGesture: true,
      options: CarouselOptions(
        aspectRatio: 16/9,
        viewportFraction: 1,
        animateToClosest: true,
        initialPage: _current,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        disableCenter: true,
        autoPlayInterval: const Duration(seconds: 10),
        autoPlayAnimationDuration: const Duration(seconds: 5),
        autoPlayCurve: Curves.easeOutCubic,
        enlargeCenterPage: true,
        enlargeFactor: 10,
        enlargeStrategy: CenterPageEnlargeStrategy.zoom,
        scrollDirection: Axis.horizontal,
      ),
      items: widget.data.asMap().entries.map((item) {
        return widget.builder(context,item.key,item.value);
      }).toList(),
      carouselController: _controller,
    ),
  );
}