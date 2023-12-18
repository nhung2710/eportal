import 'package:eportal/model/base/base_eportal_data_response.dart';

//
// Created by BlackRose on 01/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class JobUserReferListDataResponse extends BaseEportalDataResponse {
  String? total;
  String? id;
  String? jobUserID;
  String? hoTen;
  String? chucVu;
  String? noiCongTac;
  String? soDienThoai;
  String? email;
  String? moiQuanHe;

  JobUserReferListDataResponse(
      {this.total,
      this.id,
      this.jobUserID,
      this.hoTen,
      this.chucVu,
      this.noiCongTac,
      this.soDienThoai,
      this.email,
      this.moiQuanHe});

  JobUserReferListDataResponse.fromJson(Map<String, dynamic> json) {
    total = json['total']?.toString();
    id = json['id']?.toString();
    jobUserID = json['jobUserID']?.toString();
    hoTen = json['hoTen']?.toString();
    chucVu = json['chucVu']?.toString();
    noiCongTac = json['noiCongTac']?.toString();
    soDienThoai = json['soDienThoai']?.toString();
    email = json['email']?.toString();
    moiQuanHe = json['moiQuanHe']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['id'] = this.id;
    data['jobUserID'] = this.jobUserID;
    data['hoTen'] = this.hoTen;
    data['chucVu'] = this.chucVu;
    data['noiCongTac'] = this.noiCongTac;
    data['soDienThoai'] = this.soDienThoai;
    data['email'] = this.email;
    data['moiQuanHe'] = this.moiQuanHe;
    return data;
  }
}
