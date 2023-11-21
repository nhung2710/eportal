import 'package:eportal/model/base/base_eportal_xml.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class AlbumListDataRequest extends BaseEportalXml {
  AlbumListDataRequest();

  @override
  StringBuffer toXml() {
    // TODO: implement toXml
    var buffer = super.toXml();

    ///buffer.write(createXml(flag, "flag"));
    return buffer;
  }
}
