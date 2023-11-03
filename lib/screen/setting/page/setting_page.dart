import 'package:cached_network_image/cached_network_image.dart';
import 'package:eportal/constant/application_constant.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/image/image_loading.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../login/page/login_page.dart';

//
// Created by BlackRose on 11/3/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class SettingPage extends BasePage{
  const SettingPage({super.key});


  @override
  State<StatefulWidget> createState() => _SettingPageState();
}

class _SettingPageState extends BasePageState<SettingPage>{
  @override
  Widget pageUI(BuildContext context) =>Container(
    padding: const EdgeInsets.fromLTRB(8,0,8,0),
    color: Colors.black12,
    height: double.infinity,
    child: Column(
      children: [
        Container(
            color: Colors.white,
            margin: const EdgeInsets.only(top: 10,bottom: 10),
            padding: const EdgeInsets.only(left: 5),
            height: 60,
            child: Row(
              children: [
                ImageLoading(
                  imageUrl: 'https://via.placeholder.com/100',
                  imageBuilder: (context, imageProvider) { // you can access to imageProvider
                    return CircleAvatar( // or any widget that use imageProvider like (PhotoView)
                      backgroundImage: imageProvider,
                    );
                  },
                )
                ,
                const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 10),
                      child: Text("Trần Hữu Tùng"),
                    )
                )
              ],
            )
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    childAspectRatio: 4,
                    crossAxisCount: 1,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    children: ApplicationConstant.SETTING_MENU.map((item) {
                      return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              const Icon(Icons.account_circle_outlined,color: Colors.grey,),
                              Expanded(
                                flex: 1,
                                child: Container(
                                    margin: const EdgeInsets.only(right: 10,left: 10),
                                    child: Text("$item",textAlign: TextAlign.start,style: AppTextStyle.labelTitle.copyWith(color:Colors.blue))
                                ),
                              ),
                              const FaIcon(FontAwesomeIcons.angleRight,size: 20)
                            ],
                          )
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
            height: 50,
            width: double.infinity,
            margin: const EdgeInsets.only(top: 10,bottom: 10),
            child: ElevatedButton(
              child: const Text('Đăng nhập'),
              onPressed: () => _signInAsync(context),
            )
        ),
      ],
    ),
  );

  _signInAsync(BuildContext context) {
    Navigator.push(context,MaterialPageRoute(builder: (context) => const LoginPage()));

  }

}