import 'package:eportal/model/api/request/admin/data/job_user_add_data_request.dart';

//
// Created by BlackRose on 01/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class JobUserUpdateDataRequest extends JobUserAddDataRequest {
  String? jobUserID;

  JobUserUpdateDataRequest(
      {this.jobUserID,
      super.tieuDe,
      super.ngayDangTu,
      super.ngayDangDen,
      super.nganhNghe,
      super.tinhTp,
      super.quanHuyen,
      super.chucVuHienTai,
      super.chucVuMongMuon,
      super.soNamKinhNghiem,
      super.trinhDo,
      super.mucLuong,
      super.nhuCau,
      super.trinhDoHocVan,
      super.kinhNghiemLV,
      super.mucTieu,
      super.kyNang});

  @override
  StringBuffer toXml() {
    var buffer = super.toXml();
    buffer.write(createXml(jobUserID, "JobUserID"));
    return buffer;
  }
}
