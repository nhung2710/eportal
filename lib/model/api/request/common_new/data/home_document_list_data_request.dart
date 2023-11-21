import 'package:eportal/constant/application_constant.dart';
import 'package:eportal/model/base/base_eportal_xml.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class HomeDocumentListDataRequest extends BaseEportalXml {
  int? top;

  HomeDocumentListDataRequest(
      {this.top = ApplicationConstant.NUMBER_PREVIEW_ITEM});

  @override
  StringBuffer toXml() {
    // TODO: implement toXml
    var buffer = super.toXml();
    buffer.write(createXml(top, "top"));
    return buffer;
  }
}
