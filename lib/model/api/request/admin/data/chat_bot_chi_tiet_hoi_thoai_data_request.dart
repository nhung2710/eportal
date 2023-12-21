//
// Created by BlackRose on 20/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/constant/application_constant.dart';
import 'package:eportal/model/base/base_eportal_xml.dart';

class ChatBotChiTietHoiThoaiDataRequest extends BaseMultiEportalXml {
  String? idHoiThoai;
  ChatBotChiTietHoiThoaiDataRequest(
      {this.idHoiThoai});

  @override
  StringBuffer toXml() {
    // TODO: implement toXml
    var buffer = super.toXml();
    buffer.write(createXml(idHoiThoai, "idHoiThoai"));
    return buffer;
  }
}
