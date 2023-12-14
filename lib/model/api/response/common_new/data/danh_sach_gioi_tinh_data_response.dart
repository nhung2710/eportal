//
// Created by BlackRose on 13/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/base/base_eportal_data_response.dart';

class DanhSachGioiTinhDataResponse extends BaseEportalDataResponse {
  String? name;
  String? id;

  DanhSachGioiTinhDataResponse({this.name, this.id});

  DanhSachGioiTinhDataResponse.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    id = json['id']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}
