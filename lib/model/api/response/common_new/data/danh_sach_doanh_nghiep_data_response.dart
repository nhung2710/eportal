import 'package:eportal/model/base/base_eportal_data_response.dart';

import '../../../../../extension/string_extension.dart';

//
// Created by BlackRose on 13/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachDoanhNghiepDataResponse extends BaseEportalDataResponse {
  String? id;
  String? status;
  String? careerID;
  String? isInvite;
  String? userAdmin;
  String? tinhTP;
  String? idSend;
  String? soLuongUngVien;
  String? soLuongTuyenDung;
  String? tinhTrang;
  String? soBan;
  String? doanhNghiepID;
  String? total;
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
  String? portalId;

  DanhSachDoanhNghiepDataResponse(
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

  DanhSachDoanhNghiepDataResponse.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    status = json['status']?.toString();
    careerID = json['career_ID']?.toString();
    isInvite = json['isInvite']?.toString();
    userAdmin = json['userAdmin']?.toString();
    tinhTP = json['tinhTP']?.toString();
    idSend = json['idSend']?.toString();
    soLuongUngVien = json['soLuongUngVien']?.toString();
    soLuongTuyenDung = json['soLuongTuyenDung']?.toString();
    tinhTrang = json['tinhTrang']?.toString();
    soBan = json['soBan']?.toString();
    doanhNghiepID = json['doanhNghiep_ID']?.toString();
    total = json['total']?.toString();
    scale = json['scale']?.toString();
    businessID = json['business_ID']?.toString();
    businessVn = json['business_Vn']?.toString();
    businessEn = json['business_En']?.toString();
    businessSort = json['business_Sort']?.toString();
    quanHuyen = json['quanHuyen']?.toString();
    logo = json['logo']?.toString();
    description = json['description']?.toString();
    taxCode = json['taxCode']?.toString();
    mobile = json['mobile']?.toString();
    fax = json['fax']?.toString();
    website = json['website']?.toString();
    email = json['email']?.toString();
    address = json['address']?.toString();
    contactUser = json['contactUser']?.toString();
    contactMobile = json['contactMobile']?.toString();
    contactEmail = json['contactEmail']?.toString();
    createdDate = json['createdDate']?.toString();
    createdUser = json['createdUser']?.toString();
    updatedDate = json['updatedDate']?.toString();
    updatedUser = json['updatedUser']?.toString();
    isAdmin = json['isAdmin'];
    isActive = json['isActive'];
    isApproval = json['isApproval'];
    approvalUser = json['approvalUser']?.toString();
    approvalDate = json['approvalDate']?.toString();
    portalId = json['portalId']?.toString();
    search = businessVn.getValueSearch();
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
