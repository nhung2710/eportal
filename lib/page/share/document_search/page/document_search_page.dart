//
// Created by BlackRose on 02/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//
import 'package:eportal/bloc/common_new/document_list_bloc.dart';
import 'package:eportal/event/common_new/document_list_event.dart';
import 'package:eportal/model/api/request/common_new/data/document_list_data_request.dart';
import 'package:eportal/model/api/request/common_new/document_list_request.dart';
import 'package:eportal/model/api/response/common_new/data/document_list_data_response.dart';
import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/base/page_widget/base_page_widget.dart';
import 'package:eportal/page/share/document_search/page/document_search_filter_page.dart';
import 'package:eportal/page/share/document_search/widget/document_search_item.dart';
import 'package:eportal/page/widget/default_search_form_field.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_size_icon.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../document_preview/page/document_preview_page.dart';


class DocumentSearchPage extends BasePageWidget {
  const DocumentSearchPage({super.key});

  @override
  State<StatefulWidget> createState() => DocumentSearchPageState();
}

class DocumentSearchPageState extends BasePageState<DocumentSearchPage> {
  late DocumentListBloc documentListBloc;
  DocumentListEvent documentListEvent = DocumentListEvent(request: DocumentListRequest(obj: DocumentListDataRequest()));
  TextEditingController textEditingController = TextEditingController();

  @override
  void initBloc() {
    documentListBloc = DocumentListBloc();
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    documentListBloc.close();
  }

  @override
  void initDataLoading() {
    documentListEvent.request.obj.reloadData();
    callApi();
  }

  @override
  void getMoreData() {
    documentListEvent.request.obj.nextData();
    callApi();
  }

  @override
  void callApi() {
    documentListEvent.request.obj.tuKhoa = textEditingController.text;
    documentListBloc.add(documentListEvent);
  }

  @override
  PreferredSizeWidget? getAppBar(BuildContext context) => AppBar(
    title: Text(
      getPageTitle(context),
      style: AppTextStyle.titleAppbarPage,
    ),
    backgroundColor: AppColor.colorOfIcon,
    automaticallyImplyLeading: true,
    centerTitle: true,
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: GestureDetector(
            onTap: () {
              nextPage((context) => DocumentSearchFilterPage(data:documentListEvent)).then((value) {
                if(value!=null) {
                  documentListEvent = value;
                  initDataLoading();
                }
              });
            },
            child: const Icon(
              FontAwesomeIcons.filter,
              color: Colors.white,
              size: AppSizeIcon.sizeOfNormal,
            ),
          ),
        ),
      )
    ],
  );



  @override
  Widget pageUI(BuildContext context) => Container(
    margin: const EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text(
            "Tìm kiếm tin tức tổng hợp",
            style: AppTextStyle.titlePage.copyWith(
                overflow: TextOverflow.visible,
                fontSize: 18,
                color: AppColor.colorOfIconActive),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 5, top: 5),
          color: Colors.white,
          child: DefaultSearchFormField(
            controller: textEditingController,
            icon: FontAwesomeIcons.magnifyingGlass,
            maxLength: 100,
            textInputAction: TextInputAction.send,
            onFieldSubmitted: (value) => initDataLoading(),
            hintText: "Nội dung tìm kiếm",
            labelText: "Nội dung tìm kiếm",
            helperText: "Ví dụ: abc",
          ),
        ),
        Expanded(
          child: BlocProvider(
              create: (_) => documentListBloc,
              child: BlocListener<DocumentListBloc,
                  DataPageState<DocumentListDataResponse>>(
                listener: (BuildContext context,
                    DataPageState<DocumentListDataResponse> state) {},
                child: BlocBuilder<DocumentListBloc,
                    DataPageState<DocumentListDataResponse>>(
                  builder: (BuildContext context,
                      DataPageState<DocumentListDataResponse> state) =>
                      handleDataPageState<DocumentListDataResponse>(
                        state,
                            (context, state) => ListView(
                            controller: scrollController,
                            shrinkWrap: true,
                            children: state.map((e) => DocumentSearchItem(data: e, onClickItem: (DocumentListDataResponse value) =>
                                nextPage((context) => DocumentPreviewPage(
                                   url: value.fileSource,
                                )))).toList()),
                      ),
                ),
              )),
        ),
      ],
    ),
  );


}