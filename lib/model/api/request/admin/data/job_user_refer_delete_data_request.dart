import 'package:eportal/constant/application_constant.dart';
import 'package:eportal/model/base/base_eportal_xml.dart';

//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class JobUserReferDeleteDataRequest extends BaseEportalXml {
  int? top;

  JobUserReferDeleteDataRequest(
      {this.top = ApplicationConstant.NUMBER_FULL_ITEM});

  @override
  StringBuffer toXml() {
    // TODO: implement toXml
    var buffer = super.toXml();
    buffer.write(createXml(top, "top"));
    return buffer;
  }
}
