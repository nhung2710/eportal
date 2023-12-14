import 'package:eportal/model/base/base_eportal_data_response.dart';

import '../../../../../extension/string_extension.dart';

//
// Created by BlackRose on 01/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachNganhNgheDataResponse extends BaseEportalDataResponse {
  String? id;
  String? total;
  String? careerID;
  String? careerName;
  String? careerCode;
  String? careerDes;
  bool? isActive;
  String? isOrder;
  String? createdBy;
  String? userName;
  String? updatedBy;
  String? userUpdate;

  DanhSachNganhNgheDataResponse(
      {this.id,
      this.total,
      this.careerID,
      this.careerName,
      this.careerCode,
      this.careerDes,
      this.isActive,
      this.isOrder,
      this.createdBy,
      this.userName,
      this.updatedBy,
      this.userUpdate});

  DanhSachNganhNgheDataResponse.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    total = json['total']?.toString();
    careerID = json['career_ID']?.toString();
    careerName = json['career_Name']?.toString();
    careerCode = json['career_Code']?.toString();
    careerDes = json['career_Des']?.toString();
    isActive = json['isActive'];
    isOrder = json['isOrder']?.toString();
    createdBy = json['createdBy']?.toString();
    userName = json['userName']?.toString();
    updatedBy = json['updatedBy']?.toString();
    userUpdate = json['userUpdate']?.toString();
    search = careerName.getValueSearch();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['total'] = this.total;
    data['career_ID'] = this.careerID;
    data['career_Name'] = this.careerName;
    data['career_Code'] = this.careerCode;
    data['career_Des'] = this.careerDes;
    data['isActive'] = this.isActive;
    data['isOrder'] = this.isOrder;
    data['createdBy'] = this.createdBy;
    data['userName'] = this.userName;
    data['updatedBy'] = this.updatedBy;
    data['userUpdate'] = this.userUpdate;
    return data;
  }
}
