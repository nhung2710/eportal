import 'package:eportal/widget/base/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../../extension/string_extension.dart';

//
// Created by BlackRose on 11/7/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class PolicyPage extends BasePage {
  const PolicyPage({super.key});

  @override
  State<StatefulWidget> createState() => _PolicyPageState();
}

class _PolicyPageState extends BasePageState<PolicyPage> {
  @override
  String getPageTitle(BuildContext context) => "Chính sách bảo mật";
  late Future<String> _content;

  @override
  void initDataLoading() {
  }

  @override
  void callApi() {
    // TODO: implement callApi
    _content = getContent();
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
      return await rootBundle.loadString('assets/texts/policy.txt');
    } catch (e) {
      // If encountering an error, return 0.
      print(e);
    }
    return "";
  }

}
