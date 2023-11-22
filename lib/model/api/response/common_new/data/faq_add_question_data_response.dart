//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class FaqAddQuestionDataResponse {
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

  FaqAddQuestionDataResponse(
      {this.total,
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

  FaqAddQuestionDataResponse.fromJson(Map<String, dynamic> json) {
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
