import '../../../../base/base_eportal_xml.dart';

//
// Created by BlackRose on 14/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachQuanHuyenDataRequest extends BaseEportalXml {
  String? tinhTp;

  DanhSachQuanHuyenDataRequest({this.tinhTp});

  @override
  StringBuffer toXml() {
    // TODO: implement toXml
    var buffer = super.toXml();
    buffer.write(createXml(tinhTp, "tinhTp"));
    return buffer;
  }
}
