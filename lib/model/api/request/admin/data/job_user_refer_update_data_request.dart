import 'package:eportal/constant/application_constant.dart';
import 'package:eportal/model/base/base_eportal_xml.dart';

import 'job_user_refer_add_data_request.dart';

//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class JobUserReferUpdateDataRequest extends JobUserReferAddDataRequest {
  JobUserReferUpdateDataRequest(
      {super.jobUserID,
      super.hoTen,
      super.chucVu,
      super.id,
      super.noiCongTac,
      super.soDienThoai,
      super.email,
      super.moiQuanHe});

  @override
  StringBuffer toXml() {
    // TODO: implement toXml
    var buffer = super.toXml();
    buffer.write(createXml(id, "id"));
    return buffer;
  }
}
