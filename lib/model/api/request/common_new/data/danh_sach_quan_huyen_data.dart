import 'package:flutter/material.dart';

import '../../../../base/base_eportal_xml.dart';

//
// Created by BlackRose on 14/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachQuanHuyenData extends BaseEportalXml {
  int? id;

  DanhSachQuanHuyenData({this.id});

  @override
  StringBuffer toXml() {
    // TODO: implement toXml
    var buffer = super.toXml();
    if (id != null) {
      buffer.write('<id>$id</id>');
    }
    return buffer;
  }
}
