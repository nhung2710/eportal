import 'package:eportal/bloc/common_new/work_detail_bloc.dart';
import 'package:eportal/event/common_new/work_detail_event.dart';
import 'package:eportal/model/api/request/common_new/data/work_detail_data_request.dart';
import 'package:eportal/model/api/request/common_new/work_detail_request.dart';
import 'package:eportal/model/api/response/common_new/data/work_detail_data_response.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/button/phone_button.dart';
import 'package:eportal/widget/full_data_item/work_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../extension/string_extension.dart';
import '../../../../widget/button/email_button.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class WorkSearchDetailPage extends BasePage {
  String? id;

  WorkSearchDetailPage({
    super.key,
    this.id,
  });

  @override
  State<StatefulWidget> createState() => _WorkSearchDetailPageState();
}

class _WorkSearchDetailPageState extends BasePageState<WorkSearchDetailPage> {
  late WorkDetailBloc workDetailBloc;
  WorkDetailRequest request = WorkDetailRequest(obj: WorkDetailDataRequest());

  @override
  void initBloc() {
    workDetailBloc = WorkDetailBloc();
    request.obj.id = widget.id.replaceWhenNullOrWhiteSpace("0");
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    workDetailBloc.close();
  }

  @override
  void getMoreData() {
    // TODO: implement getMoreData
  }

  @override
  void initDataLoading() {
    callApi();
  }

  @override
  void callApi() {
    workDetailBloc.add(WorkDetailEvent(request: request));
  }

  @override
  Widget pageUI(BuildContext context) => BlocProvider(
      create: (_) => workDetailBloc,
      child:
          BlocListener<WorkDetailBloc, DataSingleState<WorkDetailDataResponse>>(
        listener: (BuildContext context,
            DataSingleState<WorkDetailDataResponse> state) {},
        child: BlocBuilder<WorkDetailBloc,
            DataSingleState<WorkDetailDataResponse>>(
          builder: (BuildContext context,
                  DataSingleState<WorkDetailDataResponse> state) =>
              handleDataSingleState<WorkDetailDataResponse>(
            state,
            (context, state) => SingleChildScrollView(
              child: Column(
                children: [
                  WorkItem(
                    title: state?.title,
                    ages: state?.ages,
                    benefit: state?.benefit,
                    workTime: state?.workTime,
                    tenTinhTP: state?.tenTinhTP,
                    soNamKinhNghiem: state?.soNamKinhNghiem,
                    hanNopHoSo: state?.hanNopHoSo,
                    description: state?.description,
                    requirement: state?.requirement,
                    requirementsProfile: state?.requirementsProfile,
                    contactUser: state?.contactUser,
                    contactAddress: state?.contactAddress,
                    isShowFull: true,
                  ),
                  PhoneButton(phone: state?.contactMobile),
                  EmailButton(email: state?.contactEmail),
                ],
              ),
            ),
          ),
        ),
      ));

  @override
  String getPageTitle(BuildContext context) => "Chi tiết  tuyển dụng";
}
