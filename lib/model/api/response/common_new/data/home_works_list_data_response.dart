//
// Created by BlackRose on 20/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/base/base_eportal_data_response.dart';

class HomeWorksListDataResponse extends BaseEportalDataResponse {
  String? imageURL;
  Null? parentID;
  int? gtvl;
  int? id;
  String? ages;
  String? workTime;
  String? ungVienID;
  String? isInvite;
  String? tinhTP;
  String? idSend;
  String? tuyenDungID;
  String? doanhNghiepID;
  String? businessVn;
  String? jobPlace;
  int? ketQuaPhongVan;
  String? levelDesiredID;
  int? isFlag;
  int? isView;
  int? isSend;
  int? total;
  String? workID;
  String? businessID;
  String? title;
  String? salaryID;
  int? quantity;
  String? experienceID;
  int? gender;
  String? levelID;
  String? quanHuyen;
  String? typeOfID;
  String? careerID;
  String? description;
  String? requirement;
  String? benefit;
  String? requirementsProfile;
  String? expiredDate;
  String? submissionSend;
  String? startDate;
  String? endDate;
  String? contactUser;
  String? contactAddress;
  String? contactMobile;
  String? contactEmail;
  String? contactDes;
  bool? isHot;
  bool? isGhim;
  bool? isFast;
  bool? isUrgent;
  bool? isApproval;
  String? approvalUser;
  String? approvalDate;
  bool? isDelete;
  String? deletedUser;
  String? deletedDate;
  String? createdDate;
  String? createdUser;
  String? updatedDate;
  String? updatedUser;
  int? portalID;

  HomeWorksListDataResponse(
      {this.imageURL,
      this.parentID,
      this.gtvl,
      this.id,
      this.ages,
      this.workTime,
      this.ungVienID,
      this.isInvite,
      this.tinhTP,
      this.idSend,
      this.tuyenDungID,
      this.doanhNghiepID,
      this.businessVn,
      this.jobPlace,
      this.ketQuaPhongVan,
      this.levelDesiredID,
      this.isFlag,
      this.isView,
      this.isSend,
      this.total,
      this.workID,
      this.businessID,
      this.title,
      this.salaryID,
      this.quantity,
      this.experienceID,
      this.gender,
      this.levelID,
      this.quanHuyen,
      this.typeOfID,
      this.careerID,
      this.description,
      this.requirement,
      this.benefit,
      this.requirementsProfile,
      this.expiredDate,
      this.submissionSend,
      this.startDate,
      this.endDate,
      this.contactUser,
      this.contactAddress,
      this.contactMobile,
      this.contactEmail,
      this.contactDes,
      this.isHot,
      this.isGhim,
      this.isFast,
      this.isUrgent,
      this.isApproval,
      this.approvalUser,
      this.approvalDate,
      this.isDelete,
      this.deletedUser,
      this.deletedDate,
      this.createdDate,
      this.createdUser,
      this.updatedDate,
      this.updatedUser,
      this.portalID});

  HomeWorksListDataResponse.fromJson(Map<String, dynamic> json) {
    imageURL = json['imageURL'];
    parentID = json['parent_ID'];
    gtvl = json['gtvl'];
    id = json['id'];
    ages = json['ages'];
    workTime = json['workTime'];
    ungVienID = json['ungVien_ID'];
    isInvite = json['isInvite'];
    tinhTP = json['tinhTP'];
    idSend = json['idSend'];
    tuyenDungID = json['tuyenDung_ID'];
    doanhNghiepID = json['doanhNghiep_ID'];
    businessVn = json['business_Vn'];
    jobPlace = json['jobPlace'];
    ketQuaPhongVan = json['ketQuaPhongVan'];
    levelDesiredID = json['levelDesired_ID'];
    isFlag = json['isFlag'];
    isView = json['isView'];
    isSend = json['isSend'];
    total = json['total'];
    workID = json['work_ID'];
    businessID = json['business_ID'];
    title = json['title'];
    salaryID = json['salary_ID'];
    quantity = json['quantity'];
    experienceID = json['experience_ID'];
    gender = json['gender'];
    levelID = json['level_ID'];
    quanHuyen = json['quanHuyen'];
    typeOfID = json['typeOf_ID'];
    careerID = json['career_ID'];
    description = json['description'];
    requirement = json['requirement'];
    benefit = json['benefit'];
    requirementsProfile = json['requirementsProfile'];
    expiredDate = json['expiredDate'];
    submissionSend = json['submissionSend'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    contactUser = json['contactUser'];
    contactAddress = json['contactAddress'];
    contactMobile = json['contactMobile'];
    contactEmail = json['contactEmail'];
    contactDes = json['contactDes'];
    isHot = json['isHot'];
    isGhim = json['isGhim'];
    isFast = json['isFast'];
    isUrgent = json['isUrgent'];
    isApproval = json['isApproval'];
    approvalUser = json['approvalUser'];
    approvalDate = json['approvalDate'];
    isDelete = json['isDelete'];
    deletedUser = json['deletedUser'];
    deletedDate = json['deletedDate'];
    createdDate = json['createdDate'];
    createdUser = json['createdUser'];
    updatedDate = json['updatedDate'];
    updatedUser = json['updatedUser'];
    portalID = json['portalID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageURL'] = this.imageURL;
    data['parent_ID'] = this.parentID;
    data['gtvl'] = this.gtvl;
    data['id'] = this.id;
    data['ages'] = this.ages;
    data['workTime'] = this.workTime;
    data['ungVien_ID'] = this.ungVienID;
    data['isInvite'] = this.isInvite;
    data['tinhTP'] = this.tinhTP;
    data['idSend'] = this.idSend;
    data['tuyenDung_ID'] = this.tuyenDungID;
    data['doanhNghiep_ID'] = this.doanhNghiepID;
    data['business_Vn'] = this.businessVn;
    data['jobPlace'] = this.jobPlace;
    data['ketQuaPhongVan'] = this.ketQuaPhongVan;
    data['levelDesired_ID'] = this.levelDesiredID;
    data['isFlag'] = this.isFlag;
    data['isView'] = this.isView;
    data['isSend'] = this.isSend;
    data['total'] = this.total;
    data['work_ID'] = this.workID;
    data['business_ID'] = this.businessID;
    data['title'] = this.title;
    data['salary_ID'] = this.salaryID;
    data['quantity'] = this.quantity;
    data['experience_ID'] = this.experienceID;
    data['gender'] = this.gender;
    data['level_ID'] = this.levelID;
    data['quanHuyen'] = this.quanHuyen;
    data['typeOf_ID'] = this.typeOfID;
    data['career_ID'] = this.careerID;
    data['description'] = this.description;
    data['requirement'] = this.requirement;
    data['benefit'] = this.benefit;
    data['requirementsProfile'] = this.requirementsProfile;
    data['expiredDate'] = this.expiredDate;
    data['submissionSend'] = this.submissionSend;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['contactUser'] = this.contactUser;
    data['contactAddress'] = this.contactAddress;
    data['contactMobile'] = this.contactMobile;
    data['contactEmail'] = this.contactEmail;
    data['contactDes'] = this.contactDes;
    data['isHot'] = this.isHot;
    data['isGhim'] = this.isGhim;
    data['isFast'] = this.isFast;
    data['isUrgent'] = this.isUrgent;
    data['isApproval'] = this.isApproval;
    data['approvalUser'] = this.approvalUser;
    data['approvalDate'] = this.approvalDate;
    data['isDelete'] = this.isDelete;
    data['deletedUser'] = this.deletedUser;
    data['deletedDate'] = this.deletedDate;
    data['createdDate'] = this.createdDate;
    data['createdUser'] = this.createdUser;
    data['updatedDate'] = this.updatedDate;
    data['updatedUser'] = this.updatedUser;
    data['portalID'] = this.portalID;
    return data;
  }
}
