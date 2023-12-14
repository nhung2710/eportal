import 'package:eportal/model/base/base_eportal_data_response.dart';

import '../../../../../extension/string_extension.dart';

//
// Created by BlackRose on 13/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachMucLuongDataResponse extends BaseEportalDataResponse {
  String? idSend;
  String? total;
  String? salaryID;
  String? salaryName;
  String? salaryCode;
  String? salaryDes;
  bool? isActive;
  String? isOrder;
  String? createdBy;
  String? userName;
  String? updatedBy;
  String? userUpdate;

  DanhSachMucLuongDataResponse(
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

  DanhSachMucLuongDataResponse.fromJson(Map<String, dynamic> json) {
    idSend = json['idSend']?.toString();
    total = json['total']?.toString();
    salaryID = json['salary_ID']?.toString();
    salaryName = json['salary_Name']?.toString();
    salaryCode = json['salary_Code']?.toString();
    salaryDes = json['salary_Des']?.toString();
    isActive = json['isActive'];
    isOrder = json['isOrder']?.toString();
    createdBy = json['createdBy']?.toString();
    userName = json['userName']?.toString();
    updatedBy = json['updatedBy']?.toString();
    userUpdate = json['userUpdate']?.toString();
    search = salaryName.getValueSearch();
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
