import 'package:eportal/application/global_application.dart';
import 'package:eportal/constant/application_constant.dart';
import 'package:eportal/screen/dashboard/page/dashboard_page.dart';
import 'package:eportal/screen/login/page/login_page.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/image/image_loading.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//
// Created by BlackRose on 05/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class SettingBusinessPage extends BasePage{
  const SettingBusinessPage({super.key});


  @override
  State<StatefulWidget> createState() => _SettingBusinessPageState();
}

class _SettingBusinessPageState extends BasePageState<SettingBusinessPage>{
  @override
  bool isHasAppBar(BuildContext context) => false;
  @override
  Widget pageUI(BuildContext context) =>Column(
    children: [
      Expanded(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GridView.count(
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
            ],
          ),
        ),
      ),
    ],
  );

}