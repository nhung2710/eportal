//
// Created by BlackRose on 03/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//

import 'package:eportal/bloc/common_new/home_job_user_list_bloc.dart';
import 'package:eportal/bloc/common_new/job_user_search_bloc.dart';
import 'package:eportal/event/common_new/home_job_user_list_event.dart';
import 'package:eportal/event/common_new/job_user_search_event.dart';
import 'package:eportal/model/api/request/common_new/data/job_user_search_data_request.dart';
import 'package:eportal/model/api/request/common_new/job_user_search_request.dart';
import 'package:eportal/model/api/response/common_new/data/job_user_search_data_response.dart';
import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/base/page_widget/base_page_widget.dart';
import 'package:eportal/page/share/news_search/page/news_search_filter_page.dart';
import 'package:eportal/page/share/profile_detail/page/profile_detail_page.dart';
import 'package:eportal/page/share/profile_search/page/profile_search_filter_page.dart';
import 'package:eportal/page/share/profile_search/widget/profile_search_page_item.dart';
import 'package:eportal/page/widget/default_search_form_field.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_size_icon.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../state/base/base_state.dart';

class ProfileSearchPage extends BasePageWidget {
  const ProfileSearchPage({super.key});

  @override
  State<StatefulWidget> createState() => ProfileSearchPageState();
}

class ProfileSearchPageState
    extends BasePageState<ProfileSearchPage> {
  late JobUserSearchBloc jobUserSearchBloc;
  JobUserSearchEvent jobUserSearchEvent = JobUserSearchEvent(request: JobUserSearchRequest(obj: JobUserSearchDataRequest()));
  TextEditingController textEditingController = TextEditingController();

  @override
  void initBloc() {
    jobUserSearchBloc = JobUserSearchBloc();
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    jobUserSearchBloc.close();
  }

  @override
  void getMoreData() {
    // TODO: implement getMoreData
    jobUserSearchEvent.request.obj.nextData();
    callApi();
  }

  @override
  void initDataLoading() {
    jobUserSearchEvent.request.obj.reloadData();
    callApi();
  }

  @override
  void callApi() {
    jobUserSearchEvent.request.obj.tuKhoa = textEditingController.text;
    jobUserSearchBloc.add(jobUserSearchEvent);
  }
  @override
  PreferredSizeWidget? getAppBar(BuildContext context) => AppBar(
    title: Text(
      getPageTitle(context),
      style: AppTextStyle.titleAppbarPage,
    ),
    backgroundColor: AppColor.colorOfIcon,
    automaticallyImplyLeading: true,
    centerTitle: true,
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: GestureDetector(
            onTap: () {
              nextPage((context) => ProfileSearchFilterPage(data:jobUserSearchEvent)).then((value) {
                if(value!=null) {
                  jobUserSearchEvent = value;
                  initDataLoading();
                }
              });
            },
            child: const Icon(
              FontAwesomeIcons.filter,
              color: Colors.white,
              size: AppSizeIcon.sizeOfNormal,
            ),
          ),
        ),
      )
    ],
  );


  @override
  Widget pageUI(BuildContext context) => Container(
    margin: const EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text(
            "Tìm kiếm tin tức hồ sơ",
            style: AppTextStyle.titlePage.copyWith(
                overflow: TextOverflow.visible,
                fontSize: 18,
                color: AppColor.colorOfIconActive),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 5, top: 5),
          color: Colors.white,
          child: DefaultSearchFormField(
            controller: textEditingController,
            icon: FontAwesomeIcons.magnifyingGlass,
            maxLength: 100,
            textInputAction: TextInputAction.send,
            onFieldSubmitted: (value) => initDataLoading(),
            hintText: "Nội dung tìm kiếm",
            labelText: "Nội dung tìm kiếm",
            helperText: "Ví dụ: abc",
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
                            (context, state) => ListView(
                              shrinkWrap: true,
                              controller: scrollController,
                              children: state.map((e) => ProfileSearchPageItem(data: e,
                                onClickItem: (JobUserSearchDataResponse value) {
                                    nextPage((context) => ProfileDetailPage(profileId: value.id,));
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