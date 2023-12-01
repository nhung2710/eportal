import 'package:eportal/widget/base/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../../extension/string_extension.dart';

//
// Created by BlackRose on 01/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class TermsOfUsePage extends BasePage {
  const TermsOfUsePage({super.key});

  @override
  State<StatefulWidget> createState() => _TermsOfUsePageState();
}

class _TermsOfUsePageState extends BasePageState<TermsOfUsePage> {
  @override
  String getPageTitle(BuildContext context) => "Quy định sử dụng";
  late Future<String> _content;

  @override
  void initDataLoading() {
    _content = getContent();
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
      return await rootBundle.loadString('assets/texts/termsOfUse.txt');
    } catch (e) {
      // If encountering an error, return 0.
      print(e);
    }
    return "";
  }
}
