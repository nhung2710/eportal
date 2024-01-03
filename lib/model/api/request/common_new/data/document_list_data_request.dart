import 'package:eportal/model/base/base_eportal_xml.dart';

import '../../../../../constant/application_constant.dart';
import '../../../../../extension/string_extension.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DocumentListDataRequest extends BasePageEportalXml {
  String tuKhoa;
  String? linhVucVanBan;
  String? loaiVanBan;
  String? coQuanBanHanh;
  String? nhomVanBan;

  DocumentListDataRequest(
      {super.soTrangHienTai,
      super.soBanGhiTrenTrang,
      this.tuKhoa = ApplicationConstant.EMPTY,
      this.linhVucVanBan,
      this.loaiVanBan,
      this.coQuanBanHanh,
      this.nhomVanBan});

  @override
  StringBuffer toXml() {
    // TODO: implement toXml
    var buffer = super.toXml();

    buffer.write(createXml(tuKhoa, "tuKhoa"));
    buffer.write(createXml(linhVucVanBan, "linhVucVanBan"));
    buffer.write(createXml(loaiVanBan, "loaiVanBan"));
    buffer.write(createXml(coQuanBanHanh, "coQuanBanHanh"));
    buffer.write(createXml(nhomVanBan.replaceWhenNullOrWhiteSpace("0"), "nhomVanBan"));
    return buffer;
  }
}
