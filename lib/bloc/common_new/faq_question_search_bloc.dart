//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/enum/data_bloc_status.dart';
import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/event/common_new/document_list_event.dart';
import 'package:eportal/event/common_new/faq_question_search_event.dart';
import 'package:eportal/model/api/response/common_new/data/document_list_data_response.dart';
import 'package:eportal/model/api/response/common_new/document_list_response.dart';
import 'package:eportal/model/api/response/common_new/faq_question_search_response.dart';
import 'package:eportal/repository/common_new/document_list_repository.dart';
import 'package:eportal/repository/common_new/faq_question_search_repository.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/api/response/common_new/data/faq_question_search_data_response.dart';

class FaqQuestionSearchBloc extends BasePageBloc<
    FaqQuestionSearchDataResponse,
    FaqQuestionSearchRepository,
    FaqQuestionSearchEvent,
    FaqQuestionSearchResponse> {
  @override
  Future<FaqQuestionSearchResponse> callApiResult(
          FaqQuestionSearchRepository apiRepository,
          FaqQuestionSearchEvent event) =>
      apiRepository.getFaqQuestionSearch(event.request);

  @override
  String? getFailMessage(FaqQuestionSearchResponse response) => null;

  @override
  FaqQuestionSearchRepository getRepository() => FaqQuestionSearchRepository();
}
