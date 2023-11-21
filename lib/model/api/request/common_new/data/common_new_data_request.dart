import 'package:eportal/model/base/base_eportal_xml.dart';

//
// Created by BlackRose on 11/6/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class CommonNewDataRequest extends BaseEportalXml {
  int? flag;
  int? top;

  CommonNewDataRequest({this.flag, this.top = 10});

  @override
  StringBuffer toXml() {
    // TODO: implement toXml
    var buffer = super.toXml();
    buffer.write(createXml(flag, "flag"));
    buffer.write(createXml(top, "top"));
    return buffer;
  }
}
