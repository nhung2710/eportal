import 'package:eportal/model/base/base_eportal_data_response.dart';

//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//


class WorkSendListDataResponse extends BaseEportalDataResponse {
  String? imageURL;
  String? tenTinhTP;
  String? hanNopHoSo;
  String? soNamKinhNghiem;
  String? parentID;
  String? gtvl;
  String? id;
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
  String? ketQuaPhongVan;
  String? levelDesiredID;
  String? isFlag;
  String? isView;
  String? isSend;
  String? total;
  String? workID;
  String? businessID;
  String? title;
  String? salaryID;
  String? quantity;
  String? experienceID;
  String? gender;
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
  String? portalID;

  WorkSendListDataResponse(
      {this.imageURL,
        this.tenTinhTP,
        this.hanNopHoSo,
        this.soNamKinhNghiem,
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

  WorkSendListDataResponse.fromJson(Map<String, dynamic> json) {
    imageURL = json['imageURL']?.toString();
    tenTinhTP = json['tenTinhTP']?.toString();
    hanNopHoSo = json['hanNopHoSo']?.toString();
    soNamKinhNghiem = json['soNamKinhNghiem']?.toString();
    parentID = json['parent_ID']?.toString();
    gtvl = json['gtvl']?.toString();
    id = json['id']?.toString();
    ages = json['ages']?.toString();
    workTime = json['workTime']?.toString();
    ungVienID = json['ungVien_ID']?.toString();
    isInvite = json['isInvite']?.toString();
    tinhTP = json['tinhTP']?.toString();
    idSend = json['idSend']?.toString();
    tuyenDungID = json['tuyenDung_ID']?.toString();
    doanhNghiepID = json['doanhNghiep_ID']?.toString();
    businessVn = json['business_Vn']?.toString();
    jobPlace = json['jobPlace']?.toString();
    ketQuaPhongVan = json['ketQuaPhongVan']?.toString();
    levelDesiredID = json['levelDesired_ID']?.toString();
    isFlag = json['isFlag']?.toString();
    isView = json['isView']?.toString();
    isSend = json['isSend']?.toString();
    total = json['total']?.toString();
    workID = json['work_ID']?.toString();
    businessID = json['business_ID']?.toString();
    title = json['title']?.toString();
    salaryID = json['salary_ID']?.toString();
    quantity = json['quantity']?.toString();
    experienceID = json['experience_ID']?.toString();
    gender = json['gender']?.toString();
    levelID = json['level_ID']?.toString();
    quanHuyen = json['quanHuyen']?.toString();
    typeOfID = json['typeOf_ID']?.toString();
    careerID = json['career_ID']?.toString();
    description = json['description']?.toString();
    requirement = json['requirement']?.toString();
    benefit = json['benefit']?.toString();
    requirementsProfile = json['requirementsProfile']?.toString();
    expiredDate = json['expiredDate']?.toString();
    submissionSend = json['submissionSend']?.toString();
    startDate = json['startDate']?.toString();
    endDate = json['endDate']?.toString();
    contactUser = json['contactUser']?.toString();
    contactAddress = json['contactAddress']?.toString();
    contactMobile = json['contactMobile']?.toString();
    contactEmail = json['contactEmail']?.toString();
    contactDes = json['contactDes']?.toString();
    isHot = json['isHot'];
    isGhim = json['isGhim'];
    isFast = json['isFast'];
    isUrgent = json['isUrgent'];
    isApproval = json['isApproval'];
    approvalUser = json['approvalUser']?.toString();
    approvalDate = json['approvalDate']?.toString();
    isDelete = json['isDelete'];
    deletedUser = json['deletedUser']?.toString();
    deletedDate = json['deletedDate']?.toString();
    createdDate = json['createdDate']?.toString();
    createdUser = json['createdUser']?.toString();
    updatedDate = json['updatedDate']?.toString();
    updatedUser = json['updatedUser']?.toString();
    portalID = json['portalID']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageURL'] = this.imageURL;
    data['tenTinhTP'] = this.tenTinhTP;
    data['hanNopHoSo'] = this.hanNopHoSo;
    data['soNamKinhNghiem'] = this.soNamKinhNghiem;
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