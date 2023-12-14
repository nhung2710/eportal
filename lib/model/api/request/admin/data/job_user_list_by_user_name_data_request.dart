import 'package:eportal/constant/application_constant.dart';
import 'package:eportal/model/base/base_eportal_xml.dart';

//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class JobUserListByUserNameDataRequest extends BasePageEportalXml {
  String? tuKhoa;
  int? kieuSapXep;

  JobUserListByUserNameDataRequest(
      {this.tuKhoa,
      this.kieuSapXep = 1,
      super.soTrangHienTai,
      super.soBanGhiTrenTrang});

  @override
  StringBuffer toXml() {
    // TODO: implement toXml
    var buffer = super.toXml();
    buffer.write(createXml(tuKhoa, "tuKhoa"));
    buffer.write(createXml(kieuSapXep, "kieuSapXep"));
    return buffer;
  }
}
