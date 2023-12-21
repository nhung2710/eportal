import 'package:eportal/bloc/admin/profile_view_list_bloc.dart';
import 'package:eportal/event/admin/profile_view_list_event.dart';
import 'package:eportal/model/api/request/admin/data/profile_view_list_data_request.dart';
import 'package:eportal/model/api/request/admin/profile_view_list_request.dart';
import 'package:eportal/model/api/response/admin/data/profile_view_list_data_response.dart';
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

class ListOfCandidateProfileViewedTab extends BasePage {
  const ListOfCandidateProfileViewedTab({super.key});

  @override
  State<StatefulWidget> createState() =>
      _ListOfCandidateProfileViewedTabState();
}

class _ListOfCandidateProfileViewedTabState
    extends BasePageStateActive<ListOfCandidateProfileViewedTab> {
  late ProfileViewListBloc profileViewListBloc;
  ProfileViewListRequest request =
      ProfileViewListRequest(obj: ProfileViewListDataRequest());
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initBloc() {
    profileViewListBloc = ProfileViewListBloc();
  }

  @override
  void disposeBloc() {
    profileViewListBloc.close();
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
  void callApi() {
    request.obj.tuKhoa = textEditingController.text;
    profileViewListBloc.add(ProfileViewListEvent(request: request));
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
                create: (_) => profileViewListBloc,
                child: BlocListener<ProfileViewListBloc,
                    DataPageState<ProfileViewListDataResponse>>(
                  listener: (BuildContext context,
                      DataPageState<ProfileViewListDataResponse> state) {},
                  child: BlocBuilder<ProfileViewListBloc,
                      DataPageState<ProfileViewListDataResponse>>(
                    builder: (BuildContext context,
                            DataPageState<ProfileViewListDataResponse> state) =>
                        handleDataPageState<ProfileViewListDataResponse>(
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
