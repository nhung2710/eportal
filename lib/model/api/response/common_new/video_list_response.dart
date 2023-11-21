import 'package:eportal/model/api/response/common_new/data/video_list_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class VideoListResponse extends BaseEportalResponse {
  List<VideoListDataResponse> data;

  VideoListResponse({required this.data, required status, required message})
      : super(status: status, message: message);

  factory VideoListResponse.fromJson(Map<String, dynamic> json) {
    List<VideoListDataResponse> data = <VideoListDataResponse>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(VideoListDataResponse.fromJson(v));
      });
    }
    return VideoListResponse(
        data: data, status: json["status"], message: json["message"]);
  }
}
