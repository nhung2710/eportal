//
// Created by BlackRose on 20/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:eportal/constant/application_constant.dart';
import 'package:eportal/model/base/base_eportal_xml.dart';

class ChatBotThemCauMauDataRequest extends BaseEportalXml {
  String? cauMau;

  ChatBotThemCauMauDataRequest({this.cauMau});

  @override
  StringBuffer toXml() {
    // TODO: implement toXml
    var buffer = super.toXml();
    buffer.write(createXml(cauMau, "cauMau"));
    return buffer;
  }
}
