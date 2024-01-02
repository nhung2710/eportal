//
// Created by BlackRose on 28/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import '../../application/global_application.dart';
import '../../extension/string_extension.dart';
import '../../style/app_text_style.dart';

class DefaultImageNetwork extends StatelessWidget {
  final String? imageUrl;
  final double? radius;
  final BorderRadius? borderRadius;
  final String? localImageError;
  final BoxFit fit;
  final ImageWidgetBuilder? imageBuilder;

  const DefaultImageNetwork(
      {super.key,
        required this.imageUrl,
        this.imageBuilder,
        this.borderRadius,
        this.radius,
        this.fit = BoxFit.fill,
        this.localImageError});

  @override
  Widget build(BuildContext context) => CachedNetworkImage(
    cacheManager: GlobalApplication().cacheManager,
    progressIndicatorBuilder: (context, url, downloadProgress) => Center(
        child: RefreshProgressIndicator(
            value: downloadProgress.progress,
        )
    ),
    errorWidget: (context, url, error) => getImageBuilder(context,Image.asset(localImageError.replaceWhenNullOrWhiteSpace("assets/images/404.png")).image),
    //Image.asset('assets/images/ErrorImage.png'),
    fit: BoxFit.contain,
    imageUrl: imageUrl.getImageUrl(),
    imageBuilder: (BuildContext context, ImageProvider<Object> imageProvider) => getImageBuilder(context,imageProvider),
  );
  Widget getImageBuilder(BuildContext context, ImageProvider<Object> imageProvider){
    if(imageBuilder!=null) {
      return imageBuilder!(context,imageProvider);
    }
    return defaultImageBuilder(context, imageProvider);
  }

  Widget defaultImageBuilder(BuildContext context, ImageProvider<Object> imageProvider)=> ClipRRect(
    borderRadius: borderRadius??BorderRadius.all(
        Radius.circular(radius??10)),
    child: Image(
      image: imageProvider,
      fit: BoxFit.fill,
    ),
  );
}