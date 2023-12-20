//
// Created by BlackRose on 20/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:eportal/constant/application_constant.dart';
import 'package:eportal/model/base/base_eportal_xml.dart';

class ChatBotDanhSachHoiThoaiDataRequest extends BasePageEportalXml {
  String? tuKhoa;
  int? kieuSapXep;
  int? trangThai;

  ChatBotDanhSachHoiThoaiDataRequest(
      {this.tuKhoa,
        this.trangThai = 0,
        this.kieuSapXep = 1,
        super.soTrangHienTai,
        super.soBanGhiTrenTrang});

  @override
  StringBuffer toXml() {
    // TODO: implement toXml
    var buffer = super.toXml();
    buffer.write(createXml(tuKhoa, "tuKhoa"));
    buffer.write(createXml(trangThai, "trangThai"));
    buffer.write(createXml(kieuSapXep, "kieuSapXep"));
    return buffer;
  }
}