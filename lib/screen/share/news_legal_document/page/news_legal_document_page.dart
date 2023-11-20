import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/common_new/home_document_list_bloc.dart';
import '../../../../constant/application_constant.dart';
import '../../../../event/common_new/home_document_list_event.dart';
import '../../../../model/api/request/common_new/data/common_new_data_request.dart';
import '../../../../model/api/request/common_new/home_document_list_request.dart';
import '../../../../model/api/response/common_new/home_document_list_response.dart';
import '../../../../state/base/base_state.dart';
import '../../../../widget/base/base_page.dart';
import '../../../../widget/news/news_widget.dart';
import '../../empty_example/page/empty_example_page.dart';

//
// Created by BlackRose on 16/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class NewsLegalDocumentPage extends BasePage {
  NewsLegalDocumentPage({super.key});

  @override
  State<StatefulWidget> createState() => _NewsLegalDocumentPageState();
}

class _NewsLegalDocumentPageState extends BasePageState<NewsLegalDocumentPage> {
  HomeDocumentListBloc homeDocumentListBloc = HomeDocumentListBloc();

  @override
  void initDataLoading() {
    homeDocumentListBloc.add(HomeDocumentListEvent(
        request: HomeDocumentListRequest(
            obj: CommonNewDataRequest(
                top: ApplicationConstant.NUMBER_FULL_ITEM))));
    super.initDataLoading();
  }

  @override
  Widget pageUI(BuildContext context) => BlocProvider(
      create: (_) => homeDocumentListBloc,
      child: BlocListener<HomeDocumentListBloc, BaseState>(
        listener: (BuildContext context, BaseState state) {},
        child: BlocBuilder<HomeDocumentListBloc, BaseState>(
          builder: (BuildContext context, BaseState state) =>
              handlerBaseState<HomeDocumentListResponse>(
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
                          title: state.data!.elementAt(i).documentName,
                          isHasImage: false,
                          content: state.data!.elementAt(i).contents,
                          time: state.data!.elementAt(i).effectDate,
                        )),
          ),
        ),
      ));

  @override
  getBottomNavigationBar(BuildContext context) => null;

  @override
  String getPageTitle(BuildContext context) => "Văn bản pháp luật";
}
