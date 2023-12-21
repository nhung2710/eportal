import 'package:eportal/bloc/common_new/faq_question_search_bloc.dart';
import 'package:eportal/event/common_new/faq_question_search_event.dart';
import 'package:eportal/model/api/request/common_new/data/faq_question_search_data_request.dart';
import 'package:eportal/model/api/request/common_new/faq_question_search_request.dart';
import 'package:eportal/model/api/response/common_new/data/faq_question_search_data_response.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/full_data_item/answer_and_question_item.dart';
import 'package:eportal/widget/input/search_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//
// Created by BlackRose on 29/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class AnswerAndQuestionSearchPage extends BasePage {
  const AnswerAndQuestionSearchPage({super.key});

  @override
  State<StatefulWidget> createState() => AnswerAndQuestionSearchPageState();
}

class AnswerAndQuestionSearchPageState
    extends BasePageStateActive<AnswerAndQuestionSearchPage> {
  late FaqQuestionSearchBloc faqQuestionSearchBloc;
  TextEditingController textEditingController = TextEditingController();
  FaqQuestionSearchRequest request =
      FaqQuestionSearchRequest(obj: FaqQuestionSearchDataRequest());

  @override
  void initBloc() {
    faqQuestionSearchBloc = FaqQuestionSearchBloc();
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
  }

  @override
  String getPageTitle(BuildContext context) => "Tìm kiếm câu hỏi";

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
  Widget pageUI(BuildContext context) => Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 5, top: 5),
            color: Colors.white,
            child: SearchInput(
              controller: textEditingController,
              maxLength: 50,
              textInputAction: TextInputAction.send,
              onFieldSubmitted: (value) => initDataLoading(),
              icon: Icons.search,
              onTap: () {
                initDataLoading();
              },
              hintText: "Nội dung tìm kiếm",
            ),
          ),
          Expanded(
            child: BlocProvider(
              create: (_) => faqQuestionSearchBloc,
              child: BlocListener<FaqQuestionSearchBloc,
                  DataPageState<FaqQuestionSearchDataResponse>>(
                listener: (BuildContext context, state) {},
                child: BlocBuilder<FaqQuestionSearchBloc,
                        DataPageState<FaqQuestionSearchDataResponse>>(
                    builder: (BuildContext context,
                            DataPageState<FaqQuestionSearchDataResponse>
                                state) =>
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
                                          question:
                                              state.elementAt(index).contents,
                                          onTap: () {},
                                        ),
                                      ),
                                    ),
                                  ],
                                ))),
              ),
            ),
          ),
        ],
      );
}
