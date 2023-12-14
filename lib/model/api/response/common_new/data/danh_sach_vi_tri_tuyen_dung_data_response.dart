import 'package:eportal/model/base/base_eportal_data_response.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 14/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachViTriTuyenDungDataResponse extends BaseEportalDataResponse {
  String? parentID;
  int? total;
  String? jobPlaceID;
  String? jobPlaceName;
  String? jobPlaceCode;
  String? jobPlaceDes;
  bool? isActive;
  int? isOrder;
  String? createdBy;
  String? userName;
  String? updatedBy;
  String? userUpdate;

  DanhSachViTriTuyenDungDataResponse(
      {this.parentID,
      this.total,
      this.jobPlaceID,
      this.jobPlaceName,
      this.jobPlaceCode,
      this.jobPlaceDes,
      this.isActive,
      this.isOrder,
      this.createdBy,
      this.userName,
      this.updatedBy,
      this.userUpdate});

  DanhSachViTriTuyenDungDataResponse.fromJson(Map<String, dynamic> json) {
    parentID = json['parent_ID'];
    total = json['total'];
    jobPlaceID = json['jobPlace_ID'];
    jobPlaceName = json['jobPlace_Name'];
    jobPlaceCode = json['jobPlace_Code'];
    jobPlaceDes = json['jobPlace_Des'];
    isActive = json['isActive'];
    isOrder = json['isOrder'];
    createdBy = json['createdBy'];
    userName = json['userName'];
    updatedBy = json['updatedBy'];
    userUpdate = json['userUpdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['parent_ID'] = this.parentID;
    data['total'] = this.total;
    data['jobPlace_ID'] = this.jobPlaceID;
    data['jobPlace_Name'] = this.jobPlaceName;
    data['jobPlace_Code'] = this.jobPlaceCode;
    data['jobPlace_Des'] = this.jobPlaceDes;
    data['isActive'] = this.isActive;
    data['isOrder'] = this.isOrder;
    data['createdBy'] = this.createdBy;
    data['userName'] = this.userName;
    data['updatedBy'] = this.updatedBy;
    data['userUpdate'] = this.userUpdate;
    return data;
  }
}
