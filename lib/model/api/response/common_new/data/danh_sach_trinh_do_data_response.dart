import 'package:eportal/model/base/base_eportal_data_response.dart';

import '../../../../../extension/string_extension.dart';

//
// Created by BlackRose on 23/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachTrinhDoDataResponse extends BaseEportalDataResponse {
  String? idSend;
  String? total;
  String? educationID;
  String? educationCode;
  String? educationName;
  String? educationDes;
  String? createdDate;
  String? createdUser;
  String? updatedDate;
  String? updatedUser;
  bool? isActive;
  String? isOrder;

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
    idSend = json['idSend']?.toString();
    total = json['total']?.toString();
    educationID = json['education_ID']?.toString();
    educationCode = json['education_Code']?.toString();
    educationName = json['education_Name']?.toString();
    educationDes = json['education_Des']?.toString();
    createdDate = json['createdDate']?.toString();
    createdUser = json['createdUser']?.toString();
    updatedDate = json['updatedDate']?.toString();
    updatedUser = json['updatedUser']?.toString();
    isActive = json['isActive'];
    isOrder = json['isOrder']?.toString();
    search = educationName.getValueSearch();
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
