import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/common_new/home_news_list_bloc.dart';
import '../../../../constant/application_constant.dart';
import '../../../../event/common_new/home_news_list_event.dart';
import '../../../../model/api/request/common_new/data/common_new_data_request.dart';
import '../../../../model/api/request/common_new/home_news_list_request.dart';
import '../../../../model/api/response/common_new/home_news_list_response.dart';
import '../../../../state/base/base_state.dart';
import '../../../../widget/base/base_page.dart';
import '../../../../widget/news/news_widget.dart';
import '../../../../widget/show_full_info/show_full_info.dart';
import '../../empty_example/page/empty_example_page.dart';
import '../../home_news_list/page/home_news_list_page.dart';

//
// Created by BlackRose on 11/9/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class HomeNewsListPreview extends BasePage {
  int flag;

  HomeNewsListPreview({super.key, required this.flag});

  @override
  State<StatefulWidget> createState() => _HomeNewsListPreviewState();
}

class _HomeNewsListPreviewState
    extends BasePageStateActive<HomeNewsListPreview> {
  HomeNewsListBloc homeNewsListBloc = HomeNewsListBloc();

  @override
  bool isHasAppBar(BuildContext context) => false;

  @override
  void initDataLoading() {
    homeNewsListBloc.add(HomeNewsListEvent(
        request: HomeNewsListRequest(
            obj: CommonNewDataRequest(
                flag: widget.flag,
                top: ApplicationConstant.NUMBER_PREVIEW_ITEM))));
    super.initDataLoading();
  }

  @override
  Color currentBackgroundColor(BuildContext context) => Colors.transparent;

  @override
  double currentPadding(BuildContext context) => 0;

  @override
  Widget pageUI(BuildContext context) => BlocProvider(
      create: (_) => homeNewsListBloc,
      child: BlocListener<HomeNewsListBloc, BaseState>(
        listener: (BuildContext context, BaseState state) {},
        child: BlocBuilder<HomeNewsListBloc, BaseState>(
          builder: (BuildContext context, BaseState state) =>
              handlerBaseState<HomeNewsListResponse>(
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
                            title: state.data?.elementAt(i).title,
                            imageUrl: state.data?.elementAt(i).imagePath,
                            content: state.data?.elementAt(i).content,
                          )),
                ),
                ShowFullInfo(
                  onTap: () => nextPage(
                      (context) => HomeNewsListPage(flag: widget.flag)),
                ),
              ],
            ),
          ),
        ),
      ));
}
