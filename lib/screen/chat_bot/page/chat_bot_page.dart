import 'dart:math';

import 'package:eportal/constant/application_constant.dart';
import 'package:eportal/extension/string_extension.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/image/image_loading.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 05/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class ChatBotPage extends BasePage{
  const ChatBotPage({super.key});


  @override
  State<StatefulWidget> createState() => _ChatBotPageState();
}

class _ChatBotPageState extends BasePageState<ChatBotPage>{
  TextEditingController textEditingController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  List<ChatMessage> messages = [];

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
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: messages.map((e){
                switch(e.type){
                  case ChatMessageType.Bot:
                    return Row(

                      children: [
                        Expanded(
                          flex:3,
                          child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                              ),
                              margin: const EdgeInsets.only(top: 8),
                              padding: const EdgeInsets.only(top: 10,bottom: 10,left: 5, right: 5),
                              child: Column(
                                children: [
                                  Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.white,
                                      ),
                                      margin: const EdgeInsets.only(top: 8),
                                      padding: const EdgeInsets.all(5),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text("Bot chat"),
                                          Text(e.message),
                                        ],
                                      )
                                  )
                                ],
                              )
                          ),
                        ),
                        Expanded(
                          flex:1,
                          child: Container(),
                        ),
                      ],
                    );
                  case ChatMessageType.User:
                    return Row(
                      children: [
                        Expanded(
                          flex:1,
                          child: Container(),
                        ),
                        Expanded(
                          flex:3,
                          child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                              ),
                              margin: const EdgeInsets.only(top: 8),
                              padding: const EdgeInsets.only(top: 10,bottom: 10,left: 5, right: 5),
                              child: Column(
                                children: [
                                  Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.white,
                                      ),
                                      margin: const EdgeInsets.only(top: 8),
                                      padding: const EdgeInsets.all(5),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(e.message),
                                        ],
                                      )
                                  )
                                ],
                              )
                          ),
                        ),
                      ],
                    );
                    break;
                }
                return Container();
              }
              ).toList(),
            ),
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.all(5),
        color: Colors.white,
        child: TextFormField(
          controller: textEditingController,
          maxLength: 50,
          textInputAction: TextInputAction.send,
          validator: (text) {
            if (text == null || text.isEmpty) {
              return 'Vui lòng nhập nội dung muốn gửi';
            }
            return null;
          },
          onFieldSubmitted:  (value) => _sendMessageAsync(context),
          decoration: InputDecoration(
            border: const OutlineInputBorder(

            ),
            suffixIcon: IconButton(
              icon: const Icon(Icons.send,color: Colors.blue,),
              onPressed: () {
                _sendMessageAsync(context);
              },
            ),

            labelText: 'Nội dung',
            counterText: "",
          ),
        ),
      )
    ],
  );
  @override
  getBottomNavigationBar(BuildContext context) =>null;

  @override
  String getPageTitle(BuildContext context) => "Chat bot";

  _addMessage(String message,ChatMessageType type){
    setState(() {
      messages.add(ChatMessage(message: message,type: type));
    });
  }
  _sendMessageAsync(BuildContext context) {
    if(isValid()){
      _addMessage(textEditingController.text,ChatMessageType.User);
      textEditingController.clear();
      _botSendMessageAsync(context);
    }
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
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

    _addMessage(getRandomGreeting(),ChatMessageType.Bot);

  }

}
enum ChatMessageType{
  Bot,
  User
}
class ChatMessage{
  String message;
  ChatMessageType type;
  ChatMessage({required this.message,required this.type});
}