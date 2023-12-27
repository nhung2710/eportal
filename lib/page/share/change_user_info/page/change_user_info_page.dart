//
// Created by BlackRose on 27/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:eportal/extension/color_extension.dart';
import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/base/page_widget/base_page_widget.dart';
import 'package:eportal/page/widget/default_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../../style/app_color.dart';
import '../../../../style/app_text_style.dart';

class ChangeUserInfoPage extends BasePageWidget {
  const ChangeUserInfoPage({super.key});

  @override
  State<StatefulWidget> createState() => ChangeUserInfoPageState();
}

class ChangeUserInfoPageState extends BasePageState<ChangeUserInfoPage> {

  @override
  void callApi() {
    // TODO: implement callApi
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
  }

  @override
  void getMoreData() {
    // TODO: implement getMoreData
  }

  @override
  void initBloc() {
  }

  @override
  void initDataLoading() {
    // TODO: implement initDataLoading
    callApi();
  }

  @override
  double currentPadding(BuildContext context)  => 10;

  @override
  PreferredSizeWidget? getAppBar(BuildContext context)  => defaultTabBar();
  @override
  Widget pageUI(BuildContext context) => ListView(
    children: [
      Text("Đổi thông tin tài khoản",style: AppTextStyle.titlePage.copyWith(overflow: TextOverflow.visible,fontSize: 18,color: AppColor.colorOfIconActive),),
      DefaultTextFormField(),
      DefaultTextFormField(),
      DefaultTextFormField(),
      DefaultTextFormField(),
      DefaultTextFormField(),
    ],
  );
}