import 'package:eportal/model/base/base_eportal_data_response.dart';
import 'package:flutter/material.dart';

import '../../../../../extension/string_extension.dart';

//
// Created by BlackRose on 27/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachChuyenMucDataResponse extends BaseEportalDataResponse {
  int? total;
  int? categoryID;
  String? categoryName;
  String? description;
  int? tabID;
  int? tabMobileID;
  bool? isActive;
  String? createDate;
  int? portalId;
  int? parentId;
  int? orderNumber;
  int? type;
  String? languageId;
  bool? sendView;
  String? tabPath;

  DanhSachChuyenMucDataResponse(
      {this.total,
      this.categoryID,
      this.categoryName,
      this.description,
      this.tabID,
      this.tabMobileID,
      this.isActive,
      this.createDate,
      this.portalId,
      this.parentId,
      this.orderNumber,
      this.type,
      this.languageId,
      this.sendView,
      this.tabPath});

  DanhSachChuyenMucDataResponse.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    categoryID = json['categoryID'];
    categoryName = json['categoryName'];
    description = json['description'];
    tabID = json['tabID'];
    tabMobileID = json['tabMobileID'];
    isActive = json['isActive'];
    createDate = json['createDate'];
    portalId = json['portalId'];
    parentId = json['parentId'];
    orderNumber = json['orderNumber'];
    type = json['type'];
    languageId = json['languageId'];
    sendView = json['sendView'];
    tabPath = json['tabPath'];
    search = categoryName.getValueSearch();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['categoryID'] = this.categoryID;
    data['categoryName'] = this.categoryName;
    data['description'] = this.description;
    data['tabID'] = this.tabID;
    data['tabMobileID'] = this.tabMobileID;
    data['isActive'] = this.isActive;
    data['createDate'] = this.createDate;
    data['portalId'] = this.portalId;
    data['parentId'] = this.parentId;
    data['orderNumber'] = this.orderNumber;
    data['type'] = this.type;
    data['languageId'] = this.languageId;
    data['sendView'] = this.sendView;
    data['tabPath'] = this.tabPath;
    return data;
  }
}
