import '../../../../../constant/application_constant.dart';
import '../../../../base/base_eportal_xml.dart';

//
// Created by BlackRose on 14/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachDoanhNghiepDataRequest extends BaseEportalXml {
  String? tinhTp;
  String? quanHuyen;
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
    buffer.write(createXml(tinhTp, "tinhTp"));
    buffer.write(createXml(quanHuyen, "quanHuyen"));
    buffer.write(createXml(soTrangHienTai, "soTrangHienTai"));
    buffer.write(createXml(soBanGhiTrenTrang, "soBanGhiTrenTrang"));
    return buffer;
  }
}
