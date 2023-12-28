//
// Created by BlackRose on 28/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:eportal/model/api/response/common_new/data/video_list_data_response.dart';
import 'package:eportal/page/widget/default_card_item.dart';
import 'package:eportal/page/widget/default_image_network.dart';
import 'package:flutter/material.dart';

class VideoItem extends StatelessWidget {
  final ValueChanged<VideoListDataResponse> onClickItem;
  final VideoListDataResponse data;
  VideoItem({super.key,
    required this.onClickItem,
    required this.data,
  });

  @override
  Widget build(BuildContext context) => DefaultCardItem(
      onTap: () => onClickItem(data),
      child: AspectRatio(
        aspectRatio: 16/9,
        child: DefaultImageNetwork(
          imageUrl: data.avatar,
        ),
      )
  );
}