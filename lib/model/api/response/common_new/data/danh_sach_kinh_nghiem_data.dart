import 'package:flutter/material.dart';

//
// Created by BlackRose on 13/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachKinhNghiemData {
  int? idSend;
  int? total;
  String? experienceID;
  String? experienceName;
  String? experienceCode;
  String? experienceDes;
  bool? isActive;
  int? isOrder;
  String? createdBy;
  String? userName;
  String? updatedBy;
  String? userUpdate;

  DanhSachKinhNghiemData(
      {this.idSend,
      this.total,
      this.experienceID,
      this.experienceName,
      this.experienceCode,
      this.experienceDes,
      this.isActive,
      this.isOrder,
      this.createdBy,
      this.userName,
      this.updatedBy,
      this.userUpdate});

  DanhSachKinhNghiemData.fromJson(Map<String, dynamic> json) {
    idSend = json['idSend'];
    total = json['total'];
    experienceID = json['experience_ID'];
    experienceName = json['experience_Name'];
    experienceCode = json['experience_Code'];
    experienceDes = json['experience_Des'];
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
    data['experience_ID'] = this.experienceID;
    data['experience_Name'] = this.experienceName;
    data['experience_Code'] = this.experienceCode;
    data['experience_Des'] = this.experienceDes;
    data['isActive'] = this.isActive;
    data['isOrder'] = this.isOrder;
    data['createdBy'] = this.createdBy;
    data['userName'] = this.userName;
    data['updatedBy'] = this.updatedBy;
    data['userUpdate'] = this.userUpdate;
    return data;
  }
}
