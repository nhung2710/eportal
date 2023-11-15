import 'package:flutter/material.dart';

//
// Created by BlackRose on 13/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class HomeBusinessListDataResponse {
  int? id;
  int? status;
  String? careerID;
  bool? isInvite;
  bool? userAdmin;
  String? tinhTP;
  String? idSend;
  int? soLuongUngVien;
  int? soLuongTuyenDung;
  int? tinhTrang;
  int? soBan;
  String? doanhNghiepID;
  int? total;
  String? scale;
  String? businessID;
  String? businessVn;
  String? businessEn;
  String? businessSort;
  String? quanHuyen;
  String? logo;
  String? description;
  String? taxCode;
  String? mobile;
  String? fax;
  String? website;
  String? email;
  String? address;
  String? contactUser;
  String? contactMobile;
  String? contactEmail;
  String? createdDate;
  String? createdUser;
  String? updatedDate;
  String? updatedUser;
  bool? isAdmin;
  bool? isActive;
  bool? isApproval;
  String? approvalUser;
  String? approvalDate;
  int? portalId;

  HomeBusinessListDataResponse(
      {this.id,
      this.status,
      this.careerID,
      this.isInvite,
      this.userAdmin,
      this.tinhTP,
      this.idSend,
      this.soLuongUngVien,
      this.soLuongTuyenDung,
      this.tinhTrang,
      this.soBan,
      this.doanhNghiepID,
      this.total,
      this.scale,
      this.businessID,
      this.businessVn,
      this.businessEn,
      this.businessSort,
      this.quanHuyen,
      this.logo,
      this.description,
      this.taxCode,
      this.mobile,
      this.fax,
      this.website,
      this.email,
      this.address,
      this.contactUser,
      this.contactMobile,
      this.contactEmail,
      this.createdDate,
      this.createdUser,
      this.updatedDate,
      this.updatedUser,
      this.isAdmin,
      this.isActive,
      this.isApproval,
      this.approvalUser,
      this.approvalDate,
      this.portalId});

  HomeBusinessListDataResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    careerID = json['career_ID'];
    isInvite = json['isInvite'];
    userAdmin = json['userAdmin'];
    tinhTP = json['tinhTP'];
    idSend = json['idSend'];
    soLuongUngVien = json['soLuongUngVien'];
    soLuongTuyenDung = json['soLuongTuyenDung'];
    tinhTrang = json['tinhTrang'];
    soBan = json['soBan'];
    doanhNghiepID = json['doanhNghiep_ID'];
    total = json['total'];
    scale = json['scale'];
    businessID = json['business_ID'];
    businessVn = json['business_Vn'];
    businessEn = json['business_En'];
    businessSort = json['business_Sort'];
    quanHuyen = json['quanHuyen'];
    logo = json['logo'];
    description = json['description'];
    taxCode = json['taxCode'];
    mobile = json['mobile'];
    fax = json['fax'];
    website = json['website'];
    email = json['email'];
    address = json['address'];
    contactUser = json['contactUser'];
    contactMobile = json['contactMobile'];
    contactEmail = json['contactEmail'];
    createdDate = json['createdDate'];
    createdUser = json['createdUser'];
    updatedDate = json['updatedDate'];
    updatedUser = json['updatedUser'];
    isAdmin = json['isAdmin'];
    isActive = json['isActive'];
    isApproval = json['isApproval'];
    approvalUser = json['approvalUser'];
    approvalDate = json['approvalDate'];
    portalId = json['portalId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['career_ID'] = this.careerID;
    data['isInvite'] = this.isInvite;
    data['userAdmin'] = this.userAdmin;
    data['tinhTP'] = this.tinhTP;
    data['idSend'] = this.idSend;
    data['soLuongUngVien'] = this.soLuongUngVien;
    data['soLuongTuyenDung'] = this.soLuongTuyenDung;
    data['tinhTrang'] = this.tinhTrang;
    data['soBan'] = this.soBan;
    data['doanhNghiep_ID'] = this.doanhNghiepID;
    data['total'] = this.total;
    data['scale'] = this.scale;
    data['business_ID'] = this.businessID;
    data['business_Vn'] = this.businessVn;
    data['business_En'] = this.businessEn;
    data['business_Sort'] = this.businessSort;
    data['quanHuyen'] = this.quanHuyen;
    data['logo'] = this.logo;
    data['description'] = this.description;
    data['taxCode'] = this.taxCode;
    data['mobile'] = this.mobile;
    data['fax'] = this.fax;
    data['website'] = this.website;
    data['email'] = this.email;
    data['address'] = this.address;
    data['contactUser'] = this.contactUser;
    data['contactMobile'] = this.contactMobile;
    data['contactEmail'] = this.contactEmail;
    data['createdDate'] = this.createdDate;
    data['createdUser'] = this.createdUser;
    data['updatedDate'] = this.updatedDate;
    data['updatedUser'] = this.updatedUser;
    data['isAdmin'] = this.isAdmin;
    data['isActive'] = this.isActive;
    data['isApproval'] = this.isApproval;
    data['approvalUser'] = this.approvalUser;
    data['approvalDate'] = this.approvalDate;
    data['portalId'] = this.portalId;
    return data;
  }
}
