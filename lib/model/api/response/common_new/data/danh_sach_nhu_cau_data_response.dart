import 'package:eportal/model/base/base_eportal_data_response.dart';

//
// Created by BlackRose on 01/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachNhuCauDataResponse extends BaseEportalDataResponse {
  String? idSend;
  String? total;
  String? needsID;
  String? needsName;
  String? needsCode;
  String? needsDes;
  bool? isActive;
  String? isOrder;
  String? createdBy;
  String? userName;
  String? updatedBy;
  String? userUpdate;

  DanhSachNhuCauDataResponse(
      {this.idSend,
      this.total,
      this.needsID,
      this.needsName,
      this.needsCode,
      this.needsDes,
      this.isActive,
      this.isOrder,
      this.createdBy,
      this.userName,
      this.updatedBy,
      this.userUpdate});

  DanhSachNhuCauDataResponse.fromJson(Map<String, dynamic> json) {
    idSend = json['idSend']?.toString();
    total = json['total']?.toString();
    needsID = json['needs_ID']?.toString();
    needsName = json['needs_Name']?.toString();
    needsCode = json['needs_Code']?.toString();
    needsDes = json['needs_Des']?.toString();
    isActive = json['isActive'];
    isOrder = json['isOrder']?.toString();
    createdBy = json['createdBy']?.toString();
    userName = json['userName']?.toString();
    updatedBy = json['updatedBy']?.toString();
    userUpdate = json['userUpdate']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idSend'] = this.idSend;
    data['total'] = this.total;
    data['needs_ID'] = this.needsID;
    data['needs_Name'] = this.needsName;
    data['needs_Code'] = this.needsCode;
    data['needs_Des'] = this.needsDes;
    data['isActive'] = this.isActive;
    data['isOrder'] = this.isOrder;
    data['createdBy'] = this.createdBy;
    data['userName'] = this.userName;
    data['updatedBy'] = this.updatedBy;
    data['userUpdate'] = this.userUpdate;
    return data;
  }
}
