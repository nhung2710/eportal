
//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/base/base_eportal_response.dart';

class NewsDetailResponse extends BaseEportalResponse{
  String? data;

  NewsDetailResponse({this.data,required status,required message}) : super(status: status, message: message);

  factory NewsDetailResponse.fromJson(Map<String, dynamic> json) {
    return NewsDetailResponse(data: json["data"],status: json["status"],message: json["message"]);
  }

}