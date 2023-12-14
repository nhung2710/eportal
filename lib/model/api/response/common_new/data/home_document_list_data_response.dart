import 'package:eportal/model/base/base_eportal_data_response.dart';

//
// Created by BlackRose on 13/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class HomeDocumentListDataResponse extends BaseEportalDataResponse {
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
  String? isDownload;
  bool? isActive;
  String? isOrder;
  String? createdBy;
  String? userName;
  String? updatedBy;
  String? updateName;
  String? portalID;
  bool? sendView;
  String? total;

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
    documentID = json['document_ID']?.toString();
    documentName = json['document_Name']?.toString();
    docTypeID = json['docType_ID']?.toString();
    docFieldID = json['docField_ID']?.toString();
    docGroupID = json['docGroup_ID']?.toString();
    docUnitID = json['docUnit_ID']?.toString();
    docUnitName = json['docUnit_Name']?.toString();
    contents = json['contents']?.toString();
    noCode = json['noCode']?.toString();
    signerName = json['signerName']?.toString();
    promDate = json['promDate']?.toString();
    effectDate = json['effectDate']?.toString();

    endDate = json['endDate']?.toString();
    fileName = json['fileName']?.toString();
    fileSource = json['fileSource']?.toString();
    isURL = json['isURL']?.toString();
    isDownload = json['isDownload']?.toString();
    isActive = json['isActive'];
    isOrder = json['isOrder']?.toString();
    createdBy = json['createdBy']?.toString();
    userName = json['userName']?.toString();
    updatedBy = json['updatedBy']?.toString();
    updateName = json['updateName']?.toString();
    portalID = json['portalID']?.toString();
    sendView = json['sendView'];
    total = json['total']?.toString();
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
