import 'package:flutter/material.dart';

import '../../../../../extension/dateTime_extension.dart';
import '../../../../../extension/string_extension.dart';

//
// Created by BlackRose on 13/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class HomeDocumentListDataResponse {
  String? documentID;
  String? documentName;
  String? docTypeID;
  String? docFieldID;
  String? docGroupID;
  String? docUnitID;
  String? docUnitName;
  String? contents;
  String? noCode;
  String? signerName;
  String? promDate;
  String? effectDate;
  String? endDate;
  String? fileName;
  String? fileSource;
  String? isURL;
  int? isDownload;
  bool? isActive;
  int? isOrder;
  String? createdBy;
  String? userName;
  String? updatedBy;
  String? updateName;
  int? portalID;
  bool? sendView;
  int? total;

  HomeDocumentListDataResponse(
      {this.documentID,
      this.documentName,
      this.docTypeID,
      this.docFieldID,
      this.docGroupID,
      this.docUnitID,
      this.docUnitName,
      this.contents,
      this.noCode,
      this.signerName,
      this.promDate,
      this.effectDate,
      this.endDate,
      this.fileName,
      this.fileSource,
      this.isURL,
      this.isDownload,
      this.isActive,
      this.isOrder,
      this.createdBy,
      this.userName,
      this.updatedBy,
      this.updateName,
      this.portalID,
      this.sendView,
      this.total});

  HomeDocumentListDataResponse.fromJson(Map<String, dynamic> json) {
    documentID = json['document_ID'];
    documentName = json['document_Name'];
    docTypeID = json['docType_ID'];
    docFieldID = json['docField_ID'];
    docGroupID = json['docGroup_ID'];
    docUnitID = json['docUnit_ID'];
    docUnitName = json['docUnit_Name'];
    contents = json['contents'];
    noCode = json['noCode'];
    signerName = json['signerName'];
    promDate = json['promDate'];
    effectDate = json['effectDate'];
    effectDate = effectDate.formatDateTimeApi();

    endDate = json['endDate'];
    fileName = json['fileName'];
    fileSource = json['fileSource'];
    isURL = json['isURL'];
    isDownload = json['isDownload'];
    isActive = json['isActive'];
    isOrder = json['isOrder'];
    createdBy = json['createdBy'];
    userName = json['userName'];
    updatedBy = json['updatedBy'];
    updateName = json['updateName'];
    portalID = json['portalID'];
    sendView = json['sendView'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['document_ID'] = this.documentID;
    data['document_Name'] = this.documentName;
    data['docType_ID'] = this.docTypeID;
    data['docField_ID'] = this.docFieldID;
    data['docGroup_ID'] = this.docGroupID;
    data['docUnit_ID'] = this.docUnitID;
    data['docUnit_Name'] = this.docUnitName;
    data['contents'] = this.contents;
    data['noCode'] = this.noCode;
    data['signerName'] = this.signerName;
    data['promDate'] = this.promDate;
    data['effectDate'] = this.effectDate;
    data['endDate'] = this.endDate;
    data['fileName'] = this.fileName;
    data['fileSource'] = this.fileSource;
    data['isURL'] = this.isURL;
    data['isDownload'] = this.isDownload;
    data['isActive'] = this.isActive;
    data['isOrder'] = this.isOrder;
    data['createdBy'] = this.createdBy;
    data['userName'] = this.userName;
    data['updatedBy'] = this.updatedBy;
    data['updateName'] = this.updateName;
    data['portalID'] = this.portalID;
    data['sendView'] = this.sendView;
    data['total'] = this.total;
    return data;
  }
}
