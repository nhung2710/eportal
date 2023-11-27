import 'package:eportal/model/api/request/common_new/data/search_request_data.dart';
import 'package:eportal/model/base/base_eportal_xml.dart';

import '../../../../../constant/application_constant.dart';

//
// Created by BlackRose on 13/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class NewsSearchDataRequest extends BasePageEportalXml {
  String? tuKhoa;
  int? chuyenMuc;

  NewsSearchDataRequest(
      {this.tuKhoa,
      this.chuyenMuc,
      super.soBanGhiTrenTrang,
      super.soTrangHienTai});

  @override
  StringBuffer toXml() {
    // TODO: implement toXml
    var buffer = super.toXml();
    buffer.write(createXml(tuKhoa, "tuKhoa"));
    buffer.write(createXml(chuyenMuc ?? 0, "chuyenMuc"));
    return buffer;
  }
}
