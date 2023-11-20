import 'package:eportal/model/api/request/common_new/data/search_request_data.dart';

import '../../../../../constant/application_constant.dart';

//
// Created by BlackRose on 13/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class NewsSearchDataRequest extends SearchRequestData {
  String? tuKhoa;
  String? kieuSapXep;

  NewsSearchDataRequest(
      {this.tuKhoa,
      this.kieuSapXep,
      doanhNghiep,
      mucLuong,
      kinhNghiem,
      tinhTp,
      quanHuyen,
      soTrangHienTai = 1,
      soBanGhiTrenTrang = ApplicationConstant.NUMBER_PREVIEW_ITEM})
      : super(
            doanhNghiep: doanhNghiep,
            mucLuong: mucLuong,
            quanHuyen: quanHuyen,
            kinhNghiem: kinhNghiem,
            soBanGhiTrenTrang: soBanGhiTrenTrang,
            soTrangHienTai: soTrangHienTai,
            tinhTp: tinhTp);

  @override
  StringBuffer toXml() {
    // TODO: implement toXml
    var buffer = super.toXml();
    if (tuKhoa != null) {
      buffer.write('<tuKhoa>$tuKhoa</tuKhoa>');
    }
    if (kieuSapXep != null) {
      buffer.write('<kieuSapXep>$kieuSapXep</kieuSapXep>');
    }
    return buffer;
  }
}
