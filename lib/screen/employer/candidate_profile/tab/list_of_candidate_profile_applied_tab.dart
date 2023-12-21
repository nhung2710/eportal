import 'package:eportal/bloc/admin/profile_send_list_bloc.dart';
import 'package:eportal/event/admin/profile_send_list_event.dart';
import 'package:eportal/model/api/request/admin/data/profile_send_list_data_request.dart';
import 'package:eportal/model/api/request/admin/profile_send_list_request.dart';
import 'package:eportal/model/api/response/admin/data/profile_send_list_data_response.dart';
import 'package:eportal/screen/share/news_curriculum_vitae_detail/page/news_curriculum_vitae_detail_page.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/full_data_item/curriculum_vitae_item.dart';
import 'package:eportal/widget/input/search_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//
// Created by BlackRose on 05/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class ListOfCandidateProfileAppliedTab extends BasePage {
  const ListOfCandidateProfileAppliedTab({super.key});

  @override
  State<StatefulWidget> createState() =>
      _ListOfCandidateProfileAppliedTabState();
}

class _ListOfCandidateProfileAppliedTabState
    extends BasePageStateActive<ListOfCandidateProfileAppliedTab> {
  late ProfileSendListBloc profileSendListBloc;
  ProfileSendListRequest request =
      ProfileSendListRequest(obj: ProfileSendListDataRequest());
  TextEditingController textEditingController = TextEditingController();

  @override
  void initBloc() {
    profileSendListBloc = ProfileSendListBloc();
  }

  @override
  void disposeBloc() {
    profileSendListBloc.close();
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
    profileSendListBloc.add(ProfileSendListEvent(request: request));
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
                create: (_) => profileSendListBloc,
                child: BlocListener<ProfileSendListBloc,
                    DataPageState<ProfileSendListDataResponse>>(
                  listener: (BuildContext context,
                      DataPageState<ProfileSendListDataResponse> state) {},
                  child: BlocBuilder<ProfileSendListBloc,
                      DataPageState<ProfileSendListDataResponse>>(
                    builder: (BuildContext context,
                            DataPageState<ProfileSendListDataResponse> state) =>
                        handleDataPageState<ProfileSendListDataResponse>(
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
