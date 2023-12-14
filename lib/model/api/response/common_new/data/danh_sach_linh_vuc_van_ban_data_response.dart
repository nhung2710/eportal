//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import '../../../../../extension/string_extension.dart';
import '../../../../base/base_eportal_data_response.dart';

class DanhSachLinhVucVanBanDataResponse extends BaseEportalDataResponse {
  String? total;
  String? docFieldID;
  String? docFieldName;
  String? docFieldDes;
  String? isOrder;
  String? createdBy;
  String? userName;
  String? updatedBy;
  String? updateName;
  String? portalID;

  DanhSachLinhVucVanBanDataResponse(
      {this.total,
      this.docFieldID,
      this.docFieldName,
      this.docFieldDes,
      this.isOrder,
      this.createdBy,
      this.userName,
      this.updatedBy,
      this.updateName,
      this.portalID});

  DanhSachLinhVucVanBanDataResponse.fromJson(Map<String, dynamic> json) {
    total = json['total']?.toString();
    docFieldID = json['docField_ID']?.toString();
    docFieldName = json['docField_Name']?.toString();
    docFieldDes = json['docField_Des']?.toString();
    isOrder = json['isOrder']?.toString();
    createdBy = json['createdBy']?.toString();
    userName = json['userName']?.toString();
    updatedBy = json['updatedBy']?.toString();
    updateName = json['updateName']?.toString();
    portalID = json['portalID']?.toString();
    search = docFieldName.getValueSearch();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['docField_ID'] = this.docFieldID;
    data['docField_Name'] = this.docFieldName;
    data['docField_Des'] = this.docFieldDes;
    data['isOrder'] = this.isOrder;
    data['createdBy'] = this.createdBy;
    data['userName'] = this.userName;
    data['updatedBy'] = this.updatedBy;
    data['updateName'] = this.updateName;
    data['portalID'] = this.portalID;
    return data;
  }
}
