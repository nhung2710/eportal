//
// Created by BlackRose on 20/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/base/base_eportal_data_response.dart';

import '../../../../../extension/map_json_extension.dart';

class ChatBotDanhSachHoiThoaiDataResponse extends BaseEportalDataResponse{
  String? total;
  String? id;
  String? idBot;
  String? tenHoiThoai;
  String? ydinh;
  String? danhDauSao;
  String? trangThai;
  String? ghiChu;
  String? isActive;
  String? isOrder;
  bool? isDelete;
  String? deletedUser;
  String? deletedDate;
  String? createdDate;
  String? createdUser;
  String? updatedDate;
  String? updatedUser;

  ChatBotDanhSachHoiThoaiDataResponse(
      {this.total,
        this.id,
        this.idBot,
        this.tenHoiThoai,
        this.ydinh,
        this.danhDauSao,
        this.trangThai,
        this.ghiChu,
        this.isActive,
        this.isOrder,
        this.isDelete,
        this.deletedUser,
        this.deletedDate,
        this.createdDate,
        this.createdUser,
        this.updatedDate,
        this.updatedUser});

  ChatBotDanhSachHoiThoaiDataResponse.fromJson(Map<String, dynamic> json) {
    total = json.toStringJson(path:'total');
    id = json.toStringJson(path:'id');
    idBot = json.toStringJson(path:'idBot');
    tenHoiThoai = json.toStringJson(path:'tenHoiThoai');
    ydinh = json.toStringJson(path:'ydinh');
    danhDauSao = json.toStringJson(path:'danhDauSao');
    trangThai = json.toStringJson(path:'trangThai');
    ghiChu = json.toStringJson(path:'ghiChu');
    isActive = json.toStringJson(path:'isActive');
    isOrder = json.toStringJson(path:'isOrder');
    isDelete = json.toBoolJson(path:'isDelete');
    deletedUser = json.toStringJson(path:'deletedUser');
    deletedDate = json.toStringJson(path:'deletedDate');
    createdDate = json.toStringJson(path:'createdDate');
    createdUser = json.toStringJson(path:'createdUser');
    updatedDate = json.toStringJson(path:'updatedDate');
    updatedUser = json.toStringJson(path:'updatedUser');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['id'] = this.id;
    data['idBot'] = this.idBot;
    data['tenHoiThoai'] = this.tenHoiThoai;
    data['ydinh'] = this.ydinh;
    data['danhDauSao'] = this.danhDauSao;
    data['trangThai'] = this.trangThai;
    data['ghiChu'] = this.ghiChu;
    data['isActive'] = this.isActive;
    data['isOrder'] = this.isOrder;
    data['isDelete'] = this.isDelete;
    data['deletedUser'] = this.deletedUser;
    data['deletedDate'] = this.deletedDate;
    data['createdDate'] = this.createdDate;
    data['createdUser'] = this.createdUser;
    data['updatedDate'] = this.updatedDate;
    data['updatedUser'] = this.updatedUser;
    return data;
  }
}
