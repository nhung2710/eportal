
//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/base/base_eportal_response.dart';

class DanhSachTinhTpResponse extends BaseEportalResponse{
  String? data;

  DanhSachTinhTpResponse({this.data,required status,required message}) : super(status: status, message: message);

  factory DanhSachTinhTpResponse.fromJson(Map<String, dynamic> json) {
    return DanhSachTinhTpResponse(data: json["data"],status: json["status"],message: json["message"]);
  }

}