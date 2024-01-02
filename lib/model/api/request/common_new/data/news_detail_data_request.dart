import '../../../../base/base_eportal_xml.dart';

//
// Created by BlackRose on 27/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class NewsDetailDataRequest extends BaseSingleEportalXml {
  String? id;

  NewsDetailDataRequest({this.id = "0"});

  @override
  StringBuffer toXml() {
    // TODO: implement toXml
    var buffer = super.toXml();
    buffer.write(createXml(id, "id"));
    return buffer;
  }
}
