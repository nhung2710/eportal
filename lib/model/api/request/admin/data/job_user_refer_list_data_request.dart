import 'package:eportal/model/api/request/admin/data/job_user_list_by_user_name_data_request.dart';

import '../../../../base/base_eportal_xml.dart';

//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class JobUserReferListDataRequest extends BaseMultiEportalXml {
  String? jobUserID;

  JobUserReferListDataRequest({this.jobUserID, super.top});

  @override
  StringBuffer toXml() {
    var buffer = super.toXml();
    buffer.write(createXml(jobUserID, "jobUserID"));
    return buffer;
  }
}
