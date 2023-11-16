
import '../../../../../constant/application_constant.dart';
import '../../../../base/base_eportal_xml.dart';

//
// Created by BlackRose on 14/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachDoanhNghiepDataRequest extends BaseEportalXml {
  int? tinhTp;
  int? quanHuyen;
  int? soTrangHienTai;
  int? soBanGhiTrenTrang;

  DanhSachDoanhNghiepDataRequest(
      {this.tinhTp,
      this.quanHuyen,
      this.soTrangHienTai = 1,
      this.soBanGhiTrenTrang = ApplicationConstant.NUMBER_FULL_ITEM *
          ApplicationConstant.NUMBER_FULL_ITEM});

  @override
  StringBuffer toXml() {
    // TODO: implement toXml
    var buffer = super.toXml();
    if (tinhTp != null) {
      buffer.write('<tinhTp>$tinhTp</tinhTp>');
    }
    if (quanHuyen != null) {
      buffer.write('<quanHuyen>$quanHuyen</quanHuyen>');
    }
    if (soTrangHienTai != null) {
      buffer.write('<soTrangHienTai>$soTrangHienTai</soTrangHienTai>');
    }
    if (soBanGhiTrenTrang != null) {
      buffer.write('<soBanGhiTrenTrang>$soBanGhiTrenTrang</soBanGhiTrenTrang>');
    }
    return buffer;
  }
}
