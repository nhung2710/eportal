

//
// Created by BlackRose on 08/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//

import 'package:eportal/bloc/common_new/dang_nhap_bloc.dart';
import 'package:eportal/event/common_new/dang_nhap_event.dart';
import 'package:eportal/model/api/request/common_new/dang_nhap_request.dart';
import 'package:eportal/model/api/request/common_new/data/dang_nhap_data_request.dart';
import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/base/page_widget/base_page_widget.dart';
import 'package:flutter/material.dart';

class RegisterForJobReferralConsultationPage extends BasePageWidget {

  const RegisterForJobReferralConsultationPage({super.key});

  @override
  State<StatefulWidget> createState() => RegisterForJobReferralConsultationPageState();
}

class RegisterForJobReferralConsultationPageState extends BasePageState<RegisterForJobReferralConsultationPage> {

  late DangNhapBloc dangNhapBloc;
  DangNhapEvent dangNhapEvent =
  DangNhapEvent(request: DangNhapRequest(obj: DangNhapDataRequest()));

  @override
  void initDataLoading() {
    callApi();
  }

  @override
  void callApi() {
    // TODO: implement callApi
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    dangNhapBloc.close();
  }

  @override
  void getMoreData() {
    // TODO: implement getMoreData
  }

  @override
  void initBloc() {
    // TODO: implement initBloc
    dangNhapBloc = DangNhapBloc();
  }

  @override
  PreferredSizeWidget? getAppBar(BuildContext context) => defaultTabBar();
  @override
  Widget pageUI(BuildContext context) => Container(
    color: Colors.redAccent,
  );

}