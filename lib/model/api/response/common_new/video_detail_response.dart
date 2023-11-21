import 'package:eportal/model/api/response/common_new/data/video_detail_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class VideoDetailResponse extends BaseEportalResponse {
  List<VideoDetailDataResponse>? data;

  VideoDetailResponse({this.data, required status, required message})
      : super(status: status, message: message);

  factory VideoDetailResponse.fromJson(Map<String, dynamic> json) {
    List<VideoDetailDataResponse> data = <VideoDetailDataResponse>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(VideoDetailDataResponse.fromJson(v));
      });
    }
    return VideoDetailResponse(
        data: data, status: json["status"], message: json["message"]);
  }
}
