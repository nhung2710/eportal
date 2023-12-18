import 'package:eportal/constant/application_constant.dart';
import 'package:eportal/model/base/base_eportal_xml.dart';

//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class JobUserReferAddDataRequest extends BaseEportalXml {
  String? jobUserID;
  String? hoTen;
  String? chucVu;
  String? noiCongTac;
  String? soDienThoai;
  String? email;
  String? moiQuanHe;
  String? id;

  JobUserReferAddDataRequest(
      {this.jobUserID,
      this.hoTen,
      this.chucVu,
      this.id,
      this.noiCongTac,
      this.soDienThoai,
      this.email,
      this.moiQuanHe});

  @override
  StringBuffer toXml() {
    // TODO: implement toXml
    var buffer = super.toXml();
    buffer.write(createXml(jobUserID, "jobUserID"));
    buffer.write(createXml(hoTen, "hoTen"));
    buffer.write(createXml(chucVu, "chucVu"));
    buffer.write(createXml(noiCongTac, "noiCongTac"));
    buffer.write(createXml(soDienThoai, "soDienThoai"));
    buffer.write(createXml(email, "email"));
    buffer.write(createXml(moiQuanHe, "moiQuanHe"));
    return buffer;
  }
}
