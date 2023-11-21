import 'package:eportal/model/base/base_eportal_xml.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DangKyDataRequest extends BaseEportalXml {
  String? hoDem;
  String? ten;
  String? email;
  String? soDienThoai;
  String? passWord;
  int? role;
  DangKyDataRequest({this.hoDem,this.ten,this.email,this.soDienThoai,this.passWord,this.role});
  @override
  StringBuffer toXml() {
    // TODO: implement toXml
    var buffer = super.toXml();

    buffer.write(createXml(hoDem, "hoDem"));
    buffer.write(createXml(ten, "ten"));
    buffer.write(createXml(email, "email"));
    buffer.write(createXml(soDienThoai, "soDienThoai"));
    buffer.write(createXml(passWord, "passWord"));
    buffer.write(createXml(role, "role"));
    return buffer;
  }
}
