import 'package:flutter/material.dart';

import '../../../../../constant/application_constant.dart';
import '../../../../base/base_eportal_xml.dart';

//
// Created by BlackRose on 13/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class NewsSearchData extends BaseEportalXml {
  String? tuKhoa;
  String? kieuSapXep;
  int? soTrangHienTai;
  int? soBanGhiTrenTrang;
  String? doanhNghiep;
  String? mucLuong;
  String? kinhNghiem;
  int? tinhTp;
  int? quanHuyen;

  NewsSearchData(
      {this.tuKhoa,
      this.kieuSapXep,
      this.doanhNghiep,
      this.mucLuong,
      this.kinhNghiem,
      this.tinhTp,
      this.quanHuyen,
      this.soTrangHienTai = 1,
      this.soBanGhiTrenTrang = ApplicationConstant.NUMBER_PREVIEW_ITEM});

  @override
  StringBuffer toXml() {
    // TODO: implement toXml
    var buffer = super.toXml();
    if (tuKhoa != null) {
      buffer.write('<tuKhoa>$tuKhoa</tuKhoa>');
    }
    if (kieuSapXep != null) {
      buffer.write('<kieuSapXep>$kieuSapXep</kieuSapXep>');
    }
    if (doanhNghiep != null) {
      buffer.write('<doanhNghiep>$doanhNghiep</doanhNghiep>');
    }
    if (mucLuong != null) {
      buffer.write('<mucLuong>$kieuSapXep</mucLuong>');
    }
    if (kinhNghiem != null) {
      buffer.write('<kinhNghiem>$kinhNghiem</kinhNghiem>');
    }
    if (tinhTp != null) {
      buffer.write('<tinhTp>$tinhTp</tinhTp>');
    }
    if (quanHuyen != null) {
      buffer.write('<quanHuyen>$quanHuyen</quanHuyen>');
    }
    if (soBanGhiTrenTrang != null) {
      buffer.write('<soTrangHienTai>$soTrangHienTai</soTrangHienTai>');
    }
    if (soBanGhiTrenTrang != null) {
      buffer.write('<soBanGhiTrenTrang>$soBanGhiTrenTrang</soBanGhiTrenTrang>');
    }
    return buffer;
  }
}
