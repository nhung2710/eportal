//
// Created by BlackRose on 28/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../../extension/string_extension.dart';
import '../../../base/page_state/base_page_state.dart';
import '../../../base/page_widget/base_page_widget.dart';

class RulePage extends BasePageWidget {
  const RulePage({super.key});

  @override
  State<StatefulWidget> createState() => RulePageState();
}

class RulePageState extends BasePageState<RulePage> {
  late Future<String> _content;

  @override
  void initDataLoading() {}

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
    _content = getContent();
  }

  @override
  PreferredSizeWidget? getAppBar(BuildContext context) => defaultTabBar();
  @override
  Widget pageUI(BuildContext context) => SingleChildScrollView(
    child: FutureBuilder<String>(
        future: _content,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) =>
        snapshot.hasData
            ? Html(
          data: snapshot.data.replaceWhenNullOrWhiteSpace(),
          style: {
            '#': Style(
              fontSize: FontSize(16),
            ),
          },
        )
            : const CircularProgressIndicator()),
  );

  Future<String> getContent() async {
    try {
      return await rootBundle.loadString('assets/texts/termsOfUse.txt');
    } catch (e) {
      // If encountering an error, return 0.
      print(e);
    }
    return "";
  }
}