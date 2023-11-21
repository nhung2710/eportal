import 'package:eportal/model/base/base_eportal_xml.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class FaqAddQuestionDataRequest extends BaseEportalXml {
  String? hoTen;
  String? email;
  String? phone;
  String? noiDung;
  FaqAddQuestionDataRequest({this.hoTen,this.email,this.phone,this.noiDung});

  @override
  StringBuffer toXml() {
    // TODO: implement toXml
    var buffer = super.toXml();

    buffer.write(createXml(hoTen, "hoTen"));
    buffer.write(createXml(email, "email"));
    buffer.write(createXml(phone, "phone"));
    buffer.write(createXml(noiDung, "noiDung"));
    return buffer;
  }
}
