import 'package:eportal/bloc/test/data_example_test_bloc.dart';
import 'package:eportal/model/api/request/common_new/data/work_search_data_request.dart';
import 'package:eportal/model/api/request/common_new/work_search_request.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/dialog/filter_job_dialog.dart';
import 'package:eportal/widget/expandable_fab/expandable_fab.dart';
import 'package:eportal/widget/full_data_item/profile_item.dart';
import 'package:eportal/widget/input/search_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../share/empty_example/page/empty_example_page.dart';

//
// Created by BlackRose on 05/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class ManagementOfNewsPage extends BasePage {
  const ManagementOfNewsPage({super.key});

  @override
  State<StatefulWidget> createState() => _ManagementOfNewsPageState();
}

class _ManagementOfNewsPageState
    extends BasePageStateActive<ManagementOfNewsPage> {
  TextEditingController textEditingController = TextEditingController();

  WorkSearchRequest request = WorkSearchRequest(obj: WorkSearchDataRequest());

  @override
  bool isHasAppBar(BuildContext context) => false;
  final filterJobDialogKey = GlobalKey<FilterJobDialogState>();
  late FilterJobDialog filterJobDialog = FilterJobDialog(
    key: filterJobDialogKey,
    data: request.obj,
    onPressed: () => initDataLoading(),
  );

  late DataExampleTestBloc dataExampleTestBloc;

  @override
  void initBloc() {
    dataExampleTestBloc = DataExampleTestBloc();
  }

  @override
  void initDataLoading() {
    // TODO: implement initDataLoading
    callApi();
  }

  @override
  void disposeBloc() {
    dataExampleTestBloc.close();
  }

  @override
  void getMoreData() {
    // TODO: implement getMoreData
  }

  @override
  void callApi() {
    dataExampleTestBloc.add(DataExampleTestEvent(
        request: DataExampleTestRequest(obj: DataExampleTestDataRequest())));
  }

  @override
  Widget? getFloatingActionButton(BuildContext context) =>
      ExpandableFab(initNumberGroup: 1, children: [
        ActionButton(
          icon: const Icon(Icons.add, color: Colors.white),
          onPressed: () {
            nextPage((context) => EmptyExamplePage(
                  isHasAppBar: true,
                ));
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
                    DataMultiState<DataExampleTestDataResponse>>(
                  listener: (BuildContext context,
                      DataMultiState<DataExampleTestDataResponse> state) {
                    print(state);
                  },
                  child: BlocBuilder<DataExampleTestBloc,
                      DataMultiState<DataExampleTestDataResponse>>(
                    builder: (BuildContext context,
                            DataMultiState<DataExampleTestDataResponse>
                                state) =>
                        handleDataMultiState<DataExampleTestDataResponse>(
                      state,
                      (context, state) => SingleChildScrollView(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.length,
                            itemBuilder: (context, i) => ProfileItem(
                                  onTap: () {
                                    nextPage((context) => EmptyExamplePage(
                                          isHasAppBar: true,
                                        ));
                                  },
                                  title: "Hồ sơ ${i + 1}",
                                  location: "Hà nội",
                                  status: "Chờ duyệt",
                                  experience: "Dưới 1 năm",
                                  salary: "5-7 triệu",
                                  fromDate: "01/11/2023",
                                  toDate: "01/11/2023",
                                  industry: "Bán hàng",
                                  numberView: "2",
                                  isShowFull: true,
                                )),
                      ),
                    ),
                  ),
                )),
          ),
        ],
      );
}
