//
// Created by BlackRose on 12/17/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:eportal/bloc/admin/job_user_list_by_user_name_bloc.dart';
import 'package:eportal/bloc/admin/job_user_refer_list_bloc.dart';
import 'package:eportal/event/admin/job_user_list_by_user_name_event.dart';
import 'package:eportal/model/api/request/admin/data/job_user_list_by_user_name_data_request.dart';
import 'package:eportal/model/api/request/admin/data/job_user_refer_list_data_request.dart';
import 'package:eportal/model/api/request/admin/job_user_list_by_user_name_request.dart';
import 'package:eportal/model/api/request/admin/job_user_refer_list_request.dart';
import 'package:eportal/model/api/response/admin/data/job_user_list_by_user_name_data_response.dart';
import 'package:eportal/screen/worker/profile_add/page/profile_add_page.dart';
import 'package:eportal/screen/worker/profile_edit/page/profile_edit_page.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/expandable_fab/expandable_fab.dart';
import 'package:eportal/widget/full_data_item/curriculum_vitae_item.dart';
import 'package:eportal/widget/input/search_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReferPage extends BasePage {
  const ReferPage({super.key});

  @override
  State<StatefulWidget> createState() => _ReferPageState();
}

class _ReferPageState extends BasePageStateActive<ReferPage> {
  TextEditingController textEditingController = TextEditingController();
  late JobUserReferListBloc jobUserReferListBloc;
  JobUserReferListRequest request =
      JobUserReferListRequest(obj: JobUserReferListDataRequest());

  @override
  void initBloc() {
    jobUserReferListBloc = JobUserReferListBloc();
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
    jobUserReferListBloc.add(JobUserReferListEvent(request: request));
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
              create: (_) => jobUserReferListBloc,
              child: BlocListener<JobUserReferListBloc,
                  DataPageState<JobUserReferListDataResponse>>(
                listener: (BuildContext context, state) {},
                child: BlocBuilder<JobUserReferListBloc,
                        DataPageState<JobUserReferListDataResponse>>(
                    builder: (BuildContext context,
                            DataPageState<JobUserReferListDataResponse>
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
                                              CurriculumVitaeItem(
                                                onTap: () => nextPage(
                                                    (context) =>
                                                        ProfileEditPage(
                                                          data: state
                                                              .elementAt(index),
                                                        )).then((value) =>
                                                    initDataLoading()),
                                                title: state
                                                    .elementAt(index)
                                                    .title,
                                                education: state
                                                    .elementAt(index)
                                                    .education,
                                                careerGoals: state
                                                    .elementAt(index)
                                                    .careerGoals,
                                                skillsForte: state
                                                    .elementAt(index)
                                                    .skillsForte,
                                                workExperience: state
                                                    .elementAt(index)
                                                    .workExperience,
                                                isShowFull: true,
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
