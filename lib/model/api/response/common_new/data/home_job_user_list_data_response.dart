import '../../../../../extension/string_extension.dart';

//
// Created by BlackRose on 13/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class HomeJobUserListDataResponse {
  Null? userAdminText;
  bool? isBHTN;
  int? id;
  int? total;
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
  int? isView;
  int? isSend;
  int? portalID;

  HomeJobUserListDataResponse(
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

  HomeJobUserListDataResponse.fromJson(Map<String, dynamic> json) {
    userAdminText = json['userAdminText'];
    isBHTN = json['isBHTN'];
    id = json['id'];
    total = json['total'];
    isPause = json['isPause'];
    isTemp = json['isTemp'];
    jobUserID = json['jobUser_ID'];
    title = json['title'];
    careerID = json['career_ID'];
    currentLevel = json['currentLevel'];
    levelDesired = json['levelDesired'];
    tinhTP = json['tinhTP'];
    quanHuyen = json['quanHuyen'];
    experienceID = json['experience_ID'];
    levelID = json['level_ID'];
    salaryID = json['salary_ID'];
    needsID = json['needs_ID'];
    education = json['education'];
    education = education.supportHtml();
    careerGoals = json['careerGoals'];
    careerGoals = careerGoals.supportHtml();
    workExperience = json['workExperience'];
    workExperience = workExperience.supportHtml();
    skillsForte = json['skillsForte'];
    skillsForte = skillsForte.supportHtml();
    userAdmin = json['userAdmin'];
    startDate = json['startDate'];
    endDate = json['endDate'];
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
    isView = json['isView'];
    isSend = json['isSend'];
    portalID = json['portalID'];
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
