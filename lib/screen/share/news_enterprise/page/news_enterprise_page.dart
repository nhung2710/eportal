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
        request: HomeBusinessListRequest(
            obj: CommonNewDataRequest(
                top: ApplicationConstant.NUMBER_FULL_ITEM))));
    super.initDataLoading();
  }

  @override
  Widget pageUI(BuildContext context) => BlocProvider(
      create: (_) => homeBusinessListBloc,
      child: BlocListener<HomeBusinessListBloc, BaseState>(
        listener: (BuildContext context, BaseState state) {},
        child: BlocBuilder<HomeBusinessListBloc, BaseState>(
          builder: (BuildContext context, BaseState state) =>
              handlerBaseState<HomeBusinessListResponse>(
            state,
            (context, state) => ListView.builder(
                shrinkWrap: true,
                itemCount: state.data?.length ?? 0,
                itemBuilder: (context, i) => NewsWidget(
                      onTap: () => nextPage((context) => EmptyExamplePage(
                            isHasAppBar: true,
                          )),
                      title: state.data?.elementAt(i).businessVn,
                      imageUrl: state.data?.elementAt(i).logo,
                      content: state.data?.elementAt(i).email,
                    )),
          ),
        ),
      ));

  @override
  getBottomNavigationBar(BuildContext context) => null;

  @override
  String getPageTitle(BuildContext context) => "Doanh nghiệp";
}
