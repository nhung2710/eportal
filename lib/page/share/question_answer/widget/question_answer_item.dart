//
// Created by BlackRose on 28/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/api/response/common_new/data/faq_question_search_data_response.dart';
import 'package:eportal/page/model/more_action_page_model.dart';
import 'package:eportal/page/share/more_action/widget/group_more_action_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../extension/string_extension.dart';
import '../../../widget/default_card_item.dart';

class QuestionAnswerItem extends StatelessWidget {
  final ValueChanged<FaqQuestionSearchDataResponse> onClickItem;
  final FaqQuestionSearchDataResponse data;
  List<MoreActionPageModel> actions = [];
  QuestionAnswerItem({super.key,
    required this.onClickItem,
    required this.data,
  }){
    actions = [
      MoreActionPageModel(
          icon: FontAwesomeIcons.tags,
          title: data.name.supportHtml(),
          isHasRightIcon: false,
          function: () => onClickItem(data)),
      MoreActionPageModel(
          icon: FontAwesomeIcons.question,
          title: data.contents.supportHtml(),
          isHasRightIcon: false,
          function: () => onClickItem(data)),
    ];
    if(!(data.answerOb?.contents).isNullOrWhiteSpace()){
      actions.add(MoreActionPageModel(
          icon: FontAwesomeIcons.comment,
          title: data.answerOb!.contents.supportHtml(),
          isHasRightIcon: false,
          function: () => onClickItem(data)));
    }
  }

  @override
  Widget build(BuildContext context) => DefaultCardItem(
    onTap: () => onClickItem(data),
    child: Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: actions.map((e) => GroupMoreActionSubItem(
          onClickItem: (item) => item.function(),
          item: e,
        )).toList(),
      ),
    )
  );
}
