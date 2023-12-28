//
// Created by BlackRose on 28/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:eportal/bloc/common_new/gioi_thieu_trung_tam_bloc.dart';
import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/base/page_widget/base_page_widget.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../../event/common_new/gioi_thieu_trung_tam_event.dart';
import '../../../../extension/string_extension.dart';
import '../../../../model/api/request/common_new/data/gioi_thieu_trung_tam_data_request.dart';
import '../../../../model/api/request/common_new/gioi_thieu_trung_tam_request.dart';

class AboutUsPage extends BasePageWidget {
  const AboutUsPage({super.key});

  @override
  State<StatefulWidget> createState() => AboutUsPageState();
}

class AboutUsPageState extends BasePageState<AboutUsPage> {
  late GioiThieuTrungTamBloc gioiThieuTrungTamBloc;
  GioiThieuTrungTamEvent gioiThieuTrungTamEvent = GioiThieuTrungTamEvent(request: GioiThieuTrungTamRequest(obj: GioiThieuTrungTamDataRequest(top: 1)));
  @override
  void initDataLoading() {
    callApi();
  }

  @override
  void callApi() {
    // TODO: implement callApi
    gioiThieuTrungTamBloc.add(gioiThieuTrungTamEvent);
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
  void initBloc() {
    // TODO: implement initBloc
    gioiThieuTrungTamBloc = GioiThieuTrungTamBloc();
  }

  @override
  PreferredSizeWidget? getAppBar(BuildContext context) => defaultTabBar();
  @override
  Widget pageUI(BuildContext context) =>  BlocProvider(
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
                    child: Column(
                      children: [
                        Html(
                          data: state.replaceWhenNullOrWhiteSpace(),
                          style: {
                            '#': Style(
                              fontSize: FontSize(16),
                            ),
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
        )),
  );

}