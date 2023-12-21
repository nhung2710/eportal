import 'dart:math';

import 'package:eportal/model/share/chat_bot/chat_bot_message.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:flutter/material.dart';

import '../../../../widget/input/search_input.dart';

//
// Created by BlackRose on 11/7/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class ChatBotPage extends BasePage {
  const ChatBotPage({super.key});

  @override
  State<StatefulWidget> createState() => _ChatBotPageState();
}

class _ChatBotPageState extends BasePageState<ChatBotPage> {
  TextEditingController textEditingController = TextEditingController();

  final List<ChatBotMessage> ChatBotMessages = [];

  @override
  void callApi() {
    // TODO: implement callApi
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
  }

  @override
  void getMoreData() {
    // TODO: implement getMoreData
  }

  @override
  void initBloc() {
    // TODO: implement initBloc
  }

  @override
  void initDataLoading() {
    // TODO: implement initDataLoading
  }

  @override
  double currentPadding(BuildContext context) => 0;

  @override
  Widget pageUI(BuildContext context) => Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(5),
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: ChatBotMessages.map((e) => _showInput(e)).toList(),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            color: Colors.white,
            child: SearchInput(
              controller: textEditingController,
              maxLength: 200,
              textInputAction: TextInputAction.done,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Vui lòng nhập nội dung muốn gửi';
                }
                return null;
              },
              onFieldSubmitted: (value) => _sendMessageAsync(context),
              onTap: () => _sendMessageAsync(context),
              icon: Icons.message,
              hintText: "Nội dung",
            ),
          )
        ],
      );

  @override
  getBottomNavigationBar(BuildContext context) => null;

  @override
  String getPageTitle(BuildContext context) => "Trợ lý ảo";

  _addMessage(ChatBotMessage chatBotMessage) {
    setState(() {
      ChatBotMessages.add(chatBotMessage);
    });
  }

  _sendMessageAsync(BuildContext context) {
    if (isValid()) {
      _addMessage(ChatBotMessage(
          isBot: false, message: textEditingController.text, title: "Tôi"));
      textEditingController.clear();
      _botSendMessageAsync(context);
    }
    scrollToEnd();
  }

  List<String> greetings = [
    "Hello!",
    "Hi there!",
    "Hey!",
    "Good morning!",
    "Good afternoon!",
    "Good evening!",
    "Howdy!",
    "What's up!",
    "Greetings!",
    "Salutations!",
    "How are you?",
    "What's new?",
    "How's it going!",
    "Nice to see you!",
    "Welcome!",
    "Hey, how's everything?",
    "Yo!",
    "Aloha!",
    "Hi, what's going on?",
    "Howdy, partner!"
  ];

  String getRandomGreeting() {
    Random random = Random();
    int index = random.nextInt(greetings.length);
    return greetings[index];
  }

  void _botSendMessageAsync(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1000))
        .then((value) => _addMessage(ChatBotMessage(
            isBot: true, message: getRandomGreeting(), title: "Bot")))
        .then((value) => scrollToEnd());
  }

  Widget _showInput(ChatBotMessage e) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          e.isBot ? Container() : Expanded(flex: 1, child: Container()),
          Expanded(
            flex: 4,
            child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: e.isBot ? Colors.blue : Colors.green,
                ),
                margin: const EdgeInsets.only(top: 8),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: e.isBot
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.end,
                  mainAxisAlignment:
                      e.isBot ? MainAxisAlignment.start : MainAxisAlignment.end,
                  children: [
                    Text(e.message,
                        style: AppTextStyle.titleAppbarPage.copyWith(
                            color: !e.isBot ? Colors.white : Colors.white,
                            overflow: TextOverflow.visible)),
                  ],
                )),
          ),
          !e.isBot ? Container() : Expanded(flex: 1, child: Container()),
        ],
      );
}
