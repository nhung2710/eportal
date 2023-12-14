import 'package:eportal/model/base/base_eportal_data_response.dart';

import '../../../../../extension/string_extension.dart';

//
// Created by BlackRose on 13/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachTinhTpDataResponse extends BaseEportalDataResponse {
  String? deletedDate;
  String? areaID;
  String? total;
  String? regionalID;
  String? regionalCode;
  String? regionalName;
  String? regionalDes;
  String? parentID;
  String? createdDate;
  String? createdUser;
  String? updatedDate;
  String? updatedUser;
  bool? isActive;
  String? isOrder;

  DanhSachTinhTpDataResponse(
      {this.deletedDate,
      this.areaID,
      this.total,
      this.regionalID,
      this.regionalCode,
      this.regionalName,
      this.regionalDes,
      this.parentID,
      this.createdDate,
      this.createdUser,
      this.updatedDate,
      this.updatedUser,
      this.isActive,
      this.isOrder});

  DanhSachTinhTpDataResponse.fromJson(Map<String, dynamic> json) {
    deletedDate = json['deletedDate']?.toString();
    areaID = json['areaID']?.toString();
    total = json['total']?.toString();
    regionalID = json['regional_ID']?.toString();
    regionalCode = json['regional_Code']?.toString();
    regionalName = json['regional_Name']?.toString();
    regionalDes = json['regional_Des']?.toString();
    parentID = json['parent_ID']?.toString();
    createdDate = json['createdDate']?.toString();
    createdUser = json['createdUser']?.toString();
    updatedDate = json['updatedDate']?.toString();
    updatedUser = json['updatedUser']?.toString();
    isActive = json['isActive'];
    isOrder = json['isOrder']?.toString();
    search = regionalName.getValueSearch();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['deletedDate'] = this.deletedDate;
    data['areaID'] = this.areaID;
    data['total'] = this.total;
    data['regional_ID'] = this.regionalID;
    data['regional_Code'] = this.regionalCode;
    data['regional_Name'] = this.regionalName;
    data['regional_Des'] = this.regionalDes;
    data['parent_ID'] = this.parentID;
    data['createdDate'] = this.createdDate;
    data['createdUser'] = this.createdUser;
    data['updatedDate'] = this.updatedDate;
    data['updatedUser'] = this.updatedUser;
    data['isActive'] = this.isActive;
    data['isOrder'] = this.isOrder;
    return data;
  }
}
