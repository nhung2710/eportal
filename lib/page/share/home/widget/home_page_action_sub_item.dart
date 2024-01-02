//
// Created by BlackRose on 02/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//
import 'package:eportal/page/model/more_action_page_model.dart';
import 'package:eportal/page/widget/default_card_item.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_size_icon.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePageActionSubItem extends StatelessWidget{
  final MoreActionPageModel item;
  final ValueChanged<MoreActionPageModel>? onClickItem;
  const HomePageActionSubItem({super.key,required this.item,this.onClickItem});


  @override
  Widget build(BuildContext context) => DefaultCardItem(
    onTap: (){
      if(onClickItem!=null){
        onClickItem!(item);
      }
    },
    child: Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(item.icon,
            color: AppColor.colorOfIcon,
            size: AppSizeIcon.sizeOfNormal*1.5,),
          Expanded(
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                child: Text(item.title,textAlign: TextAlign.center,maxLines: 2,style: AppTextStyle.normal.copyWith(color: AppColor.colorOfIcon),overflow: TextOverflow.visible)
            ),
          ),
        ],
      ),
    ),
  );

}