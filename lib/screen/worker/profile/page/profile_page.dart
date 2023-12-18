import 'package:eportal/bloc/admin/job_user_list_by_user_name_bloc.dart';
import 'package:eportal/model/api/response/admin/data/job_user_list_by_user_name_data_response.dart';
import 'package:eportal/screen/worker/profile/widget/profile_item.dart';
import 'package:eportal/screen/worker/profile_add/page/profile_add_page.dart';
import 'package:eportal/screen/worker/profile_edit/page/profile_edit_page.dart';
import 'package:eportal/screen/worker/refer/page/refer_page.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/dialog/choose_action_dialog.dart';
import 'package:eportal/widget/expandable_fab/expandable_fab.dart';
import 'package:eportal/widget/full_data_item/curriculum_vitae_item.dart';
import 'package:eportal/widget/input/search_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../event/admin/job_user_list_by_user_name_event.dart';
import '../../../../model/api/request/admin/data/job_user_list_by_user_name_data_request.dart';
import '../../../../model/api/request/admin/job_user_list_by_user_name_request.dart';

//
// Created by BlackRose on 11/9/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class ProfilePage extends BasePage {
  const ProfilePage({super.key});

  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends BasePageStateActive<ProfilePage> {
  TextEditingController textEditingController = TextEditingController();
  late JobUserListByUserNameBloc jobUserListByUserNameBloc;
  JobUserListByUserNameRequest request =
      JobUserListByUserNameRequest(obj: JobUserListByUserNameDataRequest());

  @override
  void initBloc() {
    jobUserListByUserNameBloc = JobUserListByUserNameBloc();
    super.initBloc();
  }

  @override
  void initDataLoading() {
    request.obj.soTrangHienTai = 1;
    callApi();
    super.initDataLoading();
  }

  @override
  void callApi() {
    request.obj.tuKhoa = textEditingController.text;
    jobUserListByUserNameBloc.add(JobUserListByUserNameEvent(request: request));
  }

  @override
  bool isHasAppBar(BuildContext context) => false;

  @override
  void getMoreData() {
    request.obj.soTrangHienTai++;
    callApi();
    super.getMoreData();
  }

  @override
  Widget? getFloatingActionButton(BuildContext context) =>
      ExpandableFab(initNumberGroup: 1, children: [
        ActionButton(
          icon: const Icon(Icons.add, color: Colors.white),
          onPressed: () {
            nextPage((context) => ProfileAddPage());
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
              hintText: "Nội dung tìm kiếm",
            ),
          ),
          Expanded(
            child: BlocProvider(
              create: (_) => jobUserListByUserNameBloc,
              child: BlocListener<JobUserListByUserNameBloc,
                  DataPageState<JobUserListByUserNameDataResponse>>(
                listener: (BuildContext context, state) {},
                child: BlocBuilder<JobUserListByUserNameBloc,
                        DataPageState<JobUserListByUserNameDataResponse>>(
                    builder: (BuildContext context,
                            DataPageState<JobUserListByUserNameDataResponse>
                                state) =>
                        handleDataPageState(
                            state,
                            (context, state) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          controller: scrollController,
                                          itemCount: state.length,
                                          itemBuilder: (BuildContext context,
                                                  int index) =>
                                              ProfileItem(
                                                onTapReferEdit: () {
                                                  nextPage((context) =>
                                                      ReferPage(
                                                        data: state
                                                            .elementAt(index),
                                                      ));
                                                },
                                                onTapProfileEdit: () {
                                                  nextPage((context) =>
                                                          ProfileEditPage(
                                                            data:
                                                                state.elementAt(
                                                                    index),
                                                          ))
                                                      .then((value) =>
                                                          initDataLoading());
                                                },
                                                data: state.elementAt(index),
                                              )),
                                    ),
                                  ],
                                ))),
              ),
            ),
          ),
        ],
      );
}
