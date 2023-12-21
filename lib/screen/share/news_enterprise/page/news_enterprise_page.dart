import 'package:eportal/model/api/request/common_new/data/home_business_list_data_request.dart';
import 'package:eportal/model/api/response/common_new/data/home_business_list_data_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/common_new/home_business_list_bloc.dart';
import '../../../../event/common_new/home_business_list_event.dart';
import '../../../../model/api/request/common_new/home_business_list_request.dart';
import '../../../../state/base/base_state.dart';
import '../../../../widget/base/base_page.dart';
import '../../../../widget/news/news_widget.dart';
import '../../empty_example/page/empty_example_page.dart';

//
// Created by BlackRose on 16/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class NewsEnterprisePage extends BasePage {
  NewsEnterprisePage({super.key});

  @override
  State<StatefulWidget> createState() => _NewsEnterprisePageState();
}

class _NewsEnterprisePageState extends BasePageState<NewsEnterprisePage> {
  late HomeBusinessListBloc homeBusinessListBloc;
  HomeBusinessListRequest request =
      HomeBusinessListRequest(obj: HomeBusinessListDataRequest());

  @override
  void initBloc() {
    homeBusinessListBloc = HomeBusinessListBloc();
  }

  @override
  void callApi() {
    // TODO: implement callApi
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    homeBusinessListBloc.close();
  }

  @override
  void getMoreData() {
    // TODO: implement getMoreData
  }

  @override
  void initDataLoading() {
    homeBusinessListBloc.add(HomeBusinessListEvent(request: request));
  }

  @override
  Widget pageUI(BuildContext context) => BlocProvider(
      create: (_) => homeBusinessListBloc,
      child: BlocListener<HomeBusinessListBloc,
          DataMultiState<HomeBusinessListDataResponse>>(
        listener: (BuildContext context,
            DataMultiState<HomeBusinessListDataResponse> state) {},
        child: BlocBuilder<HomeBusinessListBloc,
            DataMultiState<HomeBusinessListDataResponse>>(
          builder: (BuildContext context,
                  DataMultiState<HomeBusinessListDataResponse> state) =>
              handleDataMultiState<HomeBusinessListDataResponse>(
            state,
            (context, state) => ListView.builder(
                shrinkWrap: true,
                itemCount: state.length,
                itemBuilder: (context, i) => NewsWidget(
                      onTap: () => nextPage((context) => EmptyExamplePage(
                            isHasAppBar: true,
                          )),
                      title: state.elementAt(i).businessVn,
                      imageUrl: state.elementAt(i).logo,
                      content: state.elementAt(i).email,
                    )),
          ),
        ),
      ));

  @override
  getBottomNavigationBar(BuildContext context) => null;

  @override
  String getPageTitle(BuildContext context) => "Doanh nghiệp";
}
