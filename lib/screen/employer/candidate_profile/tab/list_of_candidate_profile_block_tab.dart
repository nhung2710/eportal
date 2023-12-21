import 'package:eportal/bloc/admin/profile_black_list_bloc.dart';
import 'package:eportal/event/admin/profile_black_list_event.dart';
import 'package:eportal/model/api/request/admin/data/profile_black_list_data_request.dart';
import 'package:eportal/model/api/request/admin/profile_black_list_request.dart';
import 'package:eportal/model/api/response/admin/data/profile_black_list_data_response.dart';
import 'package:eportal/screen/share/news_curriculum_vitae_detail/page/news_curriculum_vitae_detail_page.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/full_data_item/curriculum_vitae_item.dart';
import 'package:eportal/widget/input/search_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//
// Created by BlackRose on 12/20/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class ListOfCandidateProfileBlockTab extends BasePage {
  const ListOfCandidateProfileBlockTab({super.key});

  @override
  State<StatefulWidget> createState() => _ListOfCandidateProfileBlockTabState();
}

class _ListOfCandidateProfileBlockTabState
    extends BasePageStateActive<ListOfCandidateProfileBlockTab> {
  late ProfileBlackListBloc profileBlackListBloc;
  ProfileBlackListRequest request =
      ProfileBlackListRequest(obj: ProfileBlackListDataRequest());
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initBloc() {
    profileBlackListBloc = ProfileBlackListBloc();
  }

  @override
  void disposeBloc() {
    profileBlackListBloc.close();
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
    profileBlackListBloc.add(ProfileBlackListEvent(request: request));
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
                create: (_) => profileBlackListBloc,
                child: BlocListener<ProfileBlackListBloc,
                    DataPageState<ProfileBlackListDataResponse>>(
                  listener: (BuildContext context,
                      DataPageState<ProfileBlackListDataResponse> state) {},
                  child: BlocBuilder<ProfileBlackListBloc,
                      DataPageState<ProfileBlackListDataResponse>>(
                    builder: (BuildContext context,
                            DataPageState<ProfileBlackListDataResponse>
                                state) =>
                        handleDataPageState<ProfileBlackListDataResponse>(
                      state,
                      (context, state) => ListView.builder(
                          shrinkWrap: true,
                          controller: scrollController,
                          itemCount: state.length,
                          itemBuilder: (context, i) => CurriculumVitaeItem(
                                onTap: () => nextPage(
                                    (context) => NewsCurriculumVitaeDetailPage(
                                          id: state.elementAt(i).search,
                                        )),
                                title: state.elementAt(i).search,
                                education: state.elementAt(i).search,
                                careerGoals: state.elementAt(i).search,
                                skillsForte: state.elementAt(i).search,
                                workExperience: state.elementAt(i).search,
                              )),
                    ),
                  ),
                )),
          ),
        ],
      );
}
