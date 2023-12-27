//
// Created by BlackRose on 27/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/model/more_action_page_model.dart';
import 'package:eportal/page/share/change_user_info/page/change_user_info_page.dart';
import 'package:eportal/page/share/more_action/widget/group_more_action_item.dart';
import 'package:eportal/screen/share/change_password/page/change_password_page.dart';
import 'package:flutter/material.dart';

import '../../../base/page_widget/base_page_widget.dart';

class MoreActionPage extends BasePageWidget {
  const MoreActionPage({super.key});

  @override
  State<StatefulWidget> createState() => MoreActionPageState();
}

class MoreActionPageState extends BasePageState<MoreActionPage> {
  Map<String, List<MoreActionPageModel>> actions = <String, List<MoreActionPageModel>>{};

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
    // TODO: implement initBloc
    actions.clear();
    actions.putIfAbsent(
        "Thông tin",
            () => [
          MoreActionPageModel(
              icon: Icons.change_circle_outlined,
              title: "Đổi thông tin",
              builder: (context) => const ChangeUserInfoPage()),
          MoreActionPageModel(
              icon: Icons.password_sharp,
              title: "Đổi mật khẩu",
              builder: (context) => const ChangePasswordPage()),
        ]);
    actions.putIfAbsent(
        "Thông tin1",
            () => [
          MoreActionPageModel(
              icon: Icons.change_circle_outlined,
              title: "Đổi thông tin",
              builder: (context) => const ChangeUserInfoPage()),
          MoreActionPageModel(
              icon: Icons.password_sharp,
              title: "Đổi mật khẩu",
              builder: (context) => const ChangePasswordPage()),
        ]);
  }

  @override
  void initDataLoading() {
    // TODO: implement initDataLoading
    callApi();
  }

  @override
  Widget pageUI(BuildContext context) => Container(
    margin: const EdgeInsets.all(10),
    child: ListView.builder(
        itemCount: actions.length,
        itemBuilder: (c, index) {
          return GroupMoreActionItem(
            title: actions.keys.elementAt(index),
            items: actions.values.elementAt(index),
            onClickItem: (item) => nextPage(item.builder),
          );
        }),
  );
}
