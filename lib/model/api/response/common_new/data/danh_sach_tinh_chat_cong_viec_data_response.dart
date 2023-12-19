import 'package:eportal/model/base/base_eportal_data_response.dart';
import 'package:flutter/material.dart';

import '../../../../../extension/string_extension.dart';

//
// Created by BlackRose on 14/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class DanhSachTinhChatCongViecDataResponse extends BaseEportalDataResponse {
  String? idSend;
  String? total;
  String? typeOfID;
  String? typeOfName;
  String? typeOfCode;
  String? typeOfDes;
  bool? isActive;
  String? isOrder;
  String? createdBy;
  String? userName;
  String? updatedBy;
  String? userUpdate;

  DanhSachTinhChatCongViecDataResponse(
      {this.idSend,
      this.total,
      this.typeOfID,
      this.typeOfName,
      this.typeOfCode,
      this.typeOfDes,
      this.isActive,
      this.isOrder,
      this.createdBy,
      this.userName,
      this.updatedBy,
      this.userUpdate});

  DanhSachTinhChatCongViecDataResponse.fromJson(Map<String, dynamic> json) {
    idSend = json['idSend']?.toString();
    total = json['total']?.toString();
    typeOfID = json['typeOf_ID']?.toString();
    typeOfName = json['typeOf_Name']?.toString();
    typeOfCode = json['typeOf_Code']?.toString();
    typeOfDes = json['typeOf_Des']?.toString();
    isActive = json['isActive'];
    isOrder = json['isOrder']?.toString();
    createdBy = json['createdBy']?.toString();
    userName = json['userName']?.toString();
    updatedBy = json['updatedBy']?.toString();
    userUpdate = json['userUpdate']?.toString();
    search = typeOfName.getValueSearch();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idSend'] = this.idSend;
    data['total'] = this.total;
    data['typeOf_ID'] = this.typeOfID;
    data['typeOf_Name'] = this.typeOfName;
    data['typeOf_Code'] = this.typeOfCode;
    data['typeOf_Des'] = this.typeOfDes;
    data['isActive'] = this.isActive;
    data['isOrder'] = this.isOrder;
    data['createdBy'] = this.createdBy;
    data['userName'] = this.userName;
    data['updatedBy'] = this.updatedBy;
    data['userUpdate'] = this.userUpdate;
    return data;
  }
}
