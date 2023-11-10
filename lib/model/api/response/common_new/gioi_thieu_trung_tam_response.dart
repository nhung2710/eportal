import 'package:eportal/model/api/response/common_new/data/common_new_data.dart';
import 'package:eportal/model/base/base_eportal_response.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class GioiThieuTrungTamResponse extends BaseEportalResponse{
  String? data;

  GioiThieuTrungTamResponse({this.data,required status,required message}) : super(status: status, message: message);

  factory GioiThieuTrungTamResponse.fromJson(Map<String, dynamic> json) {
    return GioiThieuTrungTamResponse(data: json["data"],status: json["status"],message: json["message"]);
  }

}
