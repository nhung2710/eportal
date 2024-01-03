//
// Created by BlackRose on 03/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//
import 'package:eportal/bloc/common_new/album_list_bloc.dart';
import 'package:eportal/bloc/common_new/home_business_list_bloc.dart';
import 'package:eportal/event/common_new/album_list_event.dart';
import 'package:eportal/event/common_new/home_business_list_event.dart';
import 'package:eportal/model/api/request/common_new/album_list_request.dart';
import 'package:eportal/model/api/request/common_new/data/album_list_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/home_business_list_data_request.dart';
import 'package:eportal/model/api/request/common_new/home_business_list_request.dart';
import 'package:eportal/model/api/response/common_new/data/home_business_list_data_response.dart';
import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/base/page_widget/base_page_widget.dart';
import 'package:eportal/page/share/enterprise/widget/enterprise_item.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EnterprisePage extends BasePageWidget {
  const EnterprisePage({super.key});

  @override
  State<StatefulWidget> createState() => EnterprisePageState();
}

class EnterprisePageState
    extends BasePageState<EnterprisePage> {
  late HomeBusinessListBloc homeBusinessListBloc;
  HomeBusinessListEvent homeBusinessListEvent = HomeBusinessListEvent(request: HomeBusinessListRequest(obj: HomeBusinessListDataRequest()));

  @override
  void initBloc() {
    homeBusinessListBloc = HomeBusinessListBloc();
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    homeBusinessListBloc.close();
  }


  @override
  void getMoreData() {
  }

  @override
  void initDataLoading() {
    callApi();
  }

  @override
  PreferredSizeWidget? getAppBar(BuildContext context) => defaultTabBar();
  @override
  void callApi() {
    homeBusinessListBloc.add(homeBusinessListEvent);
  }


  @override
  Widget pageUI(BuildContext context) => BlocProvider(
    create: (_) => homeBusinessListBloc,
    child: BlocListener<HomeBusinessListBloc,
        DataMultiState<HomeBusinessListDataResponse>>(
      listener: (BuildContext context, state) {},
      child: BlocBuilder<HomeBusinessListBloc,
          DataMultiState<HomeBusinessListDataResponse>>(
          builder: (BuildContext context,
              DataMultiState<HomeBusinessListDataResponse> state) =>
              handleDataMultiState(
                  state,
                      (context, state) => Container(
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            "Danh sách doanh nghiệp tuyển dụng",
                            style: AppTextStyle.titlePage.copyWith(
                                overflow: TextOverflow.visible,
                                fontSize: 18,
                                color: AppColor.colorOfIconActive),
                          ),
                        ),
                        Expanded(
                          child: ListView(
                              shrinkWrap: true,
                              children: state.map((e) => EnterpriseItem(
                                data: e,
                                onClickItem: (HomeBusinessListDataResponse value)  => {

                                },
                              )).toList(),
                          ),
                        ),
                      ],
                    ),
                  ))),
    ),
  );
}