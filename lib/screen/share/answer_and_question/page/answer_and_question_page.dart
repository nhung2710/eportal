import 'package:eportal/application/global_application.dart';
import 'package:eportal/model/api/response/common_new/data/faq_question_search_data_response.dart';
import 'package:eportal/screen/share/answer_and_question_add/page/answer_and_question_add_page.dart';
import 'package:eportal/screen/share/answer_and_question_search/page/answer_and_question_search_page.dart';
import 'package:eportal/screen/share/sign_in/page/sign_in_page.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/expandable_fab/expandable_fab.dart';
import 'package:eportal/widget/full_data_item/answer_and_question_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/common_new/faq_question_search_bloc.dart';
import '../../../../event/common_new/faq_question_search_event.dart';
import '../../../../model/api/request/common_new/data/faq_question_search_data_request.dart';
import '../../../../model/api/request/common_new/faq_question_search_request.dart';
import '../../../../state/base/base_state.dart';
import '../../chat_bot_manage/page/chat_bot_manage_page.dart';

//
// Created by BlackRose on 11/7/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class AnswerAndQuestionPage extends BasePage {
  const AnswerAndQuestionPage({super.key});

  @override
  State<StatefulWidget> createState() => AnswerAndQuestionPageState();
}

class AnswerAndQuestionPageState
    extends BasePageStateActive<AnswerAndQuestionPage> {
  late FaqQuestionSearchBloc faqQuestionSearchBloc;
  FaqQuestionSearchRequest request =
      FaqQuestionSearchRequest(obj: FaqQuestionSearchDataRequest());

  @override
  void initBloc() {
    faqQuestionSearchBloc = FaqQuestionSearchBloc();
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    faqQuestionSearchBloc.close();
  }

  @override
  bool isHasAppBar(BuildContext context) => false;

  @override
  void getMoreData() {
    request.obj.nextData();
    callApi();
  }

  @override
  void initDataLoading() {
    request.obj.reloadData();
    callApi();
  }

  @override
  void callApi() {
    faqQuestionSearchBloc.add(FaqQuestionSearchEvent(request: request));
  }

  @override
  Widget? getFloatingActionButton(BuildContext context) => ExpandableFab(
        initNumberGroup: 3,
        children: [
          ActionButton(
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              nextPage((context) => const AnswerAndQuestionAddPage());
            },
          ),
          ActionButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              nextPage((context) => const AnswerAndQuestionSearchPage());
            },
          ),
          ActionButton(
            icon: const Icon(
              Icons.support_agent,
              color: Colors.white,
            ),
            onPressed: () {
              nextPage((context) => GlobalApplication().isLogin
                  ? const ChatBotManagePage()
                  : const SignInPage());
            },
          ),
        ],
      );

  @override
  Widget pageUI(BuildContext context) => BlocProvider(
        create: (_) => faqQuestionSearchBloc,
        child: BlocListener<FaqQuestionSearchBloc,
            DataPageState<FaqQuestionSearchDataResponse>>(
          listener: (BuildContext context, state) {},
          child: BlocBuilder<FaqQuestionSearchBloc,
                  DataPageState<FaqQuestionSearchDataResponse>>(
              builder: (BuildContext context,
                      DataPageState<FaqQuestionSearchDataResponse> state) =>
                  handleDataPageState(
                      state,
                      (context, state) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  controller: scrollController,
                                  itemCount: state.length,
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                          AnswerAndQuestionItem(
                                    isShowFull: true,
                                    answer: state
                                        .elementAt(index)
                                        .answerOb
                                        ?.contents,
                                    question: state.elementAt(index).contents,
                                    onTap: () {},
                                  ),
                                ),
                              ),
                            ],
                          ))),
        ),
      );
}
