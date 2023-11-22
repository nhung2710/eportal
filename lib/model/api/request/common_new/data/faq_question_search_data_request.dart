import 'package:eportal/model/base/base_eportal_xml.dart';

import '../../../../../constant/application_constant.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class FaqQuestionSearchDataRequest extends BaseEportalXml {
  int soTrangHienTai;
  int soBanGhiTrenTrang;

  FaqQuestionSearchDataRequest(
      {this.soTrangHienTai = 1,
      this.soBanGhiTrenTrang = ApplicationConstant.NUMBER_PREVIEW_ITEM});

  @override
  StringBuffer toXml() {
    // TODO: implement toXml
    var buffer = super.toXml();

    buffer.write(createXml(soTrangHienTai, "soTrangHienTai"));
    buffer.write(createXml(soBanGhiTrenTrang, "soBanGhiTrenTrang"));
    return buffer;
  }
}
