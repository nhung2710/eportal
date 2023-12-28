//
// Created by BlackRose on 28/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:eportal/bloc/common_new/faq_question_search_bloc.dart';
import 'package:eportal/model/api/request/common_new/data/faq_question_search_data_request.dart';
import 'package:eportal/model/api/request/common_new/faq_question_search_request.dart';
import 'package:eportal/model/api/response/common_new/data/faq_question_search_data_response.dart';
import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/share/question_answer/widget/question_answer_item.dart';
import 'package:eportal/page/share/question_answer_add/page/question_answer_add_page.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/expandable_fab/expandable_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../event/common_new/faq_question_search_event.dart';
import '../../../base/page_widget/base_page_widget.dart';
import '../../../widget/default_card_item.dart';
import '../../question_answer_detail/page/question_answer_detail_page.dart';

class QuestionAnswerPage extends BasePageWidget {
  const QuestionAnswerPage({super.key});

  @override
  State<StatefulWidget> createState() => QuestionAnswerPageState();
}

class QuestionAnswerPageState
    extends BasePageState<QuestionAnswerPage> {
  late FaqQuestionSearchBloc faqQuestionSearchBloc;
  FaqQuestionSearchEvent faqQuestionSearchEvent = FaqQuestionSearchEvent(request: FaqQuestionSearchRequest(obj: FaqQuestionSearchDataRequest()));

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
  void getMoreData() {
    faqQuestionSearchEvent.request.obj.nextData();
    callApi();
  }

  @override
  void initDataLoading() {
    faqQuestionSearchEvent.request.obj.reloadData();
    callApi();
  }

  @override
  PreferredSizeWidget? getAppBar(BuildContext context) => defaultTabBar();
  @override
  void callApi() {
    faqQuestionSearchBloc.add(faqQuestionSearchEvent);
  }

  @override
  Widget? getFloatingActionButton(BuildContext context) => ExpandableFab(
    initNumberGroup: 1,
    children: [
      ActionButton(
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          nextPage((context) => const QuestionAnswerAddPage());
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
                      (context, state) => Container(
                        margin: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                "Hỏi đáp",
                                style: AppTextStyle.titlePage.copyWith(
                                    overflow: TextOverflow.visible,
                                    fontSize: 18,
                                    color: AppColor.colorOfIconActive),
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                controller: scrollController,
                                itemCount: state.length,
                                itemBuilder:
                                    (BuildContext context, int index) => QuestionAnswerItem(
                                      data: state.elementAt(index),
                                      onClickItem: (FaqQuestionSearchDataResponse value)  => nextPage((context) => QuestionAnswerDetailPage(data:value)),
                                    )
                              ),
                            ),
                          ],
                        ),
                      ))),
    ),
  );
}