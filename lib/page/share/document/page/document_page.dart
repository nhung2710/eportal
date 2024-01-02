//
// Created by BlackRose on 02/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//

import 'package:eportal/bloc/common_new/home_document_list_bloc.dart';
import 'package:eportal/model/api/response/common_new/data/home_document_list_data_response.dart';
import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/share/document/widget/document_item.dart';
import 'package:eportal/page/share/document_preview/page/document_preview_page.dart';
import 'package:eportal/page/share/document_search/page/document_search_page.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/expandable_fab/expandable_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../event/common_new/home_document_list_event.dart';
import '../../../../model/api/request/common_new/data/home_document_list_data_request.dart';
import '../../../../model/api/request/common_new/home_document_list_request.dart';
import '../../../base/page_widget/base_page_widget.dart';

class DocumentPage extends BasePageWidget {
  const DocumentPage({super.key});

  @override
  State<StatefulWidget> createState() => _DocumentPageState();
}

class _DocumentPageState extends BasePageState<DocumentPage> {
  late HomeDocumentListBloc homeDocumentListBloc;
  HomeDocumentListEvent homeDocumentListEvent =
  HomeDocumentListEvent(request: HomeDocumentListRequest(obj: HomeDocumentListDataRequest()));

  @override
  void initBloc() {
    homeDocumentListBloc = HomeDocumentListBloc();
  }

  @override
  void callApi() {
    // TODO: implement callApi
    homeDocumentListBloc.add(homeDocumentListEvent);
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    homeDocumentListBloc.close();
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
  Widget? getFloatingActionButton(BuildContext context) => ExpandableFab(
    children: [
      ActionButton(
        icon: const Icon(
          Icons.search,
          color: Colors.white,
        ),
        onPressed: () =>
            nextPage((context) => DocumentSearchPage()),
      ),
    ],
  );

  @override
  PreferredSizeWidget? getAppBar(BuildContext context) => defaultTabBar();
  @override
  Widget pageUI(BuildContext context) => BlocProvider(
      create: (_) => homeDocumentListBloc,
      child: BlocListener<HomeDocumentListBloc,
          DataMultiState<HomeDocumentListDataResponse>>(
        listener: (BuildContext context,
            DataMultiState<HomeDocumentListDataResponse> state) {},
        child: BlocBuilder<HomeDocumentListBloc,
            DataMultiState<HomeDocumentListDataResponse>>(
          builder: (BuildContext context,
              DataMultiState<HomeDocumentListDataResponse> state) =>
              handleDataMultiState<HomeDocumentListDataResponse>(
                state,
                    (context, state) => Container(
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              "Văn bản pháp luật",
                              style: AppTextStyle.titlePage.copyWith(
                                  overflow: TextOverflow.visible,
                                  fontSize: 18,
                                  color: AppColor.colorOfIconActive),
                            ),
                          ),
                          Expanded(
                            child: ListView(
                            shrinkWrap: true,
                            children: state.map((e) => DocumentItem(data: e,
                              onClickItem: (HomeDocumentListDataResponse value) =>nextPage((context) => DocumentPreviewPage(url: value.fileSource,)),
                            )).toList(),),
                          ),
                        ],
                      ),
                    ),
              ),
        ),
      ));

  @override
  getBottomNavigationBar(BuildContext context) => null;

  @override
  String getPageTitle(BuildContext context) => "Văn bản pháp luật";
}