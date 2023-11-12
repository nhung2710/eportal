import 'package:eportal/model/base/base_eportal_xml.dart';

//
// Created by BlackRose on 11/6/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class CommonNewData extends BaseEportalXml {
  int? flag;
  int? top;

  CommonNewData({this.flag, this.top = 10});

  @override
  StringBuffer toXml() {
    // TODO: implement toXml
    var buffer = super.toXml();
    if (flag != null) {
      buffer.write('<flag>$flag</flag>');
    }
    if (top != null) {
      buffer.write('<top>$top</top>');
    }
    return buffer;
  }
}
