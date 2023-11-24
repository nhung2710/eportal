//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:eportal/model/base/base_eportal_data_response.dart';

import '../../../../base/base_eportal_response.dart';

class FaqQuestionSearchDataResponse extends BaseEportalDataResponse {
  FaqQuestionSearchAnswerDataResponse? answerOb;
  int? total;
  String? id;
  String? faqid;
  String? name;
  String? contents;
  String? fileAttach;
  String? adress;
  String? email;
  String? phone;
  String? sendDate;
  int? status;
  bool? isPublic;
  int? portalId;
  String? createDate;
  String? createUser;
  String? updateDate;
  String? updateUser;
  bool? sendView;

  FaqQuestionSearchDataResponse(
      {this.answerOb,
      this.total,
      this.id,
      this.faqid,
      this.name,
      this.contents,
      this.fileAttach,
      this.adress,
      this.email,
      this.phone,
      this.sendDate,
      this.status,
      this.isPublic,
      this.portalId,
      this.createDate,
      this.createUser,
      this.updateDate,
      this.updateUser,
      this.sendView});

  FaqQuestionSearchDataResponse.fromJson(Map<String, dynamic> json) {
    if (json['answerOb'] != null) {
      answerOb = FaqQuestionSearchAnswerDataResponse.fromJson(json['answerOb']);
    }
    total = json['total'];
    id = json['id'];
    faqid = json['faqid'];
    name = json['name'];
    contents = json['contents'];
    fileAttach = json['fileAttach'];
    adress = json['adress'];
    email = json['email'];
    phone = json['phone'];
    sendDate = json['sendDate'];
    status = json['status'];
    isPublic = json['isPublic'];
    portalId = json['portalId'];
    createDate = json['createDate'];
    createUser = json['createUser'];
    updateDate = json['updateDate'];
    updateUser = json['updateUser'];
    sendView = json['sendView'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['answerOb'] = this.answerOb;
    data['total'] = this.total;
    data['id'] = this.id;
    data['faqid'] = this.faqid;
    data['name'] = this.name;
    data['contents'] = this.contents;
    data['fileAttach'] = this.fileAttach;
    data['adress'] = this.adress;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['sendDate'] = this.sendDate;
    data['status'] = this.status;
    data['isPublic'] = this.isPublic;
    data['portalId'] = this.portalId;
    data['createDate'] = this.createDate;
    data['createUser'] = this.createUser;
    data['updateDate'] = this.updateDate;
    data['updateUser'] = this.updateUser;
    data['sendView'] = this.sendView;
    return data;
  }
}

class FaqQuestionSearchAnswerDataResponse {
  int? total;
  String? id;
  String? questionID;
  String? name;
  String? title;
  String? contents;
  String? fileAttach;
  String? sendDate;
  int? status;
  bool? isPublic;
  int? portalId;
  String? answerName;
  String? createDate;
  String? createUser;
  String? updateDate;
  String? updateUser;
  bool? sendView;

  FaqQuestionSearchAnswerDataResponse(
      {this.total,
      this.id,
      this.questionID,
      this.name,
      this.title,
      this.contents,
      this.fileAttach,
      this.sendDate,
      this.status,
      this.isPublic,
      this.portalId,
      this.answerName,
      this.createDate,
      this.createUser,
      this.updateDate,
      this.updateUser,
      this.sendView});

  FaqQuestionSearchAnswerDataResponse.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    id = json['id'];
    questionID = json['questionID'];
    name = json['name'];
    title = json['title'];
    contents = json['contents'];
    fileAttach = json['fileAttach'];
    sendDate = json['sendDate'];
    status = json['status'];
    isPublic = json['isPublic'];
    portalId = json['portalId'];
    answerName = json['answerName'];
    createDate = json['createDate'];
    createUser = json['createUser'];
    updateDate = json['updateDate'];
    updateUser = json['updateUser'];
    sendView = json['sendView'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['id'] = this.id;
    data['questionID'] = this.questionID;
    data['name'] = this.name;
    data['title'] = this.title;
    data['contents'] = this.contents;
    data['fileAttach'] = this.fileAttach;
    data['sendDate'] = this.sendDate;
    data['status'] = this.status;
    data['isPublic'] = this.isPublic;
    data['portalId'] = this.portalId;
    data['answerName'] = this.answerName;
    data['createDate'] = this.createDate;
    data['createUser'] = this.createUser;
    data['updateDate'] = this.updateDate;
    data['updateUser'] = this.updateUser;
    data['sendView'] = this.sendView;
    return data;
  }
}
