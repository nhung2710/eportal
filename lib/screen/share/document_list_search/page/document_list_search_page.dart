import 'package:eportal/bloc/common_new/document_list_bloc.dart';
import 'package:eportal/event/common_new/document_list_event.dart';
import 'package:eportal/model/api/request/common_new/data/document_list_data_request.dart';
import 'package:eportal/model/api/request/common_new/document_list_request.dart';
import 'package:eportal/model/api/response/common_new/data/document_list_data_response.dart';
import 'package:eportal/screen/share/view_pdf/page/view_pdf_page.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_elevation.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/dialog/filter_document_dialog.dart';
import 'package:eportal/widget/dialog/filter_job_dialog.dart';
import 'package:eportal/widget/full_data_item/document_item.dart';
import 'package:eportal/widget/input/search_input.dart';
import 'package:eportal/widget/show_full_info/show_full_info.dart';
import 'package:eportal/widget/text_icon/text_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../extension/string_extension.dart';
import '../../../../widget/full_data_item/full_data_item.dart';

//
// Created by BlackRose on 27/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class DocumentListSearchPage extends BasePage {
  const DocumentListSearchPage({super.key});

  @override
  State<StatefulWidget> createState() => _DocumentListSearchPageState();
}

class _DocumentListSearchPageState
    extends BasePageState<DocumentListSearchPage> {
  DocumentListBloc documentListBloc = DocumentListBloc();
  DocumentListRequest request =
      DocumentListRequest(obj: DocumentListDataRequest());
  final filterJobDialogKey = GlobalKey<FilterDocumentDialogState>();
  late FilterDocumentDialog filterDocumentDialog = FilterDocumentDialog(
    key: filterJobDialogKey,
    data: request.obj,
    onPressed: () => initDataLoading(),
  );
  TextEditingController textEditingController = TextEditingController();

  @override
  void initDataLoading() {
    request.obj.tuKhoa = textEditingController.text;
    request.obj.soTrangHienTai = 1;
    callApi();

    super.initDataLoading();
  }

  @override
  void getMoreData() {
    request.obj.soTrangHienTai++;
    callApi();
  }

  @override
  void callApi() {
    documentListBloc.add(DocumentListEvent(request: request));
  }

  @override
  Widget pageUI(BuildContext context) => Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 5, top: 5),
            color: Colors.white,
            child: SearchInput(
              controller: textEditingController,
              maxLength: 50,
              textInputAction: TextInputAction.send,
              onFieldSubmitted: (value) => initDataLoading(),
              icon: Icons.search,
              onTap: () {
                initDataLoading();
              },
              onTapFilter: () {
                showDialog(
                    context: context, builder: (_) => filterDocumentDialog);
              },
              hintText: "Nội dung tìm kiếm",
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
                      (context, state) => ListView.builder(
                          shrinkWrap: true,
                          controller: scrollController,
                          itemCount: state.length,
                          itemBuilder: (context, i) => DocumentItem(
                                onTap: () => nextPage((context) => ViewPdfPage(
                                      url: state
                                          .elementAt(i)
                                          .fileSource
                                          .getImageUrl(),
                                    )),
                                title: state.elementAt(i).documentName,
                                docUnitName: state.elementAt(i).docUnitName,
                                contents: state.elementAt(i).contents,
                                noCode: state.elementAt(i).noCode,
                                signerName: state.elementAt(i).signerName,
                                isShowFull: true,
                              )),
                    ),
                  ),
                )),
          ),
        ],
      );

  @override
  getBottomNavigationBar(BuildContext context) => null;

  @override
  String getPageTitle(BuildContext context) => "Tìm kiếm";
}
