import 'dart:math';

import 'package:eportal/model/api/request/admin/data/work_search_by_user_name_data_request.dart';
import 'package:eportal/model/api/request/admin/work_search_by_user_name_request.dart';
import 'package:eportal/model/api/request/common_new/data/work_search_data_request.dart';
import 'package:eportal/model/api/request/common_new/work_search_request.dart';
import 'package:eportal/model/api/response/admin/data/work_search_by_user_name_data_response.dart';
import 'package:eportal/screen/employer/job_advertisement/dialog/filter_job_advertisement_dialog.dart';
import 'package:eportal/screen/employer/job_advertisement_add/page/job_advertisement_add_page.dart';
import 'package:eportal/screen/share/work_search_detail/page/work_search_detail_page.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/dialog/filter_job_dialog.dart';
import 'package:eportal/widget/expandable_fab/expandable_fab.dart';
import 'package:eportal/widget/full_data_item/profile_item.dart';
import 'package:eportal/widget/full_data_item/work_item.dart';
import 'package:eportal/widget/input/search_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/admin/work_search_by_user_name_bloc.dart';
import '../../../../event/admin/work_search_by_user_name_event.dart';
import '../../job_advertisement_edit/page/job_advertisement_edit_page.dart';

//
// Created by BlackRose on 04/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class JobAdvertisementPage extends BasePage {
  const JobAdvertisementPage({super.key});

  @override
  State<StatefulWidget> createState() => _JobAdvertisementPageState();
}

class _JobAdvertisementPageState
    extends BasePageStateActive<JobAdvertisementPage> {
  TextEditingController textEditingController = TextEditingController();
  late WorkSearchByUserNameBloc workSearchByUserNameBloc;

  WorkSearchByUserNameRequest request =
      WorkSearchByUserNameRequest(obj: WorkSearchByUserNameDataRequest());

  @override
  bool isHasAppBar(BuildContext context) => false;

  final filterJobDialogKey = GlobalKey<FilterJobDialogState>();
  late FilterJobAdvertisementDialog filterJobAdvertisementDialog =
      FilterJobAdvertisementDialog(
    key: filterJobDialogKey,
    data: request.obj,
    onPressed: () => initDataLoading(),
  );

  @override
  void initBloc() {
    workSearchByUserNameBloc = WorkSearchByUserNameBloc();
  }

  @override
  void callApi() {
    workSearchByUserNameBloc.add(WorkSearchByUserNameEvent(request: request));
  }

  @override
  void initDataLoading() {
    request.obj.soTrangHienTai = 1;
    callApi();
  }

  @override
  void getMoreData() {
    request.obj.soTrangHienTai++;
    callApi();
  }

  @override
  Widget? getFloatingActionButton(BuildContext context) =>
      ExpandableFab(initNumberGroup: 1, children: [
        ActionButton(
          icon: const Icon(Icons.add, color: Colors.white),
          onPressed: () {
            nextPage((context) => JobAdvertisementAddPage());
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
                showDialog(
                    context: context,
                    builder: (_) => filterJobAdvertisementDialog);
              },
              hintText: "Nội dung tìm kiếm",
            ),
          ),
          Expanded(
            child: BlocProvider(
              create: (_) => workSearchByUserNameBloc,
              child: BlocListener<WorkSearchByUserNameBloc,
                  DataPageState<WorkSearchByUserNameDataResponse>>(
                listener: (BuildContext context,
                    DataPageState<WorkSearchByUserNameDataResponse> state) {},
                child: BlocBuilder<WorkSearchByUserNameBloc,
                    DataPageState<WorkSearchByUserNameDataResponse>>(
                  builder: (BuildContext context,
                          DataPageState<WorkSearchByUserNameDataResponse>
                              state) =>
                      handleDataPageState<WorkSearchByUserNameDataResponse>(
                          state,
                          (context, state) => ListView.builder(
                              shrinkWrap: true,
                              controller: scrollController,
                              itemCount: state.length,
                              itemBuilder: (context, i) => WorkItem(
                                    onTap: () => nextPage(
                                        (context) => JobAdvertisementEditPage(
                                              data: state.elementAt(i),
                                            )),
                                    title: state.elementAt(i).search,
                                    ages: state.elementAt(i).search,
                                    benefit: state.elementAt(i).search,
                                    workTime: state.elementAt(i).search,
                                    tenTinhTP: state.elementAt(i).search,
                                    soNamKinhNghiem: state.elementAt(i).search,
                                    hanNopHoSo: state.elementAt(i).search,
                                    description: state.elementAt(i).search,
                                  ))),
                ),
              ),
            ),
          ),
        ],
      );
}
