import 'package:flutter/material.dart';

import 'danh_sach_tinh_tp_data.dart';

//
// Created by BlackRose on 13/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachMucLuongData {
  int? idSend;
  int? total;
  String? salaryID;
  String? salaryName;
  String? salaryCode;
  String? salaryDes;
  bool? isActive;
  int? isOrder;
  String? createdBy;
  String? userName;
  String? updatedBy;
  String? userUpdate;

  DanhSachMucLuongData(
      {this.idSend,
      this.total,
      this.salaryID,
      this.salaryName,
      this.salaryCode,
      this.salaryDes,
      this.isActive,
      this.isOrder,
      this.createdBy,
      this.userName,
      this.updatedBy,
      this.userUpdate});

  DanhSachMucLuongData.fromJson(Map<String, dynamic> json) {
    idSend = json['idSend'];
    total = json['total'];
    salaryID = json['salary_ID'];
    salaryName = json['salary_Name'];
    salaryCode = json['salary_Code'];
    salaryDes = json['salary_Des'];
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
    data['salary_ID'] = this.salaryID;
    data['salary_Name'] = this.salaryName;
    data['salary_Code'] = this.salaryCode;
    data['salary_Des'] = this.salaryDes;
    data['isActive'] = this.isActive;
    data['isOrder'] = this.isOrder;
    data['createdBy'] = this.createdBy;
    data['userName'] = this.userName;
    data['updatedBy'] = this.updatedBy;
    data['userUpdate'] = this.userUpdate;
    return data;
  }
}
