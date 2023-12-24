import '../../../../base/base_eportal_xml.dart';

//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class JobUserReferListDataRequest extends BaseMultiEportalXml {
  String? jobUserID;

  JobUserReferListDataRequest({this.jobUserID});

  @override
  StringBuffer toXml() {
    var buffer = super.toXml();
    buffer.write(createXml(jobUserID, "jobUserID"));
    return buffer;
  }
}
