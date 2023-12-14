//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import '../../../../base/base_eportal_data_response.dart';

class AlbumListDataResponse extends BaseEportalDataResponse {
  String? categoryName;
  String? total;
  String? id;
  String? categoryId;
  String? name;
  String? summary;
  String? avatar;
  String? mediaUrl;
  String? folders;
  String? contents;
  String? viewCount;
  String? status;
  String? type;
  bool? isYoutube;
  bool? isHot;
  bool? isFTP;
  String? tags;
  String? note;
  String? createdDate;
  String? publishedDate;
  String? approvalDate;
  String? createdUser;
  String? approvalUser;
  String? publishedUser;
  String? portalId;
  String? languageId;
  String? stt;
  bool? isHome;
  bool? isPage;
  String? toUrl;
  bool? sendView;
  bool? isDelete;
  String? deleteDate;
  String? deleteUser;
  String? writerName;

  AlbumListDataResponse(
      {this.categoryName,
      this.total,
      this.id,
      this.categoryId,
      this.name,
      this.summary,
      this.avatar,
      this.mediaUrl,
      this.folders,
      this.contents,
      this.viewCount,
      this.status,
      this.type,
      this.isYoutube,
      this.isHot,
      this.isFTP,
      this.tags,
      this.note,
      this.createdDate,
      this.publishedDate,
      this.approvalDate,
      this.createdUser,
      this.approvalUser,
      this.publishedUser,
      this.portalId,
      this.languageId,
      this.stt,
      this.isHome,
      this.isPage,
      this.toUrl,
      this.sendView,
      this.isDelete,
      this.deleteDate,
      this.deleteUser,
      this.writerName});

  AlbumListDataResponse.fromJson(Map<String, dynamic> json) {
    categoryName = json['categoryName']?.toString();
    total = json['total']?.toString();
    id = json['id']?.toString();
    categoryId = json['categoryId']?.toString();
    name = json['name']?.toString();
    summary = json['summary']?.toString();
    avatar = json['avatar']?.toString();
    mediaUrl = json['mediaUrl']?.toString();
    folders = json['folders']?.toString();
    contents = json['contents']?.toString();
    viewCount = json['viewCount']?.toString();
    status = json['status']?.toString();
    type = json['type']?.toString();
    isYoutube = json['isYoutube'];
    isHot = json['isHot'];
    isFTP = json['isFTP'];
    tags = json['tags']?.toString();
    note = json['note']?.toString();
    createdDate = json['createdDate']?.toString();
    publishedDate = json['publishedDate']?.toString();
    approvalDate = json['approvalDate']?.toString();
    createdUser = json['createdUser']?.toString();
    approvalUser = json['approvalUser']?.toString();
    publishedUser = json['publishedUser']?.toString();
    portalId = json['portalId']?.toString();
    languageId = json['languageId']?.toString();
    stt = json['stt']?.toString();
    isHome = json['isHome'];
    isPage = json['isPage'];
    toUrl = json['toUrl']?.toString();
    sendView = json['sendView'];
    isDelete = json['isDelete'];
    deleteDate = json['deleteDate']?.toString();
    deleteUser = json['deleteUser']?.toString();
    writerName = json['writerName']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryName'] = this.categoryName;
    data['total'] = this.total;
    data['id'] = this.id;
    data['categoryId'] = this.categoryId;
    data['name'] = this.name;
    data['summary'] = this.summary;
    data['avatar'] = this.avatar;
    data['mediaUrl'] = this.mediaUrl;
    data['folders'] = this.folders;
    data['contents'] = this.contents;
    data['viewCount'] = this.viewCount;
    data['status'] = this.status;
    data['type'] = this.type;
    data['isYoutube'] = this.isYoutube;
    data['isHot'] = this.isHot;
    data['isFTP'] = this.isFTP;
    data['tags'] = this.tags;
    data['note'] = this.note;
    data['createdDate'] = this.createdDate;
    data['publishedDate'] = this.publishedDate;
    data['approvalDate'] = this.approvalDate;
    data['createdUser'] = this.createdUser;
    data['approvalUser'] = this.approvalUser;
    data['publishedUser'] = this.publishedUser;
    data['portalId'] = this.portalId;
    data['languageId'] = this.languageId;
    data['stt'] = this.stt;
    data['isHome'] = this.isHome;
    data['isPage'] = this.isPage;
    data['toUrl'] = this.toUrl;
    data['sendView'] = this.sendView;
    data['isDelete'] = this.isDelete;
    data['deleteDate'] = this.deleteDate;
    data['deleteUser'] = this.deleteUser;
    data['writerName'] = this.writerName;
    return data;
  }
}
