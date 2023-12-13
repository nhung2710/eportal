import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/event/admin/work_search_by_user_name_event.dart';
import 'package:eportal/model/api/response/admin/data/work_search_by_user_name_data_response.dart';
import 'package:eportal/model/api/response/admin/work_search_by_user_name_response.dart';
import 'package:eportal/repository/admin/work_search_by_user_name_repository.dart';

//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class WorkSearchByUserNameBloc extends BaseSingleBloc<
    WorkSearchByUserNameDataResponse,
    WorkSearchByUserNameRepository,
    WorkSearchByUserNameEvent,
    WorkSearchByUserNameResponse> {
  @override
  Future<WorkSearchByUserNameResponse> callApiResult(
          WorkSearchByUserNameRepository apiRepository,
          WorkSearchByUserNameEvent event) =>
      apiRepository.get(event.request);

  @override
  String? getFailMessage(WorkSearchByUserNameResponse response) => null;

  @override
  WorkSearchByUserNameRepository getRepository() =>
      WorkSearchByUserNameRepository();
}
