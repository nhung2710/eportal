import 'package:eportal/model/api/request/common_new/data/home_job_user_list_data_request.dart';
import 'package:eportal/model/api/response/common_new/data/home_job_user_list_data_response.dart';
import 'package:eportal/screen/share/news_curriculum_vitae_search/page/news_curriculum_vitae_search_page.dart';
import 'package:eportal/widget/expandable_fab/expandable_fab.dart';
import 'package:eportal/widget/full_data_item/curriculum_vitae_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/common_new/home_job_user_list_bloc.dart';
import '../../../../event/common_new/home_job_user_list_event.dart';
import '../../../../model/api/request/common_new/home_job_user_list_request.dart';
import '../../../../state/base/base_state.dart';
import '../../../../widget/base/base_page.dart';
import '../../news_curriculum_vitae_detail/page/news_curriculum_vitae_detail_page.dart';

//
// Created by BlackRose on 16/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class NewsCurriculumVitaePage extends BasePage {
  const NewsCurriculumVitaePage({super.key});

  @override
  State<StatefulWidget> createState() => _NewsCurriculumVitaePageState();
}

class _NewsCurriculumVitaePageState
    extends BasePageState<NewsCurriculumVitaePage> {
  HomeJobUserListBloc homeJobUserListBloc = HomeJobUserListBloc();

  @override
  void initDataLoading() {
    callApi();
    super.initDataLoading();
  }

  @override
  void callApi() {
    homeJobUserListBloc.add(HomeJobUserListEvent(
        request: HomeJobUserListRequest(obj: HomeJobUserListDataRequest())));
  }

  @override
  Widget? getFloatingActionButton(BuildContext context) => ExpandableFab(
        children: [
          ActionButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () =>
                nextPage((context) => const NewsCurriculumVitaeSearchPage()),
          ),
        ],
      );

  @override
  Widget pageUI(BuildContext context) => BlocProvider(
      create: (_) => homeJobUserListBloc,
      child: BlocListener<HomeJobUserListBloc,
          DataMultiState<HomeJobUserListDataResponse>>(
        listener: (BuildContext context,
            DataMultiState<HomeJobUserListDataResponse> state) {},
        child: BlocBuilder<HomeJobUserListBloc,
            DataMultiState<HomeJobUserListDataResponse>>(
          builder: (BuildContext context,
                  DataMultiState<HomeJobUserListDataResponse> state) =>
              handleDataMultiState<HomeJobUserListDataResponse>(
            state,
            (context, state) => ListView.builder(
                shrinkWrap: true,
                itemCount: state.length,
                itemBuilder: (context, i) => CurriculumVitaeItem(
                      onTap: () =>
                          nextPage((context) => NewsCurriculumVitaeDetailPage(
                                id: state.elementAt(i).id,
                              )),
                      title: state.elementAt(i).title,
                      education: state.elementAt(i).education,
                      careerGoals: state.elementAt(i).careerGoals,
                      skillsForte: state.elementAt(i).skillsForte,
                      workExperience: state.elementAt(i).workExperience,
                    )),
          ),
        ),
      ));

  @override
  getBottomNavigationBar(BuildContext context) => null;

  @override
  String getPageTitle(BuildContext context) => "Hồ sơ ứng viên";
}
