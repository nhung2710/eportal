import 'package:eportal/constant/application_constant.dart';
import 'package:eportal/model/base/base_eportal_xml.dart';

//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class ProfileSaveDataRequest extends BaseEportalXml {
  String? jobUserID ;
  String? title ;

  ProfileSaveDataRequest({this.jobUserID,this.title});

  @override
  StringBuffer toXml() {
    // TODO: implement toXml
    var buffer = super.toXml();
    buffer.write(createXml(title, "title"));
    buffer.write(createXml(jobUserID, "jobUserID"));
    return buffer;
  }
}
