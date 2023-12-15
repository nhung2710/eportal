import 'package:eportal/bloc/admin/work_view_list_bloc.dart';
import 'package:eportal/bloc/admin/work_view_list_bloc.dart';
import 'package:eportal/bloc/admin/work_view_list_bloc.dart';
import 'package:eportal/bloc/admin/work_view_list_bloc.dart';
import 'package:eportal/bloc/admin/work_view_list_bloc.dart';
import 'package:eportal/bloc/admin/work_view_list_bloc.dart';
import 'package:eportal/bloc/common_new/work_search_bloc.dart';
import 'package:eportal/event/common_new/work_search_event.dart';
import 'package:eportal/model/api/request/admin/data/work_view_list_data_request.dart';
import 'package:eportal/model/api/request/admin/work_view_list_request.dart';
import 'package:eportal/model/api/request/common_new/data/work_search_data_request.dart';
import 'package:eportal/model/api/request/common_new/work_search_request.dart';
import 'package:eportal/model/api/response/common_new/data/work_search_data_response.dart';
import 'package:eportal/screen/share/work_search_detail/page/work_search_detail_page.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/dialog/filter_job_dialog.dart';
import 'package:eportal/widget/full_data_item/work_item.dart';
import 'package:eportal/widget/input/search_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//
// Created by BlackRose on 04/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class ListOfJobPage extends BasePage {
  const ListOfJobPage({super.key});

  @override
  State<StatefulWidget> createState() => _ListOfJobPageState();
}

class _ListOfJobPageState extends BasePageStateActive<ListOfJobPage> {
  late WorkViewListBloc WorkViewListBloc;
  WorkViewListRequest request =
      WorkViewListRequest(obj: WorkViewListDataRequest());
  final filterJobDialogKey = GlobalKey<FilterJobDialogState>();
  late FilterJobDialog filterJobDialog = FilterJobDialog(
    key: filterJobDialogKey,
    data: request.obj,
    onPressed: () => initDataLoading(),
  );
  TextEditingController textEditingController = TextEditingController();

  @override
  void initBloc() {
    WorkViewListBloc = WorkViewListBloc();
  }

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
    WorkViewListBloc.add(WorkViewListEvent(request: request));
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
                create: (_) => WorkViewListBloc,
                child: BlocListener<WorkViewListBloc,
                    DataPageState<WorkViewListDataResponse>>(
                  listener: (BuildContext context,
                      DataPageState<WorkViewListDataResponse> state) {},
                  child: BlocBuilder<WorkViewListBloc,
                      DataPageState<WorkViewListDataResponse>>(
                    builder: (BuildContext context,
                            DataPageState<WorkViewListDataResponse> state) =>
                        handleDataPageState<WorkViewListDataResponse>(
                      state,
                      (context, state) => ListView.builder(
                          shrinkWrap: true,
                          controller: scrollController,
                          itemCount: state.length,
                          itemBuilder: (context, i) => WorkItem(
                                onTap: () => nextPage(
                                    (context) => WorkViewListDetailPage(
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
