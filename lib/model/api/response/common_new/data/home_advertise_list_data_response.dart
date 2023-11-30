import 'package:eportal/model/base/base_eportal_data_response.dart';

//
// Created by BlackRose on 23/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class HomeAdvertiseListDataResponse extends BaseEportalDataResponse {
  int? total;
  String? advertiseID;
  String? advertiseName;
  int? imgType;
  String? images;
  String? isWith;
  String? isHeight;
  String? target;
  String? isURL;
  String? startDate;
  String? endDate;
  String? isLang;
  bool? isActive;
  int? isOrder;
  String? createdBy;
  String? userName;
  String? updatedBy;
  String? userUpdate;
  String? pageLocaID;
  int? portalID;
  String? categoryID;
  bool? sendView;

  HomeAdvertiseListDataResponse(
      {this.total,
      this.advertiseID,
      this.advertiseName,
      this.imgType,
      this.images,
      this.isWith,
      this.isHeight,
      this.target,
      this.isURL,
      this.startDate,
      this.endDate,
      this.isLang,
      this.isActive,
      this.isOrder,
      this.createdBy,
      this.userName,
      this.updatedBy,
      this.userUpdate,
      this.pageLocaID,
      this.portalID,
      this.categoryID,
      this.sendView});

  HomeAdvertiseListDataResponse.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    advertiseID = json['advertise_ID'];
    advertiseName = json['advertise_Name'];
    imgType = json['imgType'];
    images = json['images'];
    isWith = json['isWith'];
    isHeight = json['isHeight'];
    target = json['target'];
    isURL = json['isURL'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    isLang = json['isLang'];
    isActive = json['isActive'];
    isOrder = json['isOrder'];
    createdBy = json['createdBy'];
    userName = json['userName'];
    updatedBy = json['updatedBy'];
    userUpdate = json['userUpdate'];
    pageLocaID = json['pageLoca_ID'];
    portalID = json['portalID'];
    categoryID = json['categoryID'];
    sendView = json['sendView'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['advertise_ID'] = this.advertiseID;
    data['advertise_Name'] = this.advertiseName;
    data['imgType'] = this.imgType;
    data['images'] = this.images;
    data['isWith'] = this.isWith;
    data['isHeight'] = this.isHeight;
    data['target'] = this.target;
    data['isURL'] = this.isURL;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['isLang'] = this.isLang;
    data['isActive'] = this.isActive;
    data['isOrder'] = this.isOrder;
    data['createdBy'] = this.createdBy;
    data['userName'] = this.userName;
    data['updatedBy'] = this.updatedBy;
    data['userUpdate'] = this.userUpdate;
    data['pageLoca_ID'] = this.pageLocaID;
    data['portalID'] = this.portalID;
    data['categoryID'] = this.categoryID;
    data['sendView'] = this.sendView;
    return data;
  }
}
