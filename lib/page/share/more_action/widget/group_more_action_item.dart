//
// Created by BlackRose on 27/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/page/model/more_action_page_model.dart';
import 'package:eportal/page/share/more_action/widget/group_more_action_sub_item.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_size_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../style/app_text_style.dart';
import '../../../widget/default_card_item.dart';

class GroupMoreActionItem extends StatefulWidget{
  final String title;
  final List<MoreActionPageModel> items;
  final ValueChanged<MoreActionPageModel>? onClickItem;
  const GroupMoreActionItem({super.key,required this.title,required this.items,this.onClickItem});

  @override
  State<StatefulWidget> createState() => GroupMoreActionItemState();

}

class GroupMoreActionItemState extends State<GroupMoreActionItem> {
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.max,
    children: [
      Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(widget.title,textAlign: TextAlign.start,style: AppTextStyle.titlePage,)),
      Container(
        margin: const EdgeInsets.only(top: 5,bottom: 20),
        child: DefaultCardItem(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            child: ListView.builder(
              itemCount: widget.items.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return GroupMoreActionSubItem(
                  item: widget.items.elementAt(index),
                  onClickItem: widget.onClickItem,

                );
              },
            ),
          ),
        ),
      )
    ],
  );
}