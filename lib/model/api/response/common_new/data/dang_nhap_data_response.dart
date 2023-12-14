//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:eportal/enum/role_type.dart';
import 'package:eportal/model/base/base_eportal_data_response.dart';

class DangNhapDataResponse extends BaseEportalDataResponse {
  String? userID;
  String? userName;
  String? message;
  String? role;
  RoleType roleType = RoleType.anonymous;

  DangNhapDataResponse(
      {this.userID,
      this.userName,
      this.message,
      this.role,
      this.roleType = RoleType.anonymous});

  DangNhapDataResponse.fromJson(Map<String, dynamic> json) {
    userID = json['userID']?.toString();
    userName = json['userName']?.toString();
    message = json['message']?.toString();
    role = json['role']?.toString();
    switch (role) {
      case "users":
        roleType = RoleType.users;
        break;
      case "bussiness":
        roleType = RoleType.bussiness;
        break;
      case "cms":
        roleType = RoleType.cms;
        break;
      default:
        roleType = RoleType.anonymous;
        break;
    }
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
