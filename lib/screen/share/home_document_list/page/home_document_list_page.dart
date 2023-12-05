import 'package:eportal/model/api/request/common_new/data/home_document_list_data_request.dart';
import 'package:eportal/model/api/response/common_new/data/home_document_list_data_response.dart';
import 'package:eportal/screen/share/document_list_search/page/document_list_search_page.dart';
import 'package:eportal/widget/expandable_fab/expandable_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/common_new/home_document_list_bloc.dart';
import '../../../../event/common_new/home_document_list_event.dart';
import '../../../../extension/string_extension.dart';
import '../../../../model/api/request/common_new/home_document_list_request.dart';
import '../../../../state/base/base_state.dart';
import '../../../../style/app_text_style.dart';
import '../../../../widget/base/base_page.dart';
import '../../../../widget/image/image_loading.dart';
import '../../empty_example/page/empty_example_page.dart';

//
// Created by BlackRose on 14/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class HomeDocumentListPage extends BasePage {
  const HomeDocumentListPage({super.key});

  @override
  State<StatefulWidget> createState() => _HomeDocumentListPageState();
}

class _HomeDocumentListPageState
    extends BasePageStateActive<HomeDocumentListPage> {
  late HomeDocumentListBloc homeDocumentListBloc;

  @override
  void initBloc() {
    homeDocumentListBloc = HomeDocumentListBloc();
  }

  @override
  String getPageTitle(BuildContext context) {
    return "Văn bản pháp luật";
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
  void initDataLoading() {
    homeDocumentListBloc.add(HomeDocumentListEvent(
        request: HomeDocumentListRequest(obj: HomeDocumentListDataRequest())));
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
                itemBuilder: (context, i) => GestureDetector(
                      onTap: () => nextPage((context) => EmptyExamplePage(
                            isHasAppBar: true,
                          )),
                      child: Container(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: ImageLoading(
                                  imageUrl: state
                                      .elementAt(i)
                                      .fileSource
                                      .getImageUrl(),
                                  imageBuilder: (BuildContext context,
                                      ImageProvider<Object> imageProvider) {
                                    return ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5.0)),
                                      child: Image(
                                        image: imageProvider,
                                        fit: BoxFit.fill,
                                      ),
                                    );
                                  },
                                )),
                            Expanded(
                              flex: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    (state.elementAt(i).documentName)
                                        .supportHtml(),
                                    style: AppTextStyle.titlePage.copyWith(
                                        overflow: TextOverflow.visible),
                                  ),
                                  Text(
                                    (state.elementAt(i).contents).supportHtml(),
                                    style: AppTextStyle.titleHintPage.copyWith(
                                        overflow: TextOverflow.visible),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
          ),
        ),
      ));
}
