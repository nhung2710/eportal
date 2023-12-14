import 'package:eportal/model/base/base_eportal_data_response.dart';

import '../../../../../extension/string_extension.dart';

//
// Created by BlackRose on 13/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachKinhNghiemDataResponse extends BaseEportalDataResponse {
  String? idSend;
  String? total;
  String? experienceID;
  String? experienceName;
  String? experienceCode;
  String? experienceDes;
  bool? isActive;
  String? isOrder;
  String? createdBy;
  String? userName;
  String? updatedBy;
  String? userUpdate;

  DanhSachKinhNghiemDataResponse(
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

  DanhSachKinhNghiemDataResponse.fromJson(Map<String, dynamic> json) {
    idSend = json['idSend']?.toString();
    total = json['total']?.toString();
    experienceID = json['experience_ID']?.toString();
    experienceName = json['experience_Name']?.toString();
    experienceCode = json['experience_Code']?.toString();
    experienceDes = json['experience_Des']?.toString();
    isActive = json['isActive'];
    isOrder = json['isOrder']?.toString();
    createdBy = json['createdBy']?.toString();
    userName = json['userName']?.toString();
    updatedBy = json['updatedBy']?.toString();
    userUpdate = json['userUpdate']?.toString();
    search = experienceName.getValueSearch();
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
