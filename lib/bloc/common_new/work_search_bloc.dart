//
// Created by BlackRose on 11/10/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:bloc/bloc.dart';
import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/enum/data_bloc_status.dart';
import 'package:eportal/model/api/response/common_new/data/work_search_data_response.dart';
import 'package:eportal/model/api/response/common_new/work_search_response.dart';

import '../../event/base/base_event.dart';
import '../../event/common_new/work_search_event.dart';
import '../../repository/common_new/work_search_repository.dart';
import '../../state/base/base_state.dart';

class WorkSearchBloc extends BasePageBloc<WorkSearchDataResponse,
    WorkSearchRepository, WorkSearchEvent, WorkSearchResponse> {
  @override
  Future<WorkSearchResponse> callApiResult(
          WorkSearchRepository apiRepository, WorkSearchEvent event) =>
      apiRepository.getWorkSearch(event.request);

  @override
  String? getFailMessage(WorkSearchResponse response) => null;

  @override
  WorkSearchRepository getRepository() => WorkSearchRepository();
}
