import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 11/3/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class ImageLoading extends StatelessWidget {
  final String imageUrl;
  final ImageWidgetBuilder imageBuilder;

  const ImageLoading(
      {super.key, required this.imageUrl, required this.imageBuilder});

  @override
  Widget build(BuildContext context) => CachedNetworkImage(
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            const Center(
          child: SizedBox(
            width: 100,
            height: 100,
            child: Text(
              'Loading...',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 10,
              ),
            ),
          ),
        ),
        errorWidget: (context, url, error) => const Icon(
          Icons.error,
          size: 40,
        ),
        //Image.asset('assets/images/ErrorImage.png'),
        fit: BoxFit.cover,
        imageUrl: imageUrl,
        imageBuilder: imageBuilder,
      );
}
