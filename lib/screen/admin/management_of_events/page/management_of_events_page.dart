import 'package:eportal/bloc/test/data_example_test_bloc.dart';
import 'package:eportal/model/api/request/common_new/data/work_search_data_request.dart';
import 'package:eportal/model/api/request/common_new/work_search_request.dart';
import 'package:eportal/screen/admin/management_of_events/widget/management_of_events_item.dart';
import 'package:eportal/screen/admin/management_of_events_add/page/management_of_events_add_page.dart';
import 'package:eportal/screen/admin/management_of_events_edit/page/management_of_events_edit_page.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/dialog/filter_job_dialog.dart';
import 'package:eportal/widget/expandable_fab/expandable_fab.dart';
import 'package:eportal/widget/input/search_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//
// Created by BlackRose on 05/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class ManagementOfEventsPage extends BasePage {
  const ManagementOfEventsPage({super.key});

  @override
  State<StatefulWidget> createState() => _ManagementOfEventsPageState();
}

class _ManagementOfEventsPageState
    extends BasePageStateActive<ManagementOfEventsPage> {
  TextEditingController textEditingController = TextEditingController();
  DataExampleTestEvent dataExampleTestEvent = DataExampleTestEvent(
      request: DataExampleTestRequest(obj: DataExampleTestDataRequest()));

  WorkSearchRequest request = WorkSearchRequest(obj: WorkSearchDataRequest());
  late DataExampleTestBloc dataExampleTestBloc;

  @override
  void initBloc() {
    dataExampleTestBloc = DataExampleTestBloc();
  }

  @override
  void initDataLoading() {
    // TODO: implement initDataLoading
    dataExampleTestEvent.request.obj.reloadData();
    callApi();
  }

  @override
  void disposeBloc() {
    dataExampleTestBloc.close();
  }

  @override
  void getMoreData() {
    // TODO: implement getMoreData
    dataExampleTestEvent.request.obj.nextData();
    callApi();
  }

  @override
  void callApi() {
    dataExampleTestBloc.add(dataExampleTestEvent);
  }

  @override
  bool isHasAppBar(BuildContext context) => false;
  final filterJobDialogKey = GlobalKey<FilterJobDialogState>();
  late FilterJobDialog filterJobDialog = FilterJobDialog(
    key: filterJobDialogKey,
    data: request.obj,
    onPressed: () => initDataLoading(),
  );

  @override
  Widget? getFloatingActionButton(BuildContext context) =>
      ExpandableFab(initNumberGroup: 1, children: [
        ActionButton(
          icon: const Icon(Icons.add, color: Colors.white),
          onPressed: () {
            nextPage((context) => ManagementOfEventsAddPage());
          },
        ),
      ]);

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
                create: (_) => dataExampleTestBloc,
                child: BlocListener<DataExampleTestBloc,
                    DataPageState<DataExampleTestDataResponse>>(
                  listener: (BuildContext context,
                      DataPageState<DataExampleTestDataResponse> state) {
                    print(state);
                  },
                  child: BlocBuilder<DataExampleTestBloc,
                      DataPageState<DataExampleTestDataResponse>>(
                    builder: (BuildContext context,
                            DataPageState<DataExampleTestDataResponse> state) =>
                        handleDataPageState<DataExampleTestDataResponse>(
                      state,
                      (context, state) => ListView.builder(
                          controller: scrollController,
                          shrinkWrap: true,
                          itemCount: state.length,
                          itemBuilder: (context, i) => ManagementOfEventsItem(
                                index: i,
                                onTapTop: () =>
                                    selectTopItem(state.elementAt(i)),
                                onTapEdit: () => nextPage(
                                    (context) => ManagementOfEventsEditPage()),
                                onTapDelete: () =>
                                    deleteItem(state.elementAt(i)),
                              )),
                    ),
                  ),
                )),
          ),
        ],
      );

  void deleteItem(DataExampleTestDataResponse item) {
    showAlertChoose(
        allow: () => delete(item),
        title: "Cảnh báo",
        desc: "Bạn chắc chắn muốn xoá dữ liệu này?");
  }

  delete(DataExampleTestDataResponse item) {
    showCenterMessage("Đã xoá dữ liệu thành công")
        .then((value) => initDataLoading());
  }

  selectTopItem(DataExampleTestDataResponse item) {
    showAlertChoose(
        allow: () => selectTop(item),
        title: "Cảnh báo",
        desc: "Bạn chắc chắn muốn cho lên top hiện thị?");
  }

  selectTop(DataExampleTestDataResponse item) {
    showCenterMessage("Đã cho lên top hiện thị thành công")
        .then((value) => initDataLoading());
  }
}
