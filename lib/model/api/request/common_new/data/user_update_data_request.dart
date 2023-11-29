import 'package:flutter/material.dart';

import '../../../../base/base_eportal_xml.dart';

//
// Created by BlackRose on 29/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class UserUpdateDataRequest extends BaseSingleEportalXml {
  String? hoTen;
  String? email;
  String? dienThoai;
  String? ngaySinh;
  int? gioiTinh;
  String? cmnd;
  String? diaChi;
  String? anhDaiDien;

  @override
  StringBuffer toXml() {
    // TODO: implement toXml
    var buffer = super.toXml();
    buffer.write(createXml(hoTen, "hoTen"));
    buffer.write(createXml(email, "email"));
    buffer.write(createXml(dienThoai, "dienThoai"));
    buffer.write(createXml(ngaySinh, "ngaySinh"));
    buffer.write(createXml(gioiTinh ?? 0, "gioiTinh"));
    buffer.write(createXml(cmnd, "cmnd"));
    buffer.write(createXml(diaChi, "diaChi"));
    buffer.write(createXml(anhDaiDien, "anhDaiDien"));
    return buffer;
  }
}
