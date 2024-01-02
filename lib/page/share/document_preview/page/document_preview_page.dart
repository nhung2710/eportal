//
// Created by BlackRose on 02/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//


import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:eportal/application/global_application.dart';
import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../../extension/string_extension.dart';
import '../../../base/page_widget/base_page_widget.dart';

class DocumentPreviewPage extends BasePageWidget {
  final String? url;

  const DocumentPreviewPage({super.key, required this.url});

  @override
  State<StatefulWidget> createState() => DocumentPreviewPageState();
}

class DocumentPreviewPageState extends BasePageState<DocumentPreviewPage> {
  TextEditingController textEditingController = TextEditingController();
  Future<File?>? path;


  @override
  void initDataLoading() {
    callApi();
  }

  @override
  void callApi() {
    // TODO: implement callApi
    path = downloadFilePdf();
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
  PreferredSizeWidget? getAppBar(BuildContext context) => defaultTabBar();
  @override
  Widget pageUI(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: const EdgeInsets.only(bottom: 10,left: 10,right: 10,top: 10),
        child: Text(
          "Xem văn bản pháp luật",
          style: AppTextStyle.titlePage.copyWith(
              overflow: TextOverflow.visible,
              fontSize: 18,
              color: AppColor.colorOfIconActive),
        ),
      ),
      Expanded(
        child: FutureBuilder(
          future: path,
          builder: (BuildContext context, AsyncSnapshot<File?> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (!snapshot.hasData) {
                return buildNotFoundData(context);
              } else {
                return SfPdfViewer.file(snapshot.data!);
              }
            } else {
              return buildScreenLoading(context);
            }
          },
        ),
      ),
    ],
  );

  Future<File?> downloadFilePdf() async {
    try {
      if(widget.url.isNullOrWhiteSpace()) return null;
      var _url = widget.url.getImageUrl();
      String fileName = "${md5.convert(utf8.encode(_url))}.pdf";
      final fullDirPath = '${GlobalApplication().dirPath}/download/pdf';
      final fullPath = '$fullDirPath/$fileName';
      Directory directory = Directory(fullDirPath);
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }
      File file = File(fullPath);
      if (await file.exists()) return file;
      var request = await HttpClient().getUrl(Uri.parse(_url));
      var response = await request.close();
      if (response.statusCode != 200) {
        return null;
      }
      var bytes = await consolidateHttpClientResponseBytes(response);
      await file.writeAsBytes(bytes);
      return file;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

}