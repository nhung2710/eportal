import 'package:eportal/model/base/base_eportal_xml.dart';

//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class JobUserReferDeleteDataRequest extends BaseEportalXml {
  String? id;

  JobUserReferDeleteDataRequest({this.id});

  @override
  StringBuffer toXml() {
    // TODO: implement toXml
    var buffer = super.toXml();
    buffer.write(createXml(id, "id"));
    return buffer;
  }
}
