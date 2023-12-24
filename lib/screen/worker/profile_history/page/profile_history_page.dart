//
// Created by BlackRose on 12/24/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:eportal/bloc/admin/job_user_history_list_bloc.dart';
import 'package:eportal/model/api/response/admin/data/job_user_history_list_data_response.dart';
import 'package:eportal/model/api/response/admin/data/job_user_list_by_user_name_data_response.dart';
import 'package:eportal/screen/worker/profile_history/widget/profile_history_item.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../event/admin/job_user_history_list_event.dart';
import '../../../../model/api/request/admin/data/job_user_history_list_data_request.dart';
import '../../../../model/api/request/admin/job_user_history_list_request.dart';

class ProfileHistoryPage extends BasePage {
  JobUserListByUserNameDataResponse data;

  ProfileHistoryPage({super.key, required this.data});

  @override
  State<StatefulWidget> createState() => _ProfileHistoryPageState();
}

class _ProfileHistoryPageState extends BasePageStateActive<ProfileHistoryPage> {
  late JobUserHistoryListBloc jobUserHistoryListBloc;
  JobUserHistoryListEvent jobUserHistoryListEvent = JobUserHistoryListEvent(
      request: JobUserHistoryListRequest(obj: JobUserHistoryListDataRequest()));

  @override
  void initBloc() {
    jobUserHistoryListBloc = JobUserHistoryListBloc();
    jobUserHistoryListEvent.request.obj.jobUserID = widget.data.jobUserID;
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    jobUserHistoryListBloc.close();
  }

  @override
  void getMoreData() {
    // TODO: implement getMoreData
  }

  @override
  void initDataLoading() {
    callApi();
  }

  @override
  void callApi() {
    jobUserHistoryListBloc.add(jobUserHistoryListEvent);
  }

  @override
  String getPageTitle(BuildContext context) => "Lịch sử hồ sơ";

  @override
  bool isHasAppBar(BuildContext context) => true;

  @override
  Widget pageUI(BuildContext context) => BlocProvider(
        create: (_) => jobUserHistoryListBloc,
        child: BlocListener<JobUserHistoryListBloc,
            DataMultiState<JobUserHistoryListDataResponse>>(
          listener: (BuildContext context, state) {},
          child: BlocBuilder<JobUserHistoryListBloc,
              DataMultiState<JobUserHistoryListDataResponse>>(
            builder: (BuildContext context,
                    DataMultiState<JobUserHistoryListDataResponse> state) =>
                handleDataMultiState<JobUserHistoryListDataResponse>(
              state,
              (context, state) {
                return ListView.builder(
                    shrinkWrap: true,
                    controller: scrollController,
                    itemCount: state.length,
                    itemBuilder: (context, i) => ProfileHistoryItem(
                          data: state.elementAt(i),
                        ));
              },
            ),
          ),
        ),
      );
}
