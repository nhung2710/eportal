//
// Created by BlackRose on 20/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/base/base_eportal_data_response.dart';

import '../../../../../extension/map_json_extension.dart';

class ChatBotChiTietHoiThoaiDataResponse extends BaseEportalDataResponse{
  String? total;
  String? id;
  String? idHoiThoai;
  String? noiDungHTML;
  String? noiDungText;
  String? type;
  String? isActive;
  String? isOrder;
  String? isDelete;
  String? deletedUser;
  String? deletedDate;
  String? createdDate;
  String? createdUser;
  String? updatedDate;
  String? updatedUser;

  ChatBotChiTietHoiThoaiDataResponse(
      {this.total,
        this.id,
        this.idHoiThoai,
        this.noiDungHTML,
        this.noiDungText,
        this.type,
        this.isActive,
        this.isOrder,
        this.isDelete,
        this.deletedUser,
        this.deletedDate,
        this.createdDate,
        this.createdUser,
        this.updatedDate,
        this.updatedUser});

  ChatBotChiTietHoiThoaiDataResponse.fromJson(Map<String, dynamic> json) {
    total = json.toStringJson(path:'total');
    id = json.toStringJson(path:'id');
    idHoiThoai = json.toStringJson(path:'idHoiThoai');
    noiDungHTML = json.toStringJson(path:'noiDungHTML');
    noiDungText = json.toStringJson(path:'noiDungText');
    type = json.toStringJson(path:'type');
    isActive = json.toStringJson(path:'isActive');
    isOrder = json.toStringJson(path:'isOrder');
    isDelete = json.toStringJson(path:'isDelete');
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
    data['idHoiThoai'] = this.idHoiThoai;
    data['noiDungHTML'] = this.noiDungHTML;
    data['noiDungText'] = this.noiDungText;
    data['type'] = this.type;
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
