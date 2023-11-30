//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/event/common_new/faq_question_search_event.dart';
import 'package:eportal/model/api/response/common_new/faq_question_search_response.dart';
import 'package:eportal/repository/common_new/faq_question_search_repository.dart';

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
      apiRepository.get(event.request);

  @override
  String? getFailMessage(FaqQuestionSearchResponse response) => null;

  @override
  FaqQuestionSearchRepository getRepository() => FaqQuestionSearchRepository();
}
