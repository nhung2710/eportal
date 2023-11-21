import 'package:eportal/model/api/request/common_new/data/home_document_list_data_request.dart';

import '../../../../../constant/application_constant.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class HomeWorksListDataRequest extends HomeDocumentListDataRequest {
  int? flag;

  HomeWorksListDataRequest(
      {this.flag, top = ApplicationConstant.NUMBER_PREVIEW_ITEM})
      : super(top: top);

  @override
  StringBuffer toXml() {
    // TODO: implement toXml
    var buffer = super.toXml();
    buffer.write(createXml(flag, "flag"));
    return buffer;
  }
}
