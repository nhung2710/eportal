import 'package:eportal/application/global_application.dart';
import 'package:eportal/screen/anonymous/home/home_page.dart';
import 'package:eportal/screen/share/chat_bot/page/chat_bot_page.dart';
import 'package:eportal/screen/share/sign_in/page/sign_in_page.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/image/image_loading.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 11/6/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DefaultAppBar {
  static PreferredSizeWidget get(BuildContext context) => AppBar(
    backgroundColor: Colors.white,
    title: Row(
      children: [
        SizedBox(
            width: 40,
            height: 40,
            child: ImageLoading(
                imageUrl: 'https://via.placeholder.com/100',
                imageBuilder: (context, imageProvider) { // you can access to imageProvider
                  return CircleAvatar( // or any widget that use imageProvider like (PhotoView)
                    backgroundImage: imageProvider,
                  );
                }
            )
        ),
        Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(GlobalApplication().HelloUser(),style: AppTextStyle.labelTitleBold.copyWith(fontSize: 12,)),
                  Text(GlobalApplication().HelloMessage(),style: AppTextStyle.labelTitle.copyWith(fontSize: 12,color: Colors.black26),),
                ],
              ),
            )
        ),
      ],
    ),
    actions: [
      GlobalApplication().IsLogin ? IconButton(onPressed: () {
        GlobalApplication().SignOut();
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const HomePage()));
      }, icon: const Icon(Icons.logout),color: Colors.blue,) :
      IconButton(onPressed: ()
      {
        Navigator.push(context,MaterialPageRoute(builder: (context) => const SignInPage()));
      }, icon: const Icon(Icons.login,color: Colors.blue),)
    ],
    automaticallyImplyLeading: false,
  );
}