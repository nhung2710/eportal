import 'package:eportal/screen/share/empty_example/page/empty_example_page.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 11/9/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class HistoryPage extends BasePage {
  const HistoryPage({super.key});

  @override
  State<StatefulWidget> createState() => _HistoryPageState();
}

class _HistoryPageState extends BasePageState<HistoryPage> {
  @override
  String getPageTitle(BuildContext context) => "Lịch sử ứng tuyển";

  @override
  double currentPadding(BuildContext context) => 0;

  @override
  Widget pageUI(BuildContext context) => DefaultTabController(
        key: localKey,
        length: 4,
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: const TabBar(
                indicatorColor: AppColor.colorOfIcon,
                indicatorWeight: 1,
                tabs: [
                  Tab(
                    icon: Icon(
                      Icons.history,
                      size: 20,
                      color: AppColor.colorOfIcon,
                    ),
                  ),
                  Tab(
                    icon:
                        Icon(Icons.work, size: 20, color: AppColor.colorOfIcon),
                  ),
                  Tab(
                    icon: Icon(Icons.remove_red_eye_outlined,
                        size: 20, color: AppColor.colorOfIcon),
                  ),
                  Tab(
                    icon: Icon(Icons.cloud_download_outlined,
                        size: 20, color: AppColor.colorOfIcon),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  EmptyExamplePage(),
                  EmptyExamplePage(),
                  EmptyExamplePage(),
                  EmptyExamplePage(),
                ],
              ),
            )
          ],
        ),
      );

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
  }

  @override
  void initDataLoading() {
    // TODO: implement initDataLoading
  }
}
