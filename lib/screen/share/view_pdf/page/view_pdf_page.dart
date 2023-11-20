import 'package:eportal/widget/base/base_page.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';

//
// Created by BlackRose on 20/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class ViewPdfPage extends BasePage {
  String url;

  ViewPdfPage({super.key, required this.url});

  @override
  State<StatefulWidget> createState() => _ViewPdfPageState();
}

class _ViewPdfPageState extends BasePageState<ViewPdfPage> {
  TextEditingController textEditingController = TextEditingController();

  @override
  String getPageTitle(BuildContext context) => "Xem tài liệu";

  @override
  Widget pageUI(BuildContext context) => Container();
}
