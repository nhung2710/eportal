import 'package:eportal/model/api/response/common_new/data/home_document_list_data_response.dart';
import 'package:eportal/screen/share/view_pdf/page/view_pdf_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/common_new/home_document_list_bloc.dart';
import '../../../../constant/application_constant.dart';
import '../../../../event/common_new/home_document_list_event.dart';
import '../../../../extension/string_extension.dart';
import '../../../../model/api/request/common_new/data/common_new_data_request.dart';
import '../../../../model/api/request/common_new/home_document_list_request.dart';
import '../../../../model/api/response/common_new/home_document_list_response.dart';
import '../../../../state/base/base_state.dart';
import '../../../../widget/base/base_page.dart';
import '../../../../widget/news/news_widget.dart';

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
                itemBuilder: (context, i) => NewsWidget(
                      onTap: () => nextPage((context) => ViewPdfPage(
                            url: state.elementAt(i).fileSource.getImageUrl(),
                          )),
                      title: state.elementAt(i).documentName,
                      isHasImage: false,
                      content: state.elementAt(i).contents,
                      time: state.elementAt(i).effectDate,
                    )),
          ),
        ),
      ));

  @override
  getBottomNavigationBar(BuildContext context) => null;

  @override
  String getPageTitle(BuildContext context) => "Văn bản pháp luật";
}
