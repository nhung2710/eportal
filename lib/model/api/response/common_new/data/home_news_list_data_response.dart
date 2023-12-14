import 'package:eportal/model/base/base_eportal_data_response.dart';

//
// Created by BlackRose on 13/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class HomeNewsListDataResponse extends BaseEportalDataResponse {
  String? categoryParentName;
  String? categoryName;
  String? total;
  String? newDay;
  String? newId;
  String? categoryId;
  String? introduction;
  String? title;
  String? imagePath;
  String? summary;
  String? content;
  bool? isActive;
  bool? hotcat;
  bool? isCare;
  String? isRead;
  String? status;
  String? unit;
  String? newsKind;
  String? type;
  String? typeUrl;
  String? links;
  String? tags;
  bool? isImage;
  String? note;
  String? sourceInfo;
  bool? isEdited;
  String? editedUser;
  String? editedTime;
  String? voteCount;
  String? viewCount;
  bool? isArchived;
  String? archivedDate;
  String? credit;
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
  String? portalId;
  String? toUrl;
  String? getFromPortal;
  String? getFromNewId;
  String? sendName;
  bool? sendView;

  HomeNewsListDataResponse(
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

  HomeNewsListDataResponse.fromJson(Map<String, dynamic> json) {
    categoryParentName = json['categoryParentName']?.toString();
    categoryName = json['categoryName']?.toString();
    total = json['total']?.toString();
    newDay = json['newDay']?.toString();
    newId = json['newId']?.toString();
    categoryId = json['categoryId']?.toString();
    introduction = json['introduction']?.toString();
    title = json['title']?.toString();
    imagePath = json['imagePath']?.toString();
    summary = json['summary']?.toString();
    content = json['content']?.toString();
    isActive = json['isActive'];
    hotcat = json['hotcat'];
    isCare = json['isCare'];
    isRead = json['isRead']?.toString();
    status = json['status']?.toString();
    unit = json['unit']?.toString();
    newsKind = json['newsKind']?.toString();
    type = json['type']?.toString();
    typeUrl = json['typeUrl']?.toString();
    links = json['links']?.toString();
    tags = json['tags']?.toString();
    isImage = json['isImage'];
    note = json['note']?.toString();
    sourceInfo = json['sourceInfo']?.toString();
    isEdited = json['isEdited'];
    editedUser = json['editedUser']?.toString();
    editedTime = json['editedTime']?.toString();
    voteCount = json['voteCount']?.toString();
    viewCount = json['viewCount']?.toString();
    isArchived = json['isArchived'];
    archivedDate = json['archivedDate']?.toString();
    credit = json['credit']?.toString();
    createdate = json['createdate']?.toString();
    approvalRequestDate = json['approvalRequestDate']?.toString();
    approvalDate = json['approvalDate']?.toString();
    approvalUser = json['approvalUser']?.toString();
    returnedDate = json['returnedDate']?.toString();
    returnedUser = json['returnedUser']?.toString();
    cancelPublishDate = json['cancelPublishDate']?.toString();
    cancelPublishUser = json['cancelPublishUser']?.toString();
    publishedDate = json['publishedDate']?.toString();
    publishedUser = json['publishedUser']?.toString();
    userId = json['userId']?.toString();
    writerName = json['writerName']?.toString();
    writerFullName = json['writerFullName']?.toString();
    numberNews = json['numberNews']?.toString();
    notePrices = json['notePrices']?.toString();
    languageId = json['languageId']?.toString();
    portalId = json['portalId']?.toString();
    toUrl = json['toUrl']?.toString();
    getFromPortal = json['getFromPortal']?.toString();
    getFromNewId = json['getFromNewId']?.toString();
    sendName = json['sendName']?.toString();
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
