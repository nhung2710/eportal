import 'package:flutter/material.dart';

//
// Created by BlackRose on 13/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class NewsSearchDataResponse {
  String? categoryParentName;
  String? categoryName;
  int? total;
  int? newDay;
  int? newId;
  int? categoryId;
  String? introduction;
  String? title;
  String? imagePath;
  String? summary;
  String? content;
  bool? isActive;
  bool? hotcat;
  bool? isCare;
  int? isRead;
  int? status;
  int? unit;
  int? newsKind;
  int? type;
  String? typeUrl;
  String? links;
  String? tags;
  bool? isImage;
  String? note;
  int? sourceInfo;
  bool? isEdited;
  String? editedUser;
  String? editedTime;
  int? voteCount;
  int? viewCount;
  bool? isArchived;
  String? archivedDate;
  int? credit;
  String? createdate;
  String? approvalRequestDate;
  String? approvalDate;
  String? approvalUser;
  String? returnedDate;
  String? returnedUser;
  String? cancelPublishDate;
  String? cancelPublishUser;
  String? publishedDate;
  String? publishedUser;
  String? userId;
  String? writerName;
  String? writerFullName;
  String? numberNews;
  String? notePrices;
  String? languageId;
  int? portalId;
  String? toUrl;
  int? getFromPortal;
  int? getFromNewId;
  String? sendName;
  bool? sendView;

  NewsSearchDataResponse(
      {this.categoryParentName,
      this.categoryName,
      this.total,
      this.newDay,
      this.newId,
      this.categoryId,
      this.introduction,
      this.title,
      this.imagePath,
      this.summary,
      this.content,
      this.isActive,
      this.hotcat,
      this.isCare,
      this.isRead,
      this.status,
      this.unit,
      this.newsKind,
      this.type,
      this.typeUrl,
      this.links,
      this.tags,
      this.isImage,
      this.note,
      this.sourceInfo,
      this.isEdited,
      this.editedUser,
      this.editedTime,
      this.voteCount,
      this.viewCount,
      this.isArchived,
      this.archivedDate,
      this.credit,
      this.createdate,
      this.approvalRequestDate,
      this.approvalDate,
      this.approvalUser,
      this.returnedDate,
      this.returnedUser,
      this.cancelPublishDate,
      this.cancelPublishUser,
      this.publishedDate,
      this.publishedUser,
      this.userId,
      this.writerName,
      this.writerFullName,
      this.numberNews,
      this.notePrices,
      this.languageId,
      this.portalId,
      this.toUrl,
      this.getFromPortal,
      this.getFromNewId,
      this.sendName,
      this.sendView});

  NewsSearchDataResponse.fromJson(Map<String, dynamic> json) {
    categoryParentName = json['categoryParentName'];
    categoryName = json['categoryName'];
    total = json['total'];
    newDay = json['newDay'];
    newId = json['newId'];
    categoryId = json['categoryId'];
    introduction = json['introduction'];
    title = json['title'];
    imagePath = json['imagePath'];
    summary = json['summary'];
    content = json['content'];
    isActive = json['isActive'];
    hotcat = json['hotcat'];
    isCare = json['isCare'];
    isRead = json['isRead'];
    status = json['status'];
    unit = json['unit'];
    newsKind = json['newsKind'];
    type = json['type'];
    typeUrl = json['typeUrl'];
    links = json['links'];
    tags = json['tags'];
    isImage = json['isImage'];
    note = json['note'];
    sourceInfo = json['sourceInfo'];
    isEdited = json['isEdited'];
    editedUser = json['editedUser'];
    editedTime = json['editedTime'];
    voteCount = json['voteCount'];
    viewCount = json['viewCount'];
    isArchived = json['isArchived'];
    archivedDate = json['archivedDate'];
    credit = json['credit'];
    createdate = json['createdate'];
    approvalRequestDate = json['approvalRequestDate'];
    approvalDate = json['approvalDate'];
    approvalUser = json['approvalUser'];
    returnedDate = json['returnedDate'];
    returnedUser = json['returnedUser'];
    cancelPublishDate = json['cancelPublishDate'];
    cancelPublishUser = json['cancelPublishUser'];
    publishedDate = json['publishedDate'];
    publishedUser = json['publishedUser'];
    userId = json['userId'];
    writerName = json['writerName'];
    writerFullName = json['writerFullName'];
    numberNews = json['numberNews'];
    notePrices = json['notePrices'];
    languageId = json['languageId'];
    portalId = json['portalId'];
    toUrl = json['toUrl'];
    getFromPortal = json['getFromPortal'];
    getFromNewId = json['getFromNewId'];
    sendName = json['sendName'];
    sendView = json['sendView'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryParentName'] = this.categoryParentName;
    data['categoryName'] = this.categoryName;
    data['total'] = this.total;
    data['newDay'] = this.newDay;
    data['newId'] = this.newId;
    data['categoryId'] = this.categoryId;
    data['introduction'] = this.introduction;
    data['title'] = this.title;
    data['imagePath'] = this.imagePath;
    data['summary'] = this.summary;
    data['content'] = this.content;
    data['isActive'] = this.isActive;
    data['hotcat'] = this.hotcat;
    data['isCare'] = this.isCare;
    data['isRead'] = this.isRead;
    data['status'] = this.status;
    data['unit'] = this.unit;
    data['newsKind'] = this.newsKind;
    data['type'] = this.type;
    data['typeUrl'] = this.typeUrl;
    data['links'] = this.links;
    data['tags'] = this.tags;
    data['isImage'] = this.isImage;
    data['note'] = this.note;
    data['sourceInfo'] = this.sourceInfo;
    data['isEdited'] = this.isEdited;
    data['editedUser'] = this.editedUser;
    data['editedTime'] = this.editedTime;
    data['voteCount'] = this.voteCount;
    data['viewCount'] = this.viewCount;
    data['isArchived'] = this.isArchived;
    data['archivedDate'] = this.archivedDate;
    data['credit'] = this.credit;
    data['createdate'] = this.createdate;
    data['approvalRequestDate'] = this.approvalRequestDate;
    data['approvalDate'] = this.approvalDate;
    data['approvalUser'] = this.approvalUser;
    data['returnedDate'] = this.returnedDate;
    data['returnedUser'] = this.returnedUser;
    data['cancelPublishDate'] = this.cancelPublishDate;
    data['cancelPublishUser'] = this.cancelPublishUser;
    data['publishedDate'] = this.publishedDate;
    data['publishedUser'] = this.publishedUser;
    data['userId'] = this.userId;
    data['writerName'] = this.writerName;
    data['writerFullName'] = this.writerFullName;
    data['numberNews'] = this.numberNews;
    data['notePrices'] = this.notePrices;
    data['languageId'] = this.languageId;
    data['portalId'] = this.portalId;
    data['toUrl'] = this.toUrl;
    data['getFromPortal'] = this.getFromPortal;
    data['getFromNewId'] = this.getFromNewId;
    data['sendName'] = this.sendName;
    data['sendView'] = this.sendView;
    return data;
  }
}
