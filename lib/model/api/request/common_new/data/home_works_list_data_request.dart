import 'package:eportal/model/api/request/common_new/data/home_document_list_data_request.dart';
import 'package:eportal/model/base/base_eportal_xml.dart';

import '../../../../../constant/application_constant.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class HomeWorksListDataRequest extends BaseMultiEportalXml {
  int flag;

  HomeWorksListDataRequest({this.flag = 1, super.top});

  @override
  StringBuffer toXml() {
    // TODO: implement toXml
    var buffer = super.toXml();
    buffer.write(createXml(flag, "flag"));
    return buffer;
  }
}
