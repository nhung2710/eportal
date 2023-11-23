import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../../extension/string_extension.dart';

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
  Future<File?>? path;

  @override
  String getPageTitle(BuildContext context) => "Xem tài liệu";

  @override
  void initDataLoading() {
    widget.url = widget.url.getImageUrl();
    widget.url =
        'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf';
    path = downloadFilePdf();
    super.initDataLoading();
  }

  @override
  Widget pageUI(BuildContext context) => FutureBuilder(
        future: path,
        builder: (BuildContext context, AsyncSnapshot<File?> snapshot) {
          if (snapshot.data == null) {
            return buildNotFoundData(context);
          } else {
            return SfPdfViewer.file(snapshot.data!);
          }
        },
      );

  Future<File?> downloadFilePdf() async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      String fileName = "${md5.convert(utf8.encode(widget.url))}.pdf";
      final fullDirPath = '${dir.path}/download/pdf';
      final fullPath = '$fullDirPath/$fileName';
      Directory directory = Directory(fullDirPath);
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }
      File file = File(fullPath);
      if (await file.exists()) return file;
      var request = await HttpClient().getUrl(Uri.parse(widget.url));
      var response = await request.close();
      var bytes = await consolidateHttpClientResponseBytes(response);
      await file.writeAsBytes(bytes);
      return file;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
}
