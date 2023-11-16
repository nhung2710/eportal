import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/common_new/home_job_user_list_bloc.dart';
import '../../../../bloc/common_new/home_news_list_bloc.dart';
import '../../../../constant/application_constant.dart';
import '../../../../event/common_new/home_job_user_list_event.dart';
import '../../../../event/common_new/home_news_list_event.dart';
import '../../../../model/api/request/common_new/data/common_new_data_request.dart';
import '../../../../model/api/request/common_new/home_job_user_list_request.dart';
import '../../../../model/api/request/common_new/home_news_list_request.dart';
import '../../../../model/api/response/common_new/home_job_user_list_response.dart';
import '../../../../model/api/response/common_new/home_news_list_response.dart';
import '../../../../state/base/base_state.dart';
import '../../../../widget/base/base_page.dart';
import '../../../../widget/news/news_widget.dart';
import '../../empty_example/page/empty_example_page.dart';
import '../../home_news_list/page/home_news_list_page.dart';

//
// Created by BlackRose on 16/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class NewsCurriculumVitaePage extends BasePage {
  NewsCurriculumVitaePage({super.key});

  @override
  State<StatefulWidget> createState() => _NewsCurriculumVitaePageState();
}

class _NewsCurriculumVitaePageState
    extends BasePageState<NewsCurriculumVitaePage> {
  HomeJobUserListBloc homeJobUserListBloc = HomeJobUserListBloc();

  @override
  void initDataLoading() {
    homeJobUserListBloc.add(HomeJobUserListEvent(
        request: HomeJobUserListRequest(
            obj: CommonNewDataRequest(
                top: ApplicationConstant.NUMBER_FULL_ITEM))));
    super.initDataLoading();
  }

  @override
  Widget pageUI(BuildContext context) => BlocProvider(
      create: (_) => homeJobUserListBloc,
      child: BlocListener<HomeJobUserListBloc, BaseState>(
        listener: (BuildContext context, BaseState state) {},
        child: BlocBuilder<HomeJobUserListBloc, BaseState>(
          builder: (BuildContext context, BaseState state) =>
              handlerBaseState<HomeJobUserListResponse>(
            state,
            (context, state) => (state.data?.length ?? 0) == 0
                ? buildNotFoundData(context)
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.data!.length,
                    itemBuilder: (context, i) => NewsWidget(
                          onTap: () => nextPage((context) => EmptyExamplePage(
                                isHasAppBar: true,
                              )),
                          title: state.data!.elementAt(i).businessVn,
                          imageUrl: state.data!.elementAt(i).logo,
                          content: state.data!.elementAt(i).tinhTP,
                        )),
          ),
        ),
      ));

  @override
  getBottomNavigationBar(BuildContext context) => null;

  @override
  String getPageTitle(BuildContext context) => "Hồ sơ xin việc";
}
