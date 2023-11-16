
import '../../../../base/base_eportal_xml.dart';

//
// Created by BlackRose on 14/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachQuanHuyenDataRequest extends BaseEportalXml {
  int? tinhTp;

  DanhSachQuanHuyenDataRequest({this.tinhTp});

  @override
  StringBuffer toXml() {
    // TODO: implement toXml
    var buffer = super.toXml();
    if (tinhTp != null) {
      buffer.write('<tinhTp>$tinhTp</tinhTp>');
    }
    return buffer;
  }
}
