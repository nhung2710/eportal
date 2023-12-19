import 'package:eportal/model/base/base_eportal_data_response.dart';

import '../../../../../extension/map_json_extension.dart';

//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class WorkDeleteDataResponse extends BaseEportalDataResponse {
  String? imageURL;
  String? tenTinhTP;
  String? hanNopHoSo;
  String? soNamKinhNghiem;
  String? parentID;
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

  WorkDeleteDataResponse(
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

  WorkDeleteDataResponse.fromJson(Map<String, dynamic> json) {
    imageURL = json.toStringJson(path: 'imageURL');
    tenTinhTP = json.toStringJson(path: 'tenTinhTP');
    hanNopHoSo = json.toStringJson(path: 'hanNopHoSo');
    soNamKinhNghiem = json.toStringJson(path: 'soNamKinhNghiem');
    parentID = json.toStringJson(path: 'parent_ID');
    gtvl = json.toIntJson(path: 'gtvl');
    id = json.toIntJson(path: 'id');
    ages = json.toStringJson(path: 'ages');
    workTime = json.toStringJson(path: 'workTime');
    ungVienID = json.toStringJson(path: 'ungVien_ID');
    isInvite = json.toStringJson(path: 'isInvite');
    tinhTP = json.toStringJson(path: 'tinhTP');
    idSend = json.toStringJson(path: 'idSend');
    tuyenDungID = json.toStringJson(path: 'tuyenDung_ID');
    doanhNghiepID = json.toStringJson(path: 'doanhNghiep_ID');
    businessVn = json.toStringJson(path: 'business_Vn');
    jobPlace = json.toStringJson(path: 'jobPlace');
    ketQuaPhongVan = json.toIntJson(path: 'ketQuaPhongVan');
    levelDesiredID = json.toStringJson(path: 'levelDesired_ID');
    isFlag = json.toIntJson(path: 'isFlag');
    isView = json.toIntJson(path: 'isView');
    isSend = json.toIntJson(path: 'isSend');
    total = json.toIntJson(path: 'total');
    workID = json.toStringJson(path: 'work_ID');
    businessID = json.toStringJson(path: 'business_ID');
    title = json.toStringJson(path: 'title');
    salaryID = json.toStringJson(path: 'salary_ID');
    quantity = json.toIntJson(path: 'quantity');
    experienceID = json.toStringJson(path: 'experience_ID');
    gender = json.toIntJson(path: 'gender');
    levelID = json.toStringJson(path: 'level_ID');
    quanHuyen = json.toStringJson(path: 'quanHuyen');
    typeOfID = json.toStringJson(path: 'typeOf_ID');
    careerID = json.toStringJson(path: 'career_ID');
    description = json.toStringJson(path: 'description');
    requirement = json.toStringJson(path: 'requirement');
    benefit = json.toStringJson(path: 'benefit');
    requirementsProfile = json.toStringJson(path: 'requirementsProfile');
    expiredDate = json.toStringJson(path: 'expiredDate');
    submissionSend = json.toStringJson(path: 'submissionSend');
    startDate = json.toStringJson(path: 'startDate');
    endDate = json.toStringJson(path: 'endDate');
    contactUser = json.toStringJson(path: 'contactUser');
    contactAddress = json.toStringJson(path: 'contactAddress');
    contactMobile = json.toStringJson(path: 'contactMobile');
    contactEmail = json.toStringJson(path: 'contactEmail');
    contactDes = json.toStringJson(path: 'contactDes');
    isHot = json.toBoolJson(path: 'isHot');
    isGhim = json.toBoolJson(path: 'isGhim');
    isFast = json.toBoolJson(path: 'isFast');
    isUrgent = json.toBoolJson(path: 'isUrgent');
    isApproval = json.toBoolJson(path: 'isApproval');
    approvalUser = json.toStringJson(path: 'approvalUser');
    approvalDate = json.toStringJson(path: 'approvalDate');
    isDelete = json.toBoolJson(path: 'isDelete');
    deletedUser = json.toStringJson(path: 'deletedUser');
    deletedDate = json.toStringJson(path: 'deletedDate');
    createdDate = json.toStringJson(path: 'createdDate');
    createdUser = json.toStringJson(path: 'createdUser');
    updatedDate = json.toStringJson(path: 'updatedDate');
    updatedUser = json.toStringJson(path: 'updatedUser');
    portalID = json.toIntJson(path: 'portalID');
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
