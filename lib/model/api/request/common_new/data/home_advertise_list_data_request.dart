import 'package:eportal/model/base/base_eportal_xml.dart';

import '../../../../../constant/application_constant.dart';

//
// Created by BlackRose on 23/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class HomeAdvertiseListDataRequest extends BaseEportalXml {
  int? top;

  HomeAdvertiseListDataRequest(
      {this.top = ApplicationConstant.NUMBER_FULL_ITEM});

  @override
  StringBuffer toXml() {
    // TODO: implement toXml
    var buffer = super.toXml();
    buffer.write(createXml(top, "top"));
    return buffer;
  }
}
