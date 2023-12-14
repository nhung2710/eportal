import 'package:eportal/model/base/base_eportal_data_response.dart';

import '../../../../../extension/string_extension.dart';

//
// Created by BlackRose on 01/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachChucVuDataResponse extends BaseEportalDataResponse {
  String? id;
  String? total;
  String? positionID;
  String? positionCode;
  String? positionName;
  String? positionDes;
  String? createdDate;
  String? createdUser;
  String? updatedDate;
  String? updatedUser;
  bool? isActive;
  String? isOrder;

  DanhSachChucVuDataResponse(
      {this.id,
      this.total,
      this.positionID,
      this.positionCode,
      this.positionName,
      this.positionDes,
      this.createdDate,
      this.createdUser,
      this.updatedDate,
      this.updatedUser,
      this.isActive,
      this.isOrder});

  DanhSachChucVuDataResponse.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    total = json['total']?.toString();
    positionID = json['position_ID']?.toString();
    positionCode = json['position_Code']?.toString();
    positionName = json['position_Name']?.toString();
    positionDes = json['position_Des']?.toString();
    createdDate = json['createdDate']?.toString();
    createdUser = json['createdUser']?.toString();
    updatedDate = json['updatedDate']?.toString();
    updatedUser = json['updatedUser']?.toString();
    isActive = json['isActive'];
    isOrder = json['isOrder']?.toString();
    search = positionName.getValueSearch();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['total'] = this.total;
    data['position_ID'] = this.positionID;
    data['position_Code'] = this.positionCode;
    data['position_Name'] = this.positionName;
    data['position_Des'] = this.positionDes;
    data['createdDate'] = this.createdDate;
    data['createdUser'] = this.createdUser;
    data['updatedDate'] = this.updatedDate;
    data['updatedUser'] = this.updatedUser;
    data['isActive'] = this.isActive;
    data['isOrder'] = this.isOrder;
    return data;
  }
}
