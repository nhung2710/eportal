import 'package:eportal/bloc/common_new/job_user_search_bloc.dart';
import 'package:eportal/bloc/common_new/work_search_bloc.dart';
import 'package:eportal/event/common_new/job_user_search_event.dart';
import 'package:eportal/event/common_new/work_search_event.dart';
import 'package:eportal/model/api/request/common_new/data/job_user_search_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/work_search_data_request.dart';
import 'package:eportal/model/api/request/common_new/job_user_search_request.dart';
import 'package:eportal/model/api/request/common_new/work_search_request.dart';
import 'package:eportal/model/api/response/common_new/data/job_user_search_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/work_search_data_response.dart';
import 'package:eportal/screen/share/news_curriculum_vitae_detail/page/news_curriculum_vitae_detail_page.dart';
import 'package:eportal/screen/share/work_search_detail/page/work_search_detail_page.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/dialog/filter_job_dialog.dart';
import 'package:eportal/widget/full_data_item/curriculum_vitae_item.dart';
import 'package:eportal/widget/full_data_item/work_item.dart';
import 'package:eportal/widget/input/search_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//
// Created by BlackRose on 05/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class ListOfCandidateProfileSavedTab extends BasePage {
  const ListOfCandidateProfileSavedTab({super.key});

  @override
  State<StatefulWidget> createState() => _ListOfCandidateProfileSavedTabState();
}

class _ListOfCandidateProfileSavedTabState
    extends BasePageStateActive<ListOfCandidateProfileSavedTab> {
  JobUserSearchBloc jobUserSearchBloc = JobUserSearchBloc();
  JobUserSearchRequest request =
      JobUserSearchRequest(obj: JobUserSearchDataRequest());
  final filterJobDialogKey = GlobalKey<FilterJobDialogState>();
  late FilterJobDialog filterJobDialog = FilterJobDialog(
      key: filterJobDialogKey,
      data: request.obj,
      onPressed: () => initDataLoading());
  TextEditingController textEditingController = TextEditingController();

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
    jobUserSearchBloc.add(JobUserSearchEvent(request: request));
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
                create: (_) => jobUserSearchBloc,
                child: BlocListener<JobUserSearchBloc,
                    DataPageState<JobUserSearchDataResponse>>(
                  listener: (BuildContext context,
                      DataPageState<JobUserSearchDataResponse> state) {},
                  child: BlocBuilder<JobUserSearchBloc,
                      DataPageState<JobUserSearchDataResponse>>(
                    builder: (BuildContext context,
                            DataPageState<JobUserSearchDataResponse> state) =>
                        handleDataPageState<JobUserSearchDataResponse>(
                      state,
                      (context, state) => ListView.builder(
                          shrinkWrap: true,
                          controller: scrollController,
                          itemCount: state.length,
                          itemBuilder: (context, i) => CurriculumVitaeItem(
                                onTap: () => nextPage(
                                    (context) => NewsCurriculumVitaeDetailPage(
                                          id: state.elementAt(i).id,
                                        )),
                                title: state.elementAt(i).title,
                                education: state.elementAt(i).education,
                                careerGoals: state.elementAt(i).careerGoals,
                                skillsForte: state.elementAt(i).skillsForte,
                                workExperience:
                                    state.elementAt(i).workExperience,
                              )),
                    ),
                  ),
                )),
          ),
        ],
      );
}
