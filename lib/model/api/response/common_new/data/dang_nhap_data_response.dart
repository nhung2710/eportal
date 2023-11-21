//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class DangNhapDataResponse {
  String? userID;
  String? userName;
  String? message;
  String? role;

  DangNhapDataResponse({this.userID, this.userName, this.message, this.role});

  DangNhapDataResponse.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    userName = json['userName'];
    message = json['message'];
    role = json['role'];
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
