import 'package:eportal/model/base/base_eportal_xml.dart';

//
// Created by BlackRose on 01/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class JobUserAddDataRequest extends BaseEportalXml {
  String? tieuDe;
  String? ngayDangTu;
  String? ngayDangDen;
  String? nganhNghe;
  String? tinhTp;
  String? quanHuyen;
  String? chucVuHienTai;
  String? chucVuMongMuon;
  String? soNamKinhNghiem;
  String? trinhDo;
  String? mucLuong;
  String? nhuCau;
  String? trinhDoHocVan;
  String? kinhNghiemLV;
  String? mucTieu;
  String? kyNang;

  JobUserAddDataRequest(
      {this.tieuDe,
      this.ngayDangTu,
      this.ngayDangDen,
      this.nganhNghe,
      this.tinhTp,
      this.quanHuyen,
      this.chucVuHienTai,
      this.chucVuMongMuon,
      this.soNamKinhNghiem,
      this.trinhDo,
      this.mucLuong,
      this.nhuCau,
      this.trinhDoHocVan,
      this.kinhNghiemLV,
      this.mucTieu,
      this.kyNang});

  @override
  StringBuffer toXml() {
    // TODO: implement toXml
    var buffer = super.toXml();
    buffer.write(createXml(tieuDe, "tieuDe"));
    buffer.write(createXml(ngayDangTu, "ngayDangTu"));
    buffer.write(createXml(ngayDangDen, "ngayDangDen"));
    buffer.write(createXml(nganhNghe, "nganhNghe"));
    buffer.write(createXml(tinhTp, "tinhTp"));
    buffer.write(createXml(quanHuyen, "quanHuyen"));
    buffer.write(createXml(chucVuHienTai, "chucVuHienTai"));
    buffer.write(createXml(chucVuMongMuon, "chucVuMongMuon"));
    buffer.write(createXml(soNamKinhNghiem, "soNamKinhNghiem"));
    buffer.write(createXml(trinhDo, "trinhDo"));
    buffer.write(createXml(mucLuong, "mucLuong"));
    buffer.write(createXml(nhuCau, "nhuCau"));
    buffer.write(createXml(trinhDoHocVan, "trinhDoHocVan"));
    buffer.write(createXml(kinhNghiemLV, "kinhNghiemLV"));
    buffer.write(createXml(mucTieu, "mucTieu"));
    buffer.write(createXml(kyNang, "kyNang"));
    return buffer;
  }
}
