//
// Created by BlackRose on 04/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//

import 'package:eportal/model/api/response/admin/data/job_user_list_by_user_name_data_response.dart';
import 'package:eportal/page/widget/default_card_item.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_size_icon.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../extension/string_extension.dart';

class UserProfileItem extends StatelessWidget{
  final JobUserListByUserNameDataResponse data;
  final ValueChanged<JobUserListByUserNameDataResponse> onClickItem;

  const UserProfileItem({super.key,required this.data,required this.onClickItem});
  @override
  Widget build(BuildContext context) => DefaultCardItem(
    onTap: ()=> onClickItem(data),
    child: Container(
      margin: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
              child: Row(
                children: [
                  const Icon(FontAwesomeIcons.tag,
                    color: AppColor.colorOfIcon,
                    size: AppSizeIcon.sizeOfNormal,),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(child: Text(data.title.supportHtml(),style: AppTextStyle.titlePage.copyWith(),maxLines: 1,textAlign: TextAlign.start,)),
                ],
              )
          ),
          Divider(
            height: 20,
            color: Colors.grey.withOpacity(0.5),
          ),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
              child: Text('${data.education.supportHtml()}\n',style: AppTextStyle.title.copyWith(color: Colors.brown,fontWeight: FontWeight.bold),maxLines: 2,textAlign: TextAlign.start,)
          ),
          Divider(
            height: 20,
            color: Colors.grey.withOpacity(0.5),
          ),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
              child: Text('${data.skillsForte.supportHtml()}\n',style: AppTextStyle.title.copyWith(color: Colors.orange,fontWeight: FontWeight.bold),maxLines: 2,textAlign: TextAlign.start,)
          ),
          Divider(
            height: 20,
            color: Colors.grey.withOpacity(0.5),
          ),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
              child: Text('${data.workExperience.supportHtml()}\n',style: AppTextStyle.title.copyWith(color: Colors.blueAccent,fontWeight: FontWeight.bold),maxLines: 2,textAlign: TextAlign.start,)
          ),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Text("${data.startDate.formatDateTimeApi()} - ${data.endDate.formatDateTimeApi()}",style: AppTextStyle.normalChild1.copyWith(color: Colors.red),maxLines: 2,textAlign: TextAlign.end,))
          )
        ],
      ),
    ),
  );
}