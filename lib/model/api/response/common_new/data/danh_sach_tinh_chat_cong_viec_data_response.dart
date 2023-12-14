import 'package:eportal/model/base/base_eportal_data_response.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 14/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class DanhSachTinhChatCongViecDataResponse extends BaseEportalDataResponse {
  int? idSend;
  int? total;
  String? typeOfID;
  String? typeOfName;
  String? typeOfCode;
  String? typeOfDes;
  bool? isActive;
  int? isOrder;
  String? createdBy;
  String? userName;
  String? updatedBy;
  String? userUpdate;

  DanhSachTinhChatCongViecDataResponse(
      {this.idSend,
      this.total,
      this.typeOfID,
      this.typeOfName,
      this.typeOfCode,
      this.typeOfDes,
      this.isActive,
      this.isOrder,
      this.createdBy,
      this.userName,
      this.updatedBy,
      this.userUpdate});

  DanhSachTinhChatCongViecDataResponse.fromJson(Map<String, dynamic> json) {
    idSend = json['idSend'];
    total = json['total'];
    typeOfID = json['typeOf_ID'];
    typeOfName = json['typeOf_Name'];
    typeOfCode = json['typeOf_Code'];
    typeOfDes = json['typeOf_Des'];
    isActive = json['isActive'];
    isOrder = json['isOrder'];
    createdBy = json['createdBy'];
    userName = json['userName'];
    updatedBy = json['updatedBy'];
    userUpdate = json['userUpdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idSend'] = this.idSend;
    data['total'] = this.total;
    data['typeOf_ID'] = this.typeOfID;
    data['typeOf_Name'] = this.typeOfName;
    data['typeOf_Code'] = this.typeOfCode;
    data['typeOf_Des'] = this.typeOfDes;
    data['isActive'] = this.isActive;
    data['isOrder'] = this.isOrder;
    data['createdBy'] = this.createdBy;
    data['userName'] = this.userName;
    data['updatedBy'] = this.updatedBy;
    data['userUpdate'] = this.userUpdate;
    return data;
  }
}
