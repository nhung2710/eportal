import 'package:eportal/bloc/admin/work_save_list_bloc.dart';
import 'package:eportal/event/admin/work_save_list_event.dart';
import 'package:eportal/model/api/request/admin/data/work_save_list_data_request.dart';
import 'package:eportal/model/api/request/admin/work_save_list_request.dart';
import 'package:eportal/model/api/response/admin/data/work_save_list_data_response.dart';
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

class ListOfJobSavedPage extends BasePage {
  const ListOfJobSavedPage({super.key});

  @override
  State<StatefulWidget> createState() => _ListOfJobSavedPageState();
}

class _ListOfJobSavedPageState extends BasePageStateActive<ListOfJobSavedPage> {
  late WorkSaveListBloc workSaveListBloc;
  WorkSaveListRequest request =
      WorkSaveListRequest(obj: WorkSaveListDataRequest());
  final filterJobDialogKey = GlobalKey<FilterJobDialogState>();
  TextEditingController textEditingController = TextEditingController();

  @override
  void initBloc() {
    workSaveListBloc = WorkSaveListBloc();
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    workSaveListBloc.close();
  }

  @override
  void initDataLoading() {
    request.obj.reloadData();
    callApi();
  }

  @override
  void getMoreData() {
    request.obj.nextData();
    callApi();
  }

  @override
  void callApi() {
    request.obj.tuKhoa = textEditingController.text;
    workSaveListBloc.add(WorkSaveListEvent(request: request));
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
              hintText: "Nội dung tìm kiếm",
            ),
          ),
          Expanded(
            child: BlocProvider(
                create: (_) => workSaveListBloc,
                child: BlocListener<WorkSaveListBloc,
                    DataPageState<WorkSaveListDataResponse>>(
                  listener: (BuildContext context,
                      DataPageState<WorkSaveListDataResponse> state) {},
                  child: BlocBuilder<WorkSaveListBloc,
                      DataPageState<WorkSaveListDataResponse>>(
                    builder: (BuildContext context,
                            DataPageState<WorkSaveListDataResponse> state) =>
                        handleDataPageState<WorkSaveListDataResponse>(
                      state,
                      (context, state) => ListView.builder(
                          shrinkWrap: true,
                          controller: scrollController,
                          itemCount: state.length,
                          itemBuilder: (context, i) => WorkItem(
                                onTap: () => {},
                                title: state.elementAt(i).search,
                                ages: state.elementAt(i).search,
                                benefit: state.elementAt(i).search,
                                workTime: state.elementAt(i).search,
                                tenTinhTP: state.elementAt(i).search,
                                soNamKinhNghiem: state.elementAt(i).search,
                                hanNopHoSo: state.elementAt(i).search,
                                description: state.elementAt(i).search,
                              )),
                    ),
                  ),
                )),
          ),
        ],
      );
}
