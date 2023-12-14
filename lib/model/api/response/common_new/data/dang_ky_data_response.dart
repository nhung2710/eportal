//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/base/base_eportal_data_response.dart';

class DangKyDataResponse extends BaseEportalDataResponse {
  String? userID;
  String? userName;
  String? message;
  String? role;

  DangKyDataResponse({this.userID, this.userName, this.message, this.role});

  DangKyDataResponse.fromJson(Map<String, dynamic> json) {
    userID = json['userID']?.toString();
    userName = json['userName']?.toString();
    message = json['message']?.toString();
    role = json['role']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userID'] = this.userID;
    data['userName'] = this.userName;
    data['message'] = this.message;
    data['role'] = this.role;
    return data;
  }
}
