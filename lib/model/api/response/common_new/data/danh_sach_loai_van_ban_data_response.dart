//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/base/base_eportal_data_response.dart';

import '../../../../../extension/string_extension.dart';

class DanhSachLoaiVanBanDataResponse extends BaseEportalDataResponse {
  int? total;
  String? docTypeID;
  String? docTypeName;
  String? docTypeDes;
  int? isOrder;
  String? createdBy;
  String? userName;
  String? updatedBy;
  String? updateName;
  int? portalID;

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
    total = json['total'];
    docTypeID = json['docType_ID'];
    docTypeName = json['docType_Name'];
    docTypeDes = json['docType_Des'];
    isOrder = json['isOrder'];
    createdBy = json['createdBy'];
    userName = json['userName'];
    updatedBy = json['updatedBy'];
    updateName = json['updateName'];
    portalID = json['portalID'];

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
