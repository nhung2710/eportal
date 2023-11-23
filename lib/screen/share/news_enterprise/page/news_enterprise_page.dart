import 'package:eportal/model/api/request/common_new/data/home_business_list_data_request.dart';
import 'package:eportal/model/api/response/common_new/data/home_business_list_data_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/common_new/home_business_list_bloc.dart';
import '../../../../constant/application_constant.dart';
import '../../../../event/common_new/home_business_list_event.dart';
import '../../../../model/api/request/common_new/data/common_new_data_request.dart';
import '../../../../model/api/request/common_new/home_business_list_request.dart';
import '../../../../model/api/response/common_new/home_business_list_response.dart';
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
  HomeBusinessListBloc homeBusinessListBloc = HomeBusinessListBloc();

  @override
  void initDataLoading() {
    homeBusinessListBloc.add(HomeBusinessListEvent(
        request: HomeBusinessListRequest(obj: HomeBusinessListDataRequest())));
    super.initDataLoading();
  }

  @override
  Widget pageUI(BuildContext context) => BlocProvider(
      create: (_) => homeBusinessListBloc,
      child: BlocListener<HomeBusinessListBloc,
          DataState<List<HomeBusinessListDataResponse>>>(
        listener: (BuildContext context,
            DataState<List<HomeBusinessListDataResponse>> state) {},
        child: BlocBuilder<HomeBusinessListBloc,
            DataState<List<HomeBusinessListDataResponse>>>(
          builder: (BuildContext context,
                  DataState<List<HomeBusinessListDataResponse>> state) =>
              handleDataState<List<HomeBusinessListDataResponse>>(
            state,
            (context, state) => (state!.length ?? 0) == 0
                ? buildNotFoundData(context)
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: state!.length,
                    itemBuilder: (context, i) => NewsWidget(
                          onTap: () => nextPage((context) => EmptyExamplePage(
                                isHasAppBar: true,
                              )),
                          title: state!.elementAt(i).businessVn,
                          imageUrl: state!.elementAt(i).logo,
                          content: state!.elementAt(i).email,
                        )),
          ),
        ),
      ));

  @override
  getBottomNavigationBar(BuildContext context) => null;

  @override
  String getPageTitle(BuildContext context) => "Doanh nghiệp";
}
