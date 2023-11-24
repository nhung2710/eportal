import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../extension/string_extension.dart';

//
// Created by BlackRose on 11/3/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class ImageLoading extends StatelessWidget {
  final String imageUrl;
  final ImageWidgetBuilder imageBuilder;
  final String? imageError;
  final String? localImageError;

  const ImageLoading(
      {super.key,
      required this.imageUrl,
      required this.imageBuilder,
      this.imageError,
      this.localImageError});

  @override
  Widget build(BuildContext context) => CachedNetworkImage(
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            const Center(
          child: Text(
            'Loading...',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 10,
            ),
          ),
        ),
        errorWidget: (context, url, error) => imageError.isNullOrWhiteSpace()
            ? _buildLocalImageError(context)
            : _buildImageError(context),
        //Image.asset('assets/images/ErrorImage.png'),
        fit: BoxFit.cover,
        imageUrl: imageUrl,
        imageBuilder: imageBuilder,
      );

  Widget _buildImageError(BuildContext context) => CachedNetworkImage(
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
        errorWidget: (context, url, error) => _buildLocalImageError(context),
        //Image.asset('assets/images/ErrorImage.png'),
        fit: BoxFit.cover,
        imageUrl: imageError!,
        imageBuilder: imageBuilder,
      );

  Widget _buildLocalImageError(BuildContext context) => Image.asset(
        imageError.replaceWhenNullOrWhiteSpace("assets/images/404.png"),
        fit: BoxFit.fill,
      );
}
