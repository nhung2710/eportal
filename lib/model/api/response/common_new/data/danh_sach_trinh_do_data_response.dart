import 'package:eportal/model/base/base_eportal_data_response.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 23/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachTrinhDoDataResponse extends BaseEportalDataResponse {
  int? idSend;
  int? total;
  int? educationID;
  String? educationCode;
  String? educationName;
  String? educationDes;
  String? createdDate;
  String? createdUser;
  String? updatedDate;
  String? updatedUser;
  bool? isActive;
  int? isOrder;

  DanhSachTrinhDoDataResponse(
      {this.idSend,
      this.total,
      this.educationID,
      this.educationCode,
      this.educationName,
      this.educationDes,
      this.createdDate,
      this.createdUser,
      this.updatedDate,
      this.updatedUser,
      this.isActive,
      this.isOrder});

  DanhSachTrinhDoDataResponse.fromJson(Map<String, dynamic> json) {
    idSend = json['idSend'];
    total = json['total'];
    educationID = json['education_ID'];
    educationCode = json['education_Code'];
    educationName = json['education_Name'];
    educationDes = json['education_Des'];
    createdDate = json['createdDate'];
    createdUser = json['createdUser'];
    updatedDate = json['updatedDate'];
    updatedUser = json['updatedUser'];
    isActive = json['isActive'];
    isOrder = json['isOrder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idSend'] = this.idSend;
    data['total'] = this.total;
    data['education_ID'] = this.educationID;
    data['education_Code'] = this.educationCode;
    data['education_Name'] = this.educationName;
    data['education_Des'] = this.educationDes;
    data['createdDate'] = this.createdDate;
    data['createdUser'] = this.createdUser;
    data['updatedDate'] = this.updatedDate;
    data['updatedUser'] = this.updatedUser;
    data['isActive'] = this.isActive;
    data['isOrder'] = this.isOrder;
    return data;
  }
}
