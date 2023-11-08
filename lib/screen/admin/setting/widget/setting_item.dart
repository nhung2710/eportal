import 'package:eportal/model/setting_page_model.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 11/8/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class SettingItem extends StatelessWidget{

  final SettingPageModel settingPageModel;
  final GestureTapCallback onTap;
  const SettingItem({super.key, required this.settingPageModel,required this.onTap});
  @override
  Widget build(BuildContext context)  => GestureDetector(
    onTap: onTap,
    child: Container(
        margin:  const EdgeInsets.only(top: 5,left: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Icon(settingPageModel.icon,color: Colors.blue,size: 20,),
            Expanded(
              flex: 1,
              child: Container(
                  margin: const EdgeInsets.only(right: 10,left: 10),
                  child: Text(settingPageModel.title,textAlign: TextAlign.start,style: AppTextStyle.title.copyWith(color:Colors.blue))
              ),
            ),
            const Icon(Icons.navigate_next_sharp,color: Colors.blue,size: 20,)
          ],
        )
    ),
  );
}