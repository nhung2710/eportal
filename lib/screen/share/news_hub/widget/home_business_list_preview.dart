import 'package:eportal/model/api/request/common_new/data/common_new_data_request.dart';
import 'package:eportal/screen/share/empty_example/page/empty_example_page.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/show_full_info/show_full_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/common_new/home_business_list_bloc.dart';
import '../../../../constant/application_constant.dart';
import '../../../../event/common_new/home_business_list_event.dart';
import '../../../../model/api/request/common_new/home_business_list_request.dart';
import '../../../../model/api/response/common_new/home_business_list_response.dart';
import '../../../../widget/news/news_widget.dart';
import '../../home_business_list/page/home_business_list_page.dart';

//
// Created by BlackRose on 13/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class HomeBusinessListPreview extends BasePage {
  const HomeBusinessListPreview({super.key});

  @override
  State<StatefulWidget> createState() => _HomeBusinessListPreviewState();
}

class _HomeBusinessListPreviewState
    extends BasePageStateActive<HomeBusinessListPreview> {
  HomeBusinessListBloc homeBusinessListBloc = HomeBusinessListBloc();

  @override
  bool isHasAppBar(BuildContext context) => false;

  @override
  void initDataLoading() {
    homeBusinessListBloc.add(HomeBusinessListEvent(
        request: HomeBusinessListRequest(
            obj: CommonNewDataRequest(
                top: ApplicationConstant.NUMBER_PREVIEW_ITEM))));
    super.initDataLoading();
  }

  @override
  Color currentBackgroundColor(BuildContext context) => Colors.transparent;

  @override
  double currentPadding(BuildContext context) => 0;

  @override
  Widget pageUI(BuildContext context) => BlocProvider(
      create: (_) => homeBusinessListBloc,
      child: BlocListener<HomeBusinessListBloc, BaseState>(
        listener: (BuildContext context, BaseState state) {},
        child: BlocBuilder<HomeBusinessListBloc, BaseState>(
          builder: (BuildContext context, BaseState state) =>
              handlerBaseState<HomeBusinessListResponse>(
            state,
            (context, state) => Column(
              children: [
                Expanded(
                  child: ListView.builder(
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
                ShowFullInfo(
                  onTap: () => nextPage(
                    (context) => HomeBusinessListPage(),
                  ),
                )
              ],
            ),
          ),
        ),
      ));
}
