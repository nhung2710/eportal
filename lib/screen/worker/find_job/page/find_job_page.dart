import 'package:eportal/screen/share/chat_bot/page/chat_bot_page.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/expandable_fab/expandable_fab.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 11/9/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class FindJobPage extends BasePage {
  const FindJobPage({super.key});

  @override
  State<StatefulWidget> createState() => _FindJobPageState();
}

class _FindJobPageState extends BasePageStateActive<FindJobPage> {
  @override
  bool isHasAppBar(BuildContext context) => false;

  @override
  Widget? getFloatingActionButton(BuildContext context) =>
      ExpandableFab(initNumberGroup: 3, children: [
        ActionButton(
          icon: const Icon(Icons.app_registration, color: Colors.white),
          onPressed: () {
            loadDataDemo()
                .then((value) => nextPage((context) => const ChatBotPage()));
          },
        ),
        ActionButton(
          icon: const Icon(Icons.app_registration, color: Colors.white),
          onPressed: () {
            loadDataDemo()
                .then((value) => nextPage((context) => const ChatBotPage()));
          },
        ),
        ActionButton(
          icon: const Icon(Icons.app_registration, color: Colors.white),
          onPressed: () {
            loadDataDemo()
                .then((value) => nextPage((context) => const ChatBotPage()));
          },
        ),
      ]);

  @override
  double currentPadding(BuildContext context) => 5;

  @override
  Widget pageUI(BuildContext context) => SingleChildScrollView(
          child: Column(
        children: [
          Container(
              padding: const EdgeInsets.only(left: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.all(10),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Bạn muốn tìm việc",
                            style: AppTextStyle.titlePage),
                        Text(
                          "Ngành nghề - mức lương - trình độ - kinh nghiệm - giới tính",
                          style: AppTextStyle.titleHintPage,
                        ),
                      ],
                    ),
                  )),
                  const SizedBox(
                    width: 40,
                    height: 40,
                    child: Icon(
                      Icons.search,
                      color: Colors.green,
                    ),
                  ),
                ],
              )),
          ListView.builder(
              itemCount: 50,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.blue,
                    ),
                    height: 100,
                  ))
        ],
      ));
}
