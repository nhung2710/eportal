import 'package:eportal/model/base/base_eportal_data_response.dart';

//
// Created by BlackRose on 01/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class DanhSachNhuCauDataResponse extends BaseEportalDataResponse {
  String? total;
  String? docUnitID;
  String? docUnitName;
  String? docUnitDes;
  String? isOrder;
  String? createdBy;
  String? userName;
  String? updatedBy;
  String? updateName;
  String? portalID;

  DanhSachNhuCauDataResponse(
      {this.total,
      this.docUnitID,
      this.docUnitName,
      this.docUnitDes,
      this.isOrder,
      this.createdBy,
      this.userName,
      this.updatedBy,
      this.updateName,
      this.portalID});

  DanhSachNhuCauDataResponse.fromJson(Map<String, dynamic> json) {
    total = json['total']?.toString();
    docUnitID = json['docUnit_ID']?.toString();
    docUnitName = json['docUnit_Name']?.toString();
    docUnitDes = json['docUnit_Des']?.toString();
    isOrder = json['isOrder']?.toString();
    createdBy = json['createdBy']?.toString();
    userName = json['userName']?.toString();
    updatedBy = json['updatedBy']?.toString();
    updateName = json['updateName']?.toString();
    portalID = json['portalID']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['docUnit_ID'] = this.docUnitID;
    data['docUnit_Name'] = this.docUnitName;
    data['docUnit_Des'] = this.docUnitDes;
    data['isOrder'] = this.isOrder;
    data['createdBy'] = this.createdBy;
    data['userName'] = this.userName;
    data['updatedBy'] = this.updatedBy;
    data['updateName'] = this.updateName;
    data['portalID'] = this.portalID;
    return data;
  }
}
