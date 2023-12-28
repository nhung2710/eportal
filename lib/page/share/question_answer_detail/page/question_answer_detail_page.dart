//
// Created by BlackRose on 28/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:eportal/model/api/response/common_new/data/faq_question_search_data_response.dart';
import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/base/page_widget/base_page_widget.dart';
import 'package:eportal/page/widget/default_card_item.dart';
import 'package:eportal/page/widget/default_label_item.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/expandable_fab/expandable_fab.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../extension/string_extension.dart';

class QuestionAnswerDetailPage extends BasePageWidget {
  final FaqQuestionSearchDataResponse data;
  const QuestionAnswerDetailPage({super.key,required this.data});

  @override
  State<StatefulWidget> createState() => QuestionAnswerDetailPageState();
}

class QuestionAnswerDetailPageState
    extends BasePageState<QuestionAnswerDetailPage> {

  @override
  void initBloc() {
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
  }


  @override
  void getMoreData() {
    callApi();
  }

  @override
  void initDataLoading() {
    callApi();
  }

  @override
  PreferredSizeWidget? getAppBar(BuildContext context) => defaultTabBar();
  @override
  void callApi() {
  }


  @override
  Widget pageUI(BuildContext context) => Container(
    margin: const EdgeInsets.all(10),
    child: ListView(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text(
            "Chi tiết hỏi đáp",
            style: AppTextStyle.titlePage.copyWith(
                overflow: TextOverflow.visible,
                fontSize: 18,
                color: AppColor.colorOfIconActive),
          ),
        ),
        DefaultCardItem(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DefaultLabelItem(
                    title: widget.data.name, icon: FontAwesomeIcons.tags,
                  ),
                  DefaultLabelItem(
                    title: widget.data.contents, icon: FontAwesomeIcons.question,
                  ),
                  (widget.data.answerOb?.contents).isNullOrWhiteSpace() ? Container():
                  DefaultLabelItem(
                    title: widget.data.answerOb?.contents, icon: FontAwesomeIcons.comment,
                  )
                ],
              ),
            )
        ),
      ],
    ),
  );
}