import 'package:eportal/screen/share/answer_and_question/widget/answer_and_question_item.dart';
import 'package:eportal/screen/share/answer_and_question_add/page/answer_and_question_add_page.dart';
import 'package:eportal/screen/share/chat_bot/page/chat_bot_page.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/expandable_fab/expandable_fab.dart';
import 'package:flutter/material.dart';

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
  TextEditingController textEditingController = TextEditingController();

  @override
  bool isHasAppBar(BuildContext context) => false;

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
  Widget pageUI(BuildContext context) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.only(left: 5, top: 10, bottom: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    "Hỏi và đáp",
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    style: AppTextStyle.titlePage,
                  ),
                )),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 50,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) =>
                  AnswerAndQuestionItem(
                index: index,
                onTap: () {},
              ),
            )
          ],
        ),
      );
}
