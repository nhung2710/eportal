//
// Created by BlackRose on 04/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//

import 'package:eportal/bloc/admin/job_user_history_list_bloc.dart';
import 'package:eportal/event/admin/job_user_history_list_event.dart';
import 'package:eportal/model/api/request/admin/data/job_user_history_list_data_request.dart';
import 'package:eportal/model/api/request/admin/job_user_history_list_request.dart';
import 'package:eportal/model/api/response/admin/data/job_user_history_list_data_response.dart';
import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/base/page_widget/base_page_widget.dart';
import 'package:eportal/page/users/user_profile_history/widget/user_profile_history_item.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfileHistoryPage extends BasePageWidget {
  final String? userProfileId;
  const UserProfileHistoryPage({super.key,this.userProfileId});

  @override
  State<StatefulWidget> createState() => UserProfileHistoryPageState();
}

class UserProfileHistoryPageState
    extends BasePageState<UserProfileHistoryPage> {
  late JobUserHistoryListBloc jobUserHistoryListBloc;
  JobUserHistoryListEvent jobUserHistoryListEvent = JobUserHistoryListEvent(request: JobUserHistoryListRequest(obj: JobUserHistoryListDataRequest()));

  @override
  void initBloc() {
    jobUserHistoryListBloc = JobUserHistoryListBloc();
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
    jobUserHistoryListEvent.request.obj.jobUserID = widget.userProfileId;
    jobUserHistoryListBloc.add(jobUserHistoryListEvent);
  }
  @override
  PreferredSizeWidget? getAppBar(BuildContext context) => defaultTabBar();


  @override
  Widget pageUI(BuildContext context) => Container(
    margin: const EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text(
            "Lịch sử hồ sơ",
            style: AppTextStyle.titlePage.copyWith(
                overflow: TextOverflow.visible,
                fontSize: 18,
                color: AppColor.colorOfIconActive),
          ),
        ),
        Expanded(
          child: BlocProvider(
              create: (_) => jobUserHistoryListBloc,
              child: BlocListener<JobUserHistoryListBloc,
                  DataMultiState<JobUserHistoryListDataResponse>>(
                listener: (BuildContext context,
                    DataMultiState<JobUserHistoryListDataResponse> state) {},
                child: BlocBuilder<JobUserHistoryListBloc,
                    DataMultiState<JobUserHistoryListDataResponse>>(
                  builder: (BuildContext context,
                      DataMultiState<JobUserHistoryListDataResponse> state) =>
                      handleDataMultiState<JobUserHistoryListDataResponse>(
                        state,
                            (context, state) => ListView(
                              shrinkWrap: true,
                              children: state.map((e) => UserProfileHistoryItem(data: e,
                                onClickItem: (JobUserHistoryListDataResponse value) {
                                },
                              )).toList(),),
                      ),
                ),
              )),
        ),
      ],
    ),
  );

}