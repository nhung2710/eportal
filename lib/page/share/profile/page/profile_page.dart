//
// Created by BlackRose on 03/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//

import 'package:eportal/bloc/common_new/home_job_user_list_bloc.dart';
import 'package:eportal/model/api/response/common_new/data/home_job_user_list_data_response.dart';
import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/share/profile/widget/profile_item.dart';
import 'package:eportal/page/share/profile_detail/page/profile_detail_page.dart';
import 'package:eportal/page/share/profile_search/page/profile_search_page.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/expandable_fab/expandable_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../event/common_new/home_job_user_list_event.dart';
import '../../../../model/api/request/common_new/data/home_job_user_list_data_request.dart';
import '../../../../model/api/request/common_new/home_job_user_list_request.dart';
import '../../../base/page_widget/base_page_widget.dart';

class ProfilePage extends BasePageWidget {
  const ProfilePage({super.key});

  @override
  State<StatefulWidget> createState() => ProfilePageState();
}

class ProfilePageState
    extends BasePageState<ProfilePage> {
  late HomeJobUserListBloc homeJobUserListBloc;
  HomeJobUserListEvent homeJobUserListEvent = HomeJobUserListEvent(request: HomeJobUserListRequest(obj: HomeJobUserListDataRequest()));

  @override
  void initBloc() {
    homeJobUserListBloc = HomeJobUserListBloc();
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    homeJobUserListBloc.close();
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
    homeJobUserListBloc.add(homeJobUserListEvent);
  }
  @override
  PreferredSizeWidget? getAppBar(BuildContext context) => defaultTabBar();

  @override
  Widget? getFloatingActionButton(BuildContext context) => ExpandableFab(
    children: [
      ActionButton(
        icon: const Icon(
          Icons.search,
          color: Colors.white,
        ),
        onPressed: () {
          nextPage((context) => const ProfileSearchPage());
        }

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
                    (context, state) => Container(
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              "Tin tức hồ sơ",
                              style: AppTextStyle.titlePage.copyWith(
                                  overflow: TextOverflow.visible,
                                  fontSize: 18,
                                  color: AppColor.colorOfIconActive),
                            ),
                          ),
                          Expanded(
                            child: ListView(
                            shrinkWrap: true,
                            children: state.map((e) => ProfileItem(data: e,
                              onClickItem: (HomeJobUserListDataResponse value) {
                                nextPage((context) => ProfileDetailPage(profileId: value.id,));
                              },
                            )).toList(),),
                          ),
                        ],
                      ),
                    ),
              ),
        ),
      ));

}