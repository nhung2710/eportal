import 'package:eportal/bloc/common_new/home_works_list_bloc.dart';
import 'package:eportal/event/common_new/home_works_list_event.dart';
import 'package:eportal/extension/string_extension.dart';
import 'package:eportal/model/api/request/common_new/data/common_new_data_request.dart';
import 'package:eportal/model/api/request/common_new/home_works_list_request.dart';
import 'package:eportal/model/api/response/common_new/home_works_list_response.dart';
import 'package:eportal/screen/share/empty_example/page/empty_example_page.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/show_full_info/show_full_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../../bloc/common_new/home_document_list_bloc.dart';
import '../../../../constant/application_constant.dart';
import '../../../../event/common_new/home_document_list_event.dart';
import '../../../../model/api/request/common_new/home_document_list_request.dart';
import '../../../../model/api/response/common_new/home_document_list_response.dart';
import '../../../../style/app_color.dart';
import '../../../../widget/image/image_loading.dart';
import '../../../../widget/news/news_widget.dart';
import '../../home_document_list/page/home_document_list_page.dart';

//
// Created by BlackRose on 13/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class HomeDocumentListPreview extends BasePage {
  const HomeDocumentListPreview({super.key});

  @override
  State<StatefulWidget> createState() => _HomeDocumentListPreviewState();
}

class _HomeDocumentListPreviewState
    extends BasePageStateActive<HomeDocumentListPreview> {
  HomeDocumentListBloc homeDocumentListBloc = HomeDocumentListBloc();

  @override
  bool isHasAppBar(BuildContext context) => false;

  @override
  void initDataLoading() {
    homeDocumentListBloc.add(HomeDocumentListEvent(
        request: HomeDocumentListRequest(
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
                      itemBuilder: (context, i) => NewsWidget(
                            onTap: () => nextPage((context) => EmptyExamplePage(
                                  isHasAppBar: true,
                                )),
                            title: state.data?.elementAt(i).documentName,
                            imageUrl: state.data?.elementAt(i).fileSource,
                            content: state.data?.elementAt(i).contents,
                          )),
                ),
                ShowFullInfo(
                  onTap: () =>
                      nextPage((context) => const HomeDocumentListPage()),
                ),
              ],
            ),
          ),
        ),
      ));
}
