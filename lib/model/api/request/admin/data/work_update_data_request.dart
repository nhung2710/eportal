import 'work_add_data_request.dart';

//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class WorkUpdateDataRequest extends WorkAddDataRequest {
  String? work_ID;

  WorkUpdateDataRequest(
      {this.work_ID,
      super.tieuDe,
      super.hanNopHoSo,
      super.hinhThucNop,
      super.dangTuNgay,
      super.dangDenNgay,
      super.thoiGianLV,
      super.doTuoi,
      super.soLuong,
      super.mucLuong,
      super.kinhNghiem,
      super.chucVu,
      super.gioiTinh,
      super.trinhdoCM,
      super.tinhTP,
      super.tinhChatCV,
      super.viTriTuyenDung,
      super.nganhNghe,
      super.mota,
      super.yeuCauCV,
      super.yeuCauHoSo,
      super.quyenLoi,
      super.tenNguoiLH,
      super.diaChiNguoiLH,
      super.dienThoaiNguoiLH,
      super.emailNguoiLH,
      super.ghiChu,
      super.tinNoiBat,
      super.dauThongTinDN,
      super.dangGap});

  @override
  StringBuffer toXml() {
    // TODO: implement toXml
    var buffer = super.toXml();
    buffer.write(createXml(work_ID, "work_ID"));
    return buffer;
  }
}
