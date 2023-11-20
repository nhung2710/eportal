import 'package:eportal/screen/share/chat_bot/page/chat_bot_page.dart';
import 'package:eportal/screen/share/empty_example/page/empty_example_page.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/expandable_fab/expandable_fab.dart';
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
  String getPageTitle(BuildContext context)  => "Lịch sử ứng tuyển";


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
                indicatorColor: Colors.blue,
                indicatorWeight: 1,
                tabs: [
                  Tab(
                    icon: Icon(
                      Icons.history,
                      size: 20,
                      color: Colors.blue,
                    ),
                  ),
                  Tab(
                    icon: Icon(Icons.work, size: 20, color: Colors.blue),
                  ),
                  Tab(
                    icon: Icon(Icons.remove_red_eye_outlined,
                        size: 20, color: Colors.blue),
                  ),
                  Tab(
                    icon: Icon(Icons.cloud_download_outlined,
                        size: 20, color: Colors.blue),
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
}
