//
// Created by BlackRose on 18/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:eportal/bloc/admin/work_view_list_bloc.dart';
import 'package:eportal/bloc/common_new/work_search_bloc.dart';
import 'package:eportal/event/admin/work_view_list_event.dart';
import 'package:eportal/event/common_new/work_search_event.dart';
import 'package:eportal/model/api/request/admin/data/work_view_list_data_request.dart';
import 'package:eportal/model/api/request/admin/work_view_list_request.dart';
import 'package:eportal/model/api/request/common_new/data/work_search_data_request.dart';
import 'package:eportal/model/api/request/common_new/work_search_request.dart';
import 'package:eportal/model/api/response/admin/data/work_view_list_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/work_search_data_response.dart';
import 'package:eportal/screen/share/work_search_detail/page/work_search_detail_page.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/dialog/filter_job_dialog.dart';
import 'package:eportal/widget/full_data_item/work_item.dart';
import 'package:eportal/widget/input/search_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListOfJobPage extends BasePage {
  const ListOfJobPage({super.key});

  @override
  State<StatefulWidget> createState() => _ListOfJobPageState();
}

class _ListOfJobPageState extends BasePageStateActive<ListOfJobPage> {
  late WorkSearchBloc workSearchBloc;
  WorkSearchRequest request = WorkSearchRequest(obj: WorkSearchDataRequest());
  final filterJobDialogKey = GlobalKey<FilterJobDialogState>();
  late FilterJobDialog filterJobDialog = FilterJobDialog(
    key: filterJobDialogKey,
    data: request.obj,
    onPressed: () => initDataLoading(),
  );
  TextEditingController textEditingController = TextEditingController();

  @override
  void initBloc() {
    workSearchBloc = WorkSearchBloc();
  }

  @override
  void initDataLoading() {
    request.obj.reloadData();
    callApi();
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    workSearchBloc.close();
  }
  @override
  void getMoreData() {
    request.obj.nextData();
    callApi();
  }

  @override
  void callApi() {
    request.obj.tuKhoa = textEditingController.text;
    workSearchBloc.add(WorkSearchEvent(request: request));
  }

  @override
  bool isHasAppBar(BuildContext context) => false;

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
                showDialog(context: context, builder: (_) => filterJobDialog);
              },
              hintText: "Nội dung tìm kiếm",
            ),
          ),
          Expanded(
            child: BlocProvider(
                create: (_) => workSearchBloc,
                child: BlocListener<WorkSearchBloc,
                    DataPageState<WorkSearchDataResponse>>(
                  listener: (BuildContext context,
                      DataPageState<WorkSearchDataResponse> state) {},
                  child: BlocBuilder<WorkSearchBloc,
                      DataPageState<WorkSearchDataResponse>>(
                    builder: (BuildContext context,
                            DataPageState<WorkSearchDataResponse> state) =>
                        handleDataPageState<WorkSearchDataResponse>(
                      state,
                      (context, state) => ListView.builder(
                          shrinkWrap: true,
                          controller: scrollController,
                          itemCount: state.length,
                          itemBuilder: (context, i) => WorkItem(
                                onTap: () =>
                                    nextPage((context) => WorkSearchDetailPage(
                                          id: state.elementAt(i).id,
                                        )),
                                title: state.elementAt(i).title,
                                ages: state.elementAt(i).ages,
                                benefit: state.elementAt(i).benefit,
                                workTime: state.elementAt(i).workTime,
                                tenTinhTP: state.elementAt(i).tenTinhTP,
                                soNamKinhNghiem:
                                    state.elementAt(i).soNamKinhNghiem,
                                hanNopHoSo: state.elementAt(i).hanNopHoSo,
                                description: state.elementAt(i).description,
                              )),
                    ),
                  ),
                )),
          ),
        ],
      );

}
