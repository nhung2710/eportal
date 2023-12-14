//
// Created by BlackRose on 13/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/base/base_eportal_data_response.dart';

class JobUserSearchDataResponse extends BaseEportalDataResponse {
  String? userAdminText;
  bool? isBHTN;
  String? id;
  String? total;
  bool? isPause;
  bool? isTemp;
  String? jobUserID;
  String? title;
  String? careerID;
  String? currentLevel;
  String? levelDesired;
  String? tinhTP;
  String? quanHuyen;
  String? experienceID;
  String? levelID;
  String? salaryID;
  String? needsID;
  String? education;
  String? careerGoals;
  String? workExperience;
  String? skillsForte;
  String? userAdmin;
  String? startDate;
  String? endDate;
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
  String? isView;
  String? isSend;
  String? portalID;

  JobUserSearchDataResponse(
      {this.userAdminText,
      this.isBHTN,
      this.id,
      this.total,
      this.isPause,
      this.isTemp,
      this.jobUserID,
      this.title,
      this.careerID,
      this.currentLevel,
      this.levelDesired,
      this.tinhTP,
      this.quanHuyen,
      this.experienceID,
      this.levelID,
      this.salaryID,
      this.needsID,
      this.education,
      this.careerGoals,
      this.workExperience,
      this.skillsForte,
      this.userAdmin,
      this.startDate,
      this.endDate,
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
      this.isView,
      this.isSend,
      this.portalID});

  JobUserSearchDataResponse.fromJson(Map<String, dynamic> json) {
    userAdminText = json['userAdminText']?.toString();
    isBHTN = json['isBHTN'];
    id = json['id']?.toString();
    total = json['total']?.toString();
    isPause = json['isPause'];
    isTemp = json['isTemp'];
    jobUserID = json['jobUser_ID']?.toString();
    title = json['title']?.toString();
    careerID = json['career_ID']?.toString();
    currentLevel = json['currentLevel']?.toString();
    levelDesired = json['levelDesired']?.toString();
    tinhTP = json['tinhTP']?.toString();
    quanHuyen = json['quanHuyen']?.toString();
    experienceID = json['experience_ID']?.toString();
    levelID = json['level_ID']?.toString();
    salaryID = json['salary_ID']?.toString();
    needsID = json['needs_ID']?.toString();
    education = json['education']?.toString();
    careerGoals = json['careerGoals']?.toString();
    workExperience = json['workExperience']?.toString();
    skillsForte = json['skillsForte']?.toString();
    userAdmin = json['userAdmin']?.toString();
    startDate = json['startDate']?.toString();
    endDate = json['endDate']?.toString();
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
    isView = json['isView']?.toString();
    isSend = json['isSend']?.toString();
    portalID = json['portalID']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userAdminText'] = this.userAdminText;
    data['isBHTN'] = this.isBHTN;
    data['id'] = this.id;
    data['total'] = this.total;
    data['isPause'] = this.isPause;
    data['isTemp'] = this.isTemp;
    data['jobUser_ID'] = this.jobUserID;
    data['title'] = this.title;
    data['career_ID'] = this.careerID;
    data['currentLevel'] = this.currentLevel;
    data['levelDesired'] = this.levelDesired;
    data['tinhTP'] = this.tinhTP;
    data['quanHuyen'] = this.quanHuyen;
    data['experience_ID'] = this.experienceID;
    data['level_ID'] = this.levelID;
    data['salary_ID'] = this.salaryID;
    data['needs_ID'] = this.needsID;
    data['education'] = this.education;
    data['careerGoals'] = this.careerGoals;
    data['workExperience'] = this.workExperience;
    data['skillsForte'] = this.skillsForte;
    data['userAdmin'] = this.userAdmin;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
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
    data['isView'] = this.isView;
    data['isSend'] = this.isSend;
    data['portalID'] = this.portalID;
    return data;
  }
}
