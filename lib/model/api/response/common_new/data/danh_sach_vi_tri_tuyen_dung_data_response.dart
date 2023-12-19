import 'package:eportal/model/base/base_eportal_data_response.dart';
import 'package:flutter/material.dart';

import '../../../../../extension/string_extension.dart';

//
// Created by BlackRose on 14/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachViTriTuyenDungDataResponse extends BaseEportalDataResponse {
  String? parentID;
  String? total;
  String? jobPlaceID;
  String? jobPlaceName;
  String? jobPlaceCode;
  String? jobPlaceDes;
  bool? isActive;
  String? isOrder;
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
    parentID = json['parent_ID']?.toString();
    total = json['total']?.toString();
    jobPlaceID = json['jobPlace_ID']?.toString();
    jobPlaceName = json['jobPlace_Name']?.toString();
    jobPlaceCode = json['jobPlace_Code']?.toString();
    jobPlaceDes = json['jobPlace_Des']?.toString();
    isActive = json['isActive'];
    isOrder = json['isOrder']?.toString();
    createdBy = json['createdBy']?.toString();
    userName = json['userName']?.toString();
    updatedBy = json['updatedBy']?.toString();
    userUpdate = json['userUpdate']?.toString();
    search = jobPlaceName.getValueSearch();
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
