//
// Created by BlackRose on 29/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:eportal/page/model/more_action_page_model.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_size_icon.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GroupMoreActionSubItem extends StatelessWidget{
  final MoreActionPageModel item;
  final ValueChanged<MoreActionPageModel>? onClickItem;
  const GroupMoreActionSubItem({super.key,required this.item,this.onClickItem});


  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    width: double.infinity,
    child: GestureDetector(
      onTap: (){
        if(onClickItem!=null){
          onClickItem!(item);
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(item.icon,
            color: AppColor.colorOfIcon,
            size: AppSizeIcon.sizeOfNormal,),
          Expanded(child:
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(item.title,textAlign: TextAlign.start,style: AppTextStyle.title,)
          )
          ),
          item.isHasRightIcon ? const Icon(FontAwesomeIcons.angleRight,
            color: AppColor.colorOfIcon,
            size: AppSizeIcon.sizeOfNormal,
          ) : Container()
        ],
      ),
    ),
  );

}