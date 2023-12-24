import 'package:eportal/model/base/base_eportal_xml.dart';

//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class JobUserHistoryListDataRequest extends BaseMultiEportalXml {
  String? jobUserID;

  JobUserHistoryListDataRequest({this.jobUserID});

  @override
  StringBuffer toXml() {
    var buffer = super.toXml();
    buffer.write(createXml(jobUserID, "jobUserID"));
    return buffer;
  }
}
