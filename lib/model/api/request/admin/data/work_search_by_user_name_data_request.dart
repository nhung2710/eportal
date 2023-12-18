import 'package:eportal/constant/application_constant.dart';
import 'package:eportal/model/api/request/common_new/data/search_request_data.dart';
import 'package:eportal/model/base/base_eportal_xml.dart';

//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class WorkSearchByUserNameDataRequest extends BasePageEportalXml {
  String? mucLuong;
  String? kinhNghiem;
  String? tinhTp;
  String? quanHuyen;

  WorkSearchByUserNameDataRequest(
      {this.mucLuong,
      this.kinhNghiem,
      this.tinhTp,
      this.quanHuyen,
      super.soTrangHienTai,
      super.soBanGhiTrenTrang});

  @override
  StringBuffer toXml() {
    // TODO: implement toXml
    var buffer = super.toXml();
    buffer.write(createXml(kinhNghiem, "kinhNghiem"));
    buffer.write(createXml(tinhTp ?? 0, "tinhTp"));
    buffer.write(createXml(quanHuyen ?? 0, "quanHuyen"));
    return buffer;
  }
}
