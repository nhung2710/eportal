//
// Created by BlackRose on 28/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../extension/string_extension.dart';
import '../../style/app_text_style.dart';

class DefaultImageNetwork extends StatelessWidget {
  final String? imageUrl;
  final double radius;
  final String? localImageError;
  final BoxFit fit;

  const DefaultImageNetwork(
      {super.key,
        required this.imageUrl,
        this.radius = 20,
        this.fit = BoxFit.fill,
        this.localImageError});

  @override
  Widget build(BuildContext context) => CachedNetworkImage(
    progressIndicatorBuilder: (context, url, downloadProgress) => Center(
        child: RefreshProgressIndicator(
            value: downloadProgress.progress,
        )
    ),
    errorWidget: (context, url, error) => viewImage(Image.asset("assets/images/404.png").image),
    //Image.asset('assets/images/ErrorImage.png'),
    fit: BoxFit.contain,
    imageUrl: imageUrl.getImageUrl(),
    imageBuilder: (BuildContext context, ImageProvider<Object> imageProvider) => viewImage(imageProvider),
  );
  Widget viewImage(ImageProvider<Object> imageProvider)=> ClipRRect(
    borderRadius: BorderRadius.all(
        Radius.circular(radius)),
    child: Image(
      image: imageProvider,
      fit: BoxFit.fill,
    ),
  );
}