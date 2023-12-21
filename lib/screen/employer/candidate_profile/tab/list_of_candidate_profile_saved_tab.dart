import 'package:eportal/bloc/admin/profile_save_list_bloc.dart';
import 'package:eportal/event/admin/profile_save_list_event.dart';
import 'package:eportal/model/api/request/admin/data/profile_save_list_data_request.dart';
import 'package:eportal/model/api/request/admin/profile_save_list_request.dart';
import 'package:eportal/model/api/response/admin/data/profile_save_list_data_response.dart';
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

class ListOfCandidateProfileSavedTab extends BasePage {
  const ListOfCandidateProfileSavedTab({super.key});

  @override
  State<StatefulWidget> createState() => _ListOfCandidateProfileSavedTabState();
}

class _ListOfCandidateProfileSavedTabState
    extends BasePageStateActive<ListOfCandidateProfileSavedTab> {
  late ProfileSaveListBloc profileSaveListBloc;
  ProfileSaveListRequest request =
      ProfileSaveListRequest(obj: ProfileSaveListDataRequest());
  TextEditingController textEditingController = TextEditingController();

  @override
  void initBloc() {
    profileSaveListBloc = ProfileSaveListBloc();
  }
  @override
  void disposeBloc() {
    profileSaveListBloc.close();
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
    profileSaveListBloc.add(ProfileSaveListEvent(request: request));
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
                create: (_) => profileSaveListBloc,
                child: BlocListener<ProfileSaveListBloc,
                    DataPageState<ProfileSaveListDataResponse>>(
                  listener: (BuildContext context,
                      DataPageState<ProfileSaveListDataResponse> state) {},
                  child: BlocBuilder<ProfileSaveListBloc,
                      DataPageState<ProfileSaveListDataResponse>>(
                    builder: (BuildContext context,
                            DataPageState<ProfileSaveListDataResponse> state) =>
                        handleDataPageState<ProfileSaveListDataResponse>(
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
