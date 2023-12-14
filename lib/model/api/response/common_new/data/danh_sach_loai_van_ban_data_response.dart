//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/base/base_eportal_data_response.dart';

import '../../../../../extension/string_extension.dart';

class DanhSachLoaiVanBanDataResponse extends BaseEportalDataResponse {
  String? total;
  String? docTypeID;
  String? docTypeName;
  String? docTypeDes;
  String? isOrder;
  String? createdBy;
  String? userName;
  String? updatedBy;
  String? updateName;
  String? portalID;

  DanhSachLoaiVanBanDataResponse(
      {this.total,
      this.docTypeID,
      this.docTypeName,
      this.docTypeDes,
      this.isOrder,
      this.createdBy,
      this.userName,
      this.updatedBy,
      this.updateName,
      this.portalID});

  DanhSachLoaiVanBanDataResponse.fromJson(Map<String, dynamic> json) {
    total = json['total']?.toString();
    docTypeID = json['docType_ID']?.toString();
    docTypeName = json['docType_Name']?.toString();
    docTypeDes = json['docType_Des']?.toString();
    isOrder = json['isOrder']?.toString();
    createdBy = json['createdBy']?.toString();
    userName = json['userName']?.toString();
    updatedBy = json['updatedBy']?.toString();
    updateName = json['updateName']?.toString();
    portalID = json['portalID']?.toString();

    search = docTypeName.getValueSearch();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['docType_ID'] = this.docTypeID;
    data['docType_Name'] = this.docTypeName;
    data['docType_Des'] = this.docTypeDes;
    data['isOrder'] = this.isOrder;
    data['createdBy'] = this.createdBy;
    data['userName'] = this.userName;
    data['updatedBy'] = this.updatedBy;
    data['updateName'] = this.updateName;
    data['portalID'] = this.portalID;
    return data;
  }
}
