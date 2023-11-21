import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/model/api/request/common_new/faq_question_search_request.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class FaqQuestionSearchEvent extends BaseEvent<FaqQuestionSearchRequest> {
  const FaqQuestionSearchEvent({required super.request});
}
