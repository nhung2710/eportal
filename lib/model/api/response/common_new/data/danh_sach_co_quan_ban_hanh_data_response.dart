//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:eportal/model/base/base_eportal_data_response.dart';

import '../../../../../extension/string_extension.dart';

class DanhSachCoQuanBanHanhDataResponse extends BaseEportalDataResponse {
  int? total;
  String? docUnitID;
  String? docUnitName;
  String? docUnitDes;
  int? isOrder;
  String? createdBy;
  String? userName;
  String? updatedBy;
  String? updateName;
  int? portalID;

  DanhSachCoQuanBanHanhDataResponse(
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

  DanhSachCoQuanBanHanhDataResponse.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    docUnitID = json['docUnit_ID'];
    docUnitName = json['docUnit_Name'];
    docUnitDes = json['docUnit_Des'];
    isOrder = json['isOrder'];
    createdBy = json['createdBy'];
    userName = json['userName'];
    updatedBy = json['updatedBy'];
    updateName = json['updateName'];
    portalID = json['portalID'];

    search = docUnitName.getValueSearch();
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
