import 'package:eportal/bloc/common_new/gioi_thieu_trung_tam_bloc.dart';
import 'package:eportal/event/common_new/gioi_thieu_trung_tam_event.dart';
import 'package:eportal/extension/string_extension.dart';
import 'package:eportal/model/api/request/common_new/gioi_thieu_trung_tam_request.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../../model/api/request/common_new/data/gioi_thieu_trung_tam_data_request.dart';

//
// Created by BlackRose on 11/7/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class AboutPage extends BasePage {
  const AboutPage({super.key});

  @override
  State<StatefulWidget> createState() => _AboutPageState();
}

class _AboutPageState extends BasePageState<AboutPage> {
  late GioiThieuTrungTamBloc gioiThieuTrungTamBloc;

  @override
  void initBloc() {
    gioiThieuTrungTamBloc = GioiThieuTrungTamBloc();
  }

  @override
  void initDataLoading() {
    callApi();
  }
  @override
  void callApi() {
    gioiThieuTrungTamBloc.add(GioiThieuTrungTamEvent(
        request: GioiThieuTrungTamRequest(
            obj: GioiThieuTrungTamDataRequest(top: 1))));
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    gioiThieuTrungTamBloc.close();
  }

  @override
  void getMoreData() {
    // TODO: implement getMoreData
  }

  @override
  String getPageTitle(BuildContext context) => "Giới thiệu";

  @override
  Color currentBackgroundColor(BuildContext context) => Colors.white;

  @override
  Widget pageUI(BuildContext context) => BlocProvider(
        create: (_) => gioiThieuTrungTamBloc,
        child: BlocListener<GioiThieuTrungTamBloc, DataSingleState<String>>(
            listener: (BuildContext context, DataSingleState<String> state) {},
            child: BlocBuilder<GioiThieuTrungTamBloc, DataSingleState<String>>(
              builder: (BuildContext context, DataSingleState<String> state) =>
                  handleDataSingleState<String>(
                state,
                (context, state) => SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.only(top: 10),
                    child: Html(
                      data: state.replaceWhenNullOrWhiteSpace(),
                      style: {
                        '#': Style(
                          fontSize: FontSize(16),
                        ),
                      },
                    ),
                  ),
                ),
              ),
            )),
      );

}
