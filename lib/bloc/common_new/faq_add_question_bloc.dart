//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/enum/data_bloc_status.dart';
import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/event/common_new/faq_add_question_event.dart';
import 'package:eportal/model/api/response/common_new/data/faq_add_question_data_response.dart';
import 'package:eportal/model/api/response/common_new/faq_add_question_response.dart';
import 'package:eportal/repository/common_new/faq_add_question_repository.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FaqAddQuestionBloc extends BaseSingleBloc<FaqAddQuestionDataResponse,
    FaqAddQuestionRepository, FaqAddQuestionEvent, FaqAddQuestionResponse> {
  @override
  Future<FaqAddQuestionResponse> callApiResult(
          FaqAddQuestionRepository apiRepository, FaqAddQuestionEvent event) =>
      apiRepository.getFaqAddQuestion(event.request);

  @override
  String? getFailMessage(FaqAddQuestionResponse response) => null;

  @override
  FaqAddQuestionRepository getRepository() => FaqAddQuestionRepository();
}
