import 'package:eportal/model/api/request/common_new/data/search_request_data.dart';

import 'news_search_data_request.dart';
import 'work_search_data_request.dart';

//
// Created by BlackRose on 13/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class JobUserSearchDataRequest extends SearchRequestData {
  String? tuKhoa;
  int? kieuSapXep;

  JobUserSearchDataRequest(
      {this.tuKhoa,
      this.kieuSapXep = 1,
      super.doanhNghiep,
      super.mucLuong,
      super.kinhNghiem,
      super.tinhTp,
      super.quanHuyen,
      super.soTrangHienTai,
      super.soBanGhiTrenTrang});

  @override
  StringBuffer toXml() {
    // TODO: implement toXml
    var buffer = super.toXml();
    buffer.write(createXml(tuKhoa, "tuKhoa"));
    buffer.write(createXml(mucLuong, "mucLuong"));
    buffer.write(createXml(kieuSapXep, "kieuSapXep"));
    return buffer;
  }
}
