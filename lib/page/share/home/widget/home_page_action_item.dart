//
// Created by BlackRose on 02/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//
import 'dart:ffi';

import 'package:eportal/page/model/more_action_page_model.dart';
import 'package:eportal/page/share/home/widget/home_page_action_sub_item.dart';
import 'package:eportal/page/share/more_action/widget/group_more_action_sub_item.dart';
import 'package:eportal/page/widget/default_card_item.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_size_icon.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePageActionItem extends StatefulWidget{

  final MoreActionPageModel item;
  final List<MoreActionPageModel> items;
  final ValueChanged<MoreActionPageModel>? onClickItem;
  const HomePageActionItem({super.key,required this.item,required this.items,this.onClickItem});

  @override
  State<StatefulWidget> createState()  => HomePageActionItemState();

}

class HomePageActionItemState extends State<HomePageActionItem>{
  @override
  Widget build(BuildContext context) => DefaultCardItem(
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Row(
                children: [
                  Icon(widget.item.icon,
                    color: AppColor.colorOfIcon,
                    size: AppSizeIcon.sizeOfNormal,),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(child: Text(widget.item.title,textAlign: TextAlign.start,style: AppTextStyle.titlePage,)),
                ],
              )),
          Container(
            margin: const EdgeInsets.only(top: 5,bottom: 20),
            child: GridView.builder(
              itemCount: widget.items.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return HomePageActionSubItem(
                  item: widget.items.elementAt(index),
                  onClickItem: widget.onClickItem,

                );              },
              gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1,
            ),
            ),
          )
        ],
      ),
    ),
  );
}