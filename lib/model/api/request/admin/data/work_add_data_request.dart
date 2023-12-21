import 'package:eportal/model/base/base_eportal_xml.dart';

//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class WorkAddDataRequest extends BaseEportalXml {
  String? tieuDe;
  String? hanNopHoSo;
  String? hinhThucNop;
  String? dangTuNgay;
  String? dangDenNgay;
  String? thoiGianLV;
  String? doTuoi;
  String? soLuong;
  String? mucLuong;
  String? kinhNghiem;
  String? chucVu;
  String? gioiTinh;
  String? trinhdoCM;
  String? tinhTP;
  String? tinhChatCV;
  String? viTriTuyenDung;
  String? nganhNghe;
  String? mota;
  String? yeuCauCV;
  String? yeuCauHoSo;
  String? quyenLoi;
  String? tenNguoiLH;
  String? diaChiNguoiLH;
  String? dienThoaiNguoiLH;
  String? emailNguoiLH;
  String? ghiChu;
  String? tinNoiBat;
  String? dauThongTinDN;
  String? dangGap;

  WorkAddDataRequest(
      {this.tieuDe,
      this.hanNopHoSo,
      this.hinhThucNop,
      this.dangTuNgay,
      this.dangDenNgay,
      this.thoiGianLV,
      this.doTuoi,
      this.soLuong,
      this.mucLuong,
      this.kinhNghiem,
      this.chucVu,
      this.gioiTinh,
      this.trinhdoCM,
      this.tinhTP,
      this.tinhChatCV,
      this.viTriTuyenDung,
      this.nganhNghe,
      this.mota,
      this.yeuCauCV,
      this.yeuCauHoSo,
      this.quyenLoi,
      this.tenNguoiLH,
      this.diaChiNguoiLH,
      this.dienThoaiNguoiLH,
      this.emailNguoiLH,
      this.ghiChu,
      this.tinNoiBat,
      this.dauThongTinDN,
      this.dangGap});

  @override
  StringBuffer toXml() {
    // TODO: implement toXml
    var buffer = super.toXml();
    buffer.write(createXml(tieuDe, "tieuDe"));
    buffer.write(createXml(hanNopHoSo, "hanNopHoSo"));
    buffer.write(createXml(hinhThucNop, "hinhThucNop"));
    buffer.write(createXml(dangTuNgay, "dangTuNgay"));
    buffer.write(createXml(dangDenNgay, "dangDenNgay"));
    buffer.write(createXml(thoiGianLV, "thoiGianLV"));
    buffer.write(createXml(doTuoi, "doTuoi"));
    buffer.write(createXml(soLuong, "soLuong"));
    buffer.write(createXml(mucLuong, "mucLuong"));
    buffer.write(createXml(kinhNghiem, "kinhNghiem"));
    buffer.write(createXml(chucVu, "chucVu"));
    buffer.write(createXml(gioiTinh, "gioiTinh"));
    buffer.write(createXml(trinhdoCM, "trinhdoCM"));
    buffer.write(createXml(tinhTP, "tinhTP"));
    buffer.write(createXml(tinhChatCV, "tinhChatCV"));
    buffer.write(createXml(viTriTuyenDung, "viTriTuyenDung"));
    buffer.write(createXml(nganhNghe, "nganhNghe"));
    buffer.write(createXml(mota, "mota"));
    buffer.write(createXml(yeuCauCV, "yeuCauCV"));
    buffer.write(createXml(yeuCauHoSo, "yeuCauHoSo"));
    buffer.write(createXml(quyenLoi, "quyenLoi"));
    buffer.write(createXml(tenNguoiLH, "tenNguoiLH"));
    buffer.write(createXml(diaChiNguoiLH, "diaChiNguoiLH"));
    buffer.write(createXml(dienThoaiNguoiLH, "dienThoaiNguoiLH"));
    buffer.write(createXml(emailNguoiLH, "emailNguoiLH"));
    buffer.write(createXml(ghiChu, "ghiChu"));
    buffer.write(createXml(tinNoiBat, "tinNoiBat"));
    buffer.write(createXml(dauThongTinDN, "dauThongTinDN"));
    buffer.write(createXml(dangGap, "dangGap"));

    return buffer;
  }
}
