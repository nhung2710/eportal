import '../../../../../constant/application_constant.dart';
import '../../../../base/base_eportal_xml.dart';

//
// Created by BlackRose on 15/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class SearchRequestData extends BasePageEportalXml {
  String? doanhNghiep;
  String? mucLuong;
  String? kinhNghiem;
  int? tinhTp;
  int? quanHuyen;

  SearchRequestData(
      {this.doanhNghiep,
      this.mucLuong,
      this.kinhNghiem,
      this.tinhTp,
      this.quanHuyen,
      super.soTrangHienTai,
      super.soBanGhiTrenTrang});

  @override
  StringBuffer toXml() {
    // TODO: implement toXml
    var buffer = super.toXml();
    buffer.write(createXml(doanhNghiep, "doanhNghiep"));
    buffer.write(createXml(kinhNghiem, "kinhNghiem"));
    buffer.write(createXml(tinhTp ?? 0, "tinhTp"));
    buffer.write(createXml(quanHuyen ?? 0, "quanHuyen"));
    return buffer;
  }
}
