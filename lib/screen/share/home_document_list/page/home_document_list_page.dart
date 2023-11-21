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
  HomeDocumentListBloc homeDocumentListBloc = HomeDocumentListBloc();

  @override
  String getPageTitle(BuildContext context) {
    return "Văn bản pháp luật";
  }

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
            (context, state) => Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.data?.length ?? 0,
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
                                        imageUrl: state.data!
                                            .elementAt(i)
                                            .fileSource
                                            .getImageUrl(),
                                        imageBuilder: (BuildContext context,
                                            ImageProvider<Object>
                                                imageProvider) {
                                          return ClipRRect(
                                            borderRadius:
                                                const BorderRadius.all(
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          (state.data
                                                  ?.elementAt(i)
                                                  .documentName)
                                              .supportHtml(),
                                          style: AppTextStyle.titlePage
                                              .copyWith(
                                                  overflow:
                                                      TextOverflow.visible),
                                        ),
                                        Text(
                                          (state.data?.elementAt(i).contents)
                                              .supportHtml(),
                                          style: AppTextStyle.titleHintPage
                                              .copyWith(
                                                  overflow:
                                                      TextOverflow.visible),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                ),
              ],
            ),
          ),
        ),
      ));
}
