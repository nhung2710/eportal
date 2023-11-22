import 'package:eportal/model/api/response/common_new/data/faq_question_search_data_response.dart';
import 'package:eportal/screen/share/answer_and_question/widget/answer_and_question_item.dart';
import 'package:eportal/screen/share/answer_and_question_add/page/answer_and_question_add_page.dart';
import 'package:eportal/screen/share/chat_bot/page/chat_bot_page.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/expandable_fab/expandable_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/common_new/faq_question_search_bloc.dart';
import '../../../../event/common_new/faq_question_search_event.dart';
import '../../../../model/api/request/common_new/data/faq_question_search_data_request.dart';
import '../../../../model/api/request/common_new/faq_question_search_request.dart';
import '../../../../model/api/response/common_new/faq_question_search_response.dart';
import '../../../../state/base/base_state.dart';

//
// Created by BlackRose on 11/7/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class AnswerAndQuestionPage extends BasePage {
  const AnswerAndQuestionPage({super.key});

  @override
  State<StatefulWidget> createState() => _AnswerAndQuestionPageState();
}

class _AnswerAndQuestionPageState
    extends BasePageStateActive<AnswerAndQuestionPage> {
  FaqQuestionSearchBloc faqQuestionSearchBloc = FaqQuestionSearchBloc();
  FaqQuestionSearchDataRequest request = FaqQuestionSearchDataRequest();

  @override
  bool isHasAppBar(BuildContext context) => false;

  @override
  void getMoreData() {
    request.soTrangHienTai++;
    faqQuestionSearchBloc.add(FaqQuestionSearchEvent(
        request: FaqQuestionSearchRequest(obj: request)));
  }

  @override
  void initDataLoading() {
    request.soTrangHienTai = 1;
    faqQuestionSearchBloc.add(FaqQuestionSearchEvent(
        request: FaqQuestionSearchRequest(obj: request)));
    super.initDataLoading();
  }

  @override
  Widget? getFloatingActionButton(BuildContext context) =>
      ExpandableFab(children: [
        ActionButton(
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            loadDataDemo().then((value) =>
                nextPage((context) => const AnswerAndQuestionAddPage()));
          },
        ),
      ]);

  @override
  Widget pageUI(BuildContext context) => BlocProvider(
        create: (_) => faqQuestionSearchBloc,
        child: BlocListener<FaqQuestionSearchBloc,
            DataMoreState<FaqQuestionSearchDataResponse>>(
          listener: (BuildContext context, state) {},
          child: BlocBuilder<FaqQuestionSearchBloc,
              DataMoreState<FaqQuestionSearchDataResponse>>(
            builder: (BuildContext context,
                DataMoreState<FaqQuestionSearchDataResponse> state) => handleDataMoreState(state, (context, state) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    controller: scrollController,
                    itemCount: state.length,
                    itemBuilder: (BuildContext context, int index) =>
                        AnswerAndQuestionItem(
                          data: state.elementAt(index),
                          index: index,
                          onTap: () {},
                        ),
                  ),
                ),
                              ],
                            ))
            )
                     ,
          ),

      );
}
