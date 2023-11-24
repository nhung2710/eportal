//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:bloc/bloc.dart';
import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/enum/data_bloc_status.dart';
import 'package:eportal/model/api/response/common_new/data/home_document_list_data_response.dart';
import 'package:eportal/model/api/response/common_new/home_document_list_response.dart';

import '../../event/base/base_event.dart';
import '../../event/common_new/home_document_list_event.dart';
import '../../repository/common_new/home_document_list_repository.dart';
import '../../state/base/base_state.dart';

class HomeDocumentListBloc extends BaseMultiBloc<
    HomeDocumentListDataResponse,
    HomeDocumentListRepository,
    HomeDocumentListEvent,
    HomeDocumentListResponse> {
  @override
  Future<HomeDocumentListResponse> callApiResult(
          HomeDocumentListRepository apiRepository,
          HomeDocumentListEvent event) =>
      apiRepository.getHomeDocumentList(event.request);

  @override
  String? getFailMessage(HomeDocumentListResponse response) => null;

  @override
  HomeDocumentListRepository getRepository() => HomeDocumentListRepository();
}
