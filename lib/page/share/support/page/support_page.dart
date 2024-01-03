//
// Created by BlackRose on 28/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/model/more_action_page_model.dart';
import 'package:eportal/page/share/more_action/widget/group_more_action_item.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../base/page_widget/base_page_widget.dart';

class SupportPage extends BasePageWidget {
  const SupportPage({super.key});

  @override
  State<StatefulWidget> createState() => SupportPageState();
}

class SupportPageState extends BasePageState<SupportPage> {
  List<MoreActionPageModel> actions = [];

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

    actions.add(MoreActionPageModel(icon: Icons.add,
        title: 'Doanh nghiệp',
        data: [
          MoreActionPageModel(
              icon: FontAwesomeIcons.phone,
              title: "02963.831.123",
              isHasRightIcon: false,
              function: () => launchHotline("02963831123")),
          MoreActionPageModel(
              icon: FontAwesomeIcons.envelope,
              title: "vieclamhoabinh@gmail.com",
              isHasRightIcon: false,
              function: () => launchEmail("vieclamhoabinh@gmail.com")),
        ],
        function: () {  }
    ));
    actions.add(MoreActionPageModel(icon: Icons.add,
        title: 'Người lao động',
        data: [
          MoreActionPageModel(
              icon: FontAwesomeIcons.phone,
              title: "02963.831.123",
              isHasRightIcon: false,
              function: () => launchHotline("02963831123")),
          MoreActionPageModel(
              icon: FontAwesomeIcons.envelope,
              title: "vieclamhoabinh@gmail.com",
              isHasRightIcon: false,
              function: () => launchEmail("vieclamhoabinh@gmail.com")),
        ],
        function: () {  }
    ));
  }

  @override
  void initDataLoading() {
    // TODO: implement initDataLoading
  }


  @override
  PreferredSizeWidget? getAppBar(BuildContext context) => defaultTabBar();
  @override
  Widget pageUI(BuildContext context) => Container(
    margin: const EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text(
            "Dịch vụ khách hàng",
            style: AppTextStyle.titlePage.copyWith(
                overflow: TextOverflow.visible,
                fontSize: 18,
                color: AppColor.colorOfIconActive),
          ),
        ),
        Expanded(
          child: ListView(
              children: actions.map((e) => GroupMoreActionItem(
                item: e,
                onClickItem: (item) => item.function(),
              )).toList()),
        ),
      ],
    ),
  );

  void launchHotline(String hotline) {
    launchUrl(Uri(scheme: 'tel', path: hotline));
  }

  void launchEmail(String email) {
    launchUrl(
        Uri(scheme: 'mailto', path: '${email}subject=Yêu cầu hỗ trợ&body='));
  }
}