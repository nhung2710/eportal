//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/enum/data_bloc_status.dart';
import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/event/common_new/document_list_event.dart';
import 'package:eportal/model/api/response/common_new/data/document_list_data_response.dart';
import 'package:eportal/model/api/response/common_new/document_list_response.dart';
import 'package:eportal/repository/common_new/document_list_repository.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DocumentListBloc extends BasePageBloc<DocumentListDataResponse,
    DocumentListRepository, DocumentListEvent, DocumentListResponse> {
  @override
  Future<DocumentListResponse> callApiResult(
          DocumentListRepository apiRepository, DocumentListEvent event) =>
      apiRepository.getDocumentList(event.request);

  @override
  String? getFailMessage(DocumentListResponse response) => null;

  @override
  DocumentListRepository getRepository() => DocumentListRepository();
}
