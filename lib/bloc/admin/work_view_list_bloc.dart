import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/event/admin/work_update_event.dart';
import 'package:eportal/event/admin/work_view_list_event.dart';
import 'package:eportal/model/api/response/admin/data/work_update_data_response.dart';
import 'package:eportal/model/api/response/admin/data/work_view_list_data_response.dart';
import 'package:eportal/model/api/response/admin/work_update_response.dart';
import 'package:eportal/model/api/response/admin/work_view_list_response.dart';
import 'package:eportal/repository/admin/work_update_repository.dart';
import 'package:eportal/repository/admin/work_view_list_repository.dart';

//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class WorkViewListBloc extends BasePageBloc<WorkViewListDataResponse,
    WorkViewListRepository, WorkViewListEvent, WorkViewListResponse> {
  @override
  Future<WorkViewListResponse> callApiResult(
          WorkViewListRepository apiRepository, WorkViewListEvent event) =>
      apiRepository.get(event.request);

  @override
  String? getFailMessage(WorkViewListResponse response) => null;

  @override
  WorkViewListRepository getRepository() => WorkViewListRepository();
}
