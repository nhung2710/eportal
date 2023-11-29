//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import '../../../../base/base_eportal_data_response.dart';

class AlbumListDataResponse extends BaseEportalDataResponse {
  String? categoryName;
  int? total;
  int? id;
  int? categoryId;
  String? name;
  String? summary;
  String? avatar;
  String? mediaUrl;
  String? folders;
  String? contents;
  int? viewCount;
  int? status;
  int? type;
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
  int? portalId;
  String? languageId;
  int? stt;
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
    categoryName = json['categoryName'];
    total = json['total'];
    id = json['id'];
    categoryId = json['categoryId'];
    name = json['name'];
    summary = json['summary'];
    avatar = json['avatar'];
    mediaUrl = json['mediaUrl'];
    folders = json['folders'];
    contents = json['contents'];
    viewCount = json['viewCount'];
    status = json['status'];
    type = json['type'];
    isYoutube = json['isYoutube'];
    isHot = json['isHot'];
    isFTP = json['isFTP'];
    tags = json['tags'];
    note = json['note'];
    createdDate = json['createdDate'];
    publishedDate = json['publishedDate'];
    approvalDate = json['approvalDate'];
    createdUser = json['createdUser'];
    approvalUser = json['approvalUser'];
    publishedUser = json['publishedUser'];
    portalId = json['portalId'];
    languageId = json['languageId'];
    stt = json['stt'];
    isHome = json['isHome'];
    isPage = json['isPage'];
    toUrl = json['toUrl'];
    sendView = json['sendView'];
    isDelete = json['isDelete'];
    deleteDate = json['deleteDate'];
    deleteUser = json['deleteUser'];
    writerName = json['writerName'];
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
