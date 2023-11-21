import 'package:eportal/model/api/request/common_new/data/common_new_data_request.dart';
import 'package:eportal/screen/share/empty_example/page/empty_example_page.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/show_full_info/show_full_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/common_new/home_job_user_list_bloc.dart';
import '../../../../constant/application_constant.dart';
import '../../../../event/common_new/home_job_user_list_event.dart';
import '../../../../model/api/request/common_new/home_job_user_list_request.dart';
import '../../../../model/api/response/common_new/home_job_user_list_response.dart';
import '../../../../widget/news/news_widget.dart';

//
// Created by BlackRose on 13/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class HomeJobUserListPreview extends BasePage {
  const HomeJobUserListPreview({super.key});

  @override
  State<StatefulWidget> createState() => _HomeJobUserListPreviewState();
}

class _HomeJobUserListPreviewState
    extends BasePageStateActive<HomeJobUserListPreview> {
  HomeJobUserListBloc homeJobUserListBloc = HomeJobUserListBloc();

  @override
  bool isHasAppBar(BuildContext context) => false;

  @override
  void initDataLoading() {
    homeJobUserListBloc.add(HomeJobUserListEvent(
        request: HomeJobUserListRequest(
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
      create: (_) => homeJobUserListBloc,
      child: BlocListener<HomeJobUserListBloc, BaseState>(
        listener: (BuildContext context, BaseState state) {},
        child: BlocBuilder<HomeJobUserListBloc, BaseState>(
          builder: (BuildContext context, BaseState state) =>
              handlerBaseState<HomeJobUserListResponse>(
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
                            title: state.data?.elementAt(i).education,
                            isHasImage: false,
                            content: state.data?.elementAt(i).tinhTP,
                          )),
                ),
                ShowFullInfo(
                  onTap: () => nextPage((context) => EmptyExamplePage(
                        isHasAppBar: true,
                      )),
                ),
              ],
            ),
          ),
        ),
      ));
}
