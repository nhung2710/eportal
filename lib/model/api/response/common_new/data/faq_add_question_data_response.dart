//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class FaqAddQuestionDataResponse {
  String? total;
  String? id;
  String? faqid;
  String? name;
  String? contents;
  String? fileAttach;
  String? adress;
  String? email;
  String? phone;
  String? sendDate;
  String? status;
  bool? isPublic;
  String? portalId;
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
    total = json['total']?.toString();
    id = json['id']?.toString();
    faqid = json['faqid']?.toString();
    name = json['name']?.toString();
    contents = json['contents']?.toString();
    fileAttach = json['fileAttach']?.toString();
    adress = json['adress']?.toString();
    email = json['email']?.toString();
    phone = json['phone']?.toString();
    sendDate = json['sendDate']?.toString();
    status = json['status']?.toString();
    isPublic = json['isPublic'];
    portalId = json['portalId']?.toString();
    createDate = json['createDate']?.toString();
    createUser = json['createUser']?.toString();
    updateDate = json['updateDate']?.toString();
    updateUser = json['updateUser']?.toString();
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
