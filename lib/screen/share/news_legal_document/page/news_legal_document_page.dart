import 'package:eportal/model/api/response/common_new/data/home_document_list_data_response.dart';
import 'package:eportal/screen/share/document_list_search/page/document_list_search_page.dart';
import 'package:eportal/screen/share/view_pdf/page/view_pdf_page.dart';
import 'package:eportal/widget/expandable_fab/expandable_fab.dart';
import 'package:eportal/widget/full_data_item/document_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/common_new/home_document_list_bloc.dart';
import '../../../../event/common_new/home_document_list_event.dart';
import '../../../../extension/string_extension.dart';
import '../../../../model/api/request/common_new/data/home_document_list_data_request.dart';
import '../../../../model/api/request/common_new/home_document_list_request.dart';
import '../../../../state/base/base_state.dart';
import '../../../../widget/base/base_page.dart';

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
  late HomeDocumentListBloc homeDocumentListBloc;
  HomeDocumentListRequest request =
      HomeDocumentListRequest(obj: HomeDocumentListDataRequest());

  @override
  void initBloc() {
    homeDocumentListBloc = HomeDocumentListBloc();
  }

  @override
  void callApi() {
    // TODO: implement callApi
    homeDocumentListBloc.add(HomeDocumentListEvent(request: request));
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
                nextPage((context) => const DocumentListSearchPage()),
          ),
        ],
      );

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
            (context, state) => ListView.builder(
                shrinkWrap: true,
                itemCount: state.length,
                itemBuilder: (context, i) => DocumentItem(
                      onTap: () => nextPage((context) => ViewPdfPage(
                            url: state.elementAt(i).fileSource.getImageUrl(),
                          )),
                      title: state.elementAt(i).documentName,
                      noCode: state.elementAt(i).noCode,
                      date: state.elementAt(i).effectDate.formatDateTimeApi(),
                      isShowFull: true,
                    )),
          ),
        ),
      ));

  @override
  getBottomNavigationBar(BuildContext context) => null;

  @override
  String getPageTitle(BuildContext context) => "Văn bản pháp luật";
}
