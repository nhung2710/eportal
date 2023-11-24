import 'package:eportal/model/base/base_eportal_data_response.dart';

import '../../../../../extension/string_extension.dart';

//
// Created by BlackRose on 13/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachQuanHuyenDataResponse extends BaseEportalDataResponse {
  String? deletedDate;
  int? areaID;
  int? total;
  int? regionalID;
  String? regionalCode;
  String? regionalName;
  String? regionalDes;
  int? parentID;
  String? createdDate;
  String? createdUser;
  String? updatedDate;
  String? updatedUser;
  bool? isActive;
  int? isOrder;
  String search = "";

  DanhSachQuanHuyenDataResponse(
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

  DanhSachQuanHuyenDataResponse.fromJson(Map<String, dynamic> json) {
    deletedDate = json['deletedDate'];
    areaID = json['areaID'];
    total = json['total'];
    regionalID = json['regional_ID'];
    regionalCode = json['regional_Code'];
    regionalName = json['regional_Name'];
    regionalDes = json['regional_Des'];
    parentID = json['parent_ID'];
    createdDate = json['createdDate'];
    createdUser = json['createdUser'];
    updatedDate = json['updatedDate'];
    updatedUser = json['updatedUser'];
    isActive = json['isActive'];
    isOrder = json['isOrder'];
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

  bool filter(String filter) {
    return filter.isNullOrWhiteSpace() ||
        search.contains(filter.getValueSearch());
  }
}
