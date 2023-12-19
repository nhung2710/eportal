import 'package:eportal/model/base/base_eportal_xml.dart';

//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class WorkDeleteDataRequest extends BaseEportalXml {
  String? workId;

  WorkDeleteDataRequest({this.workId});

  @override
  StringBuffer toXml() {
    // TODO: implement toXml
    var buffer = super.toXml();
    buffer.write(createXml(workId, "workId"));
    return buffer;
  }
}
