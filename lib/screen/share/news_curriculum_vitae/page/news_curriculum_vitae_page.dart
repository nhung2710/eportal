import 'package:eportal/screen/share/work_search/page/work_search_page.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_elevation.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/expandable_fab/expandable_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/common_new/home_job_user_list_bloc.dart';
import '../../../../constant/application_constant.dart';
import '../../../../event/common_new/home_job_user_list_event.dart';
import '../../../../extension/string_extension.dart';
import '../../../../model/api/request/common_new/data/common_new_data_request.dart';
import '../../../../model/api/request/common_new/home_job_user_list_request.dart';
import '../../../../model/api/response/common_new/home_job_user_list_response.dart';
import '../../../../state/base/base_state.dart';
import '../../../../widget/base/base_page.dart';
import '../../news_curriculum_vitae_detail/page/news_curriculum_vitae_detail_page.dart';

//
// Created by BlackRose on 16/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class NewsCurriculumVitaePage extends BasePage {
  NewsCurriculumVitaePage({super.key});

  @override
  State<StatefulWidget> createState() => _NewsCurriculumVitaePageState();
}

class _NewsCurriculumVitaePageState
    extends BasePageState<NewsCurriculumVitaePage> {
  HomeJobUserListBloc homeJobUserListBloc = HomeJobUserListBloc();

  @override
  void initDataLoading() {
    homeJobUserListBloc.add(HomeJobUserListEvent(
        request: HomeJobUserListRequest(
            obj: CommonNewDataRequest(
                top: ApplicationConstant.NUMBER_FULL_ITEM))));
    super.initDataLoading();
  }

  @override
  Widget? getFloatingActionButton(BuildContext context) => ExpandableFab(
        children: [
          ActionButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () => nextPage((context) => const WorkSearchPage()),
          ),
        ],
      );

  @override
  Widget pageUI(BuildContext context) => BlocProvider(
      create: (_) => homeJobUserListBloc,
      child: BlocListener<HomeJobUserListBloc, BaseState>(
        listener: (BuildContext context, BaseState state) {},
        child: BlocBuilder<HomeJobUserListBloc, BaseState>(
          builder: (BuildContext context, BaseState state) =>
              handlerBaseState<HomeJobUserListResponse>(
            state,
            (context, state) => (state.data?.length ?? 0) == 0
                ? buildNotFoundData(context)
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.data!.length,
                    itemBuilder: (context, i) => GestureDetector(
                          onTap: () => nextPage(
                              (context) => NewsCurriculumVitaeDetailPage(
                                    homeJobUserListDataResponse:
                                        state.data!.elementAt(i),
                                  )),
                          child: Card(
                            elevation: AppElevation.sizeOfNormal,
                            color: AppColor.colorOfApp,
                            shadowColor: AppColor.colorOfIcon,
                            borderOnForeground: false,
                            margin: const EdgeInsets.all(5),
                            shape: const RoundedRectangleBorder(
                                side: BorderSide(
                                    color: AppColor.colorOfDrawer, width: 0.2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      state.data!
                                          .elementAt(i)
                                          .title
                                          .replaceWhenNullOrWhiteSpace(),
                                      style: AppTextStyle.title.copyWith(
                                          overflow: TextOverflow.visible,
                                          color: AppColor.colorOfIcon),
                                    ),
                                  ),
                                  const Divider(
                                    height: 1,
                                    color: AppColor.colorOfDrawer,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "Trình độ học vấn",
                                              style: AppTextStyle.title
                                                  .copyWith(
                                                      overflow:
                                                          TextOverflow.visible),
                                            )),
                                        const VerticalDivider(
                                          thickness: 2,
                                          width: 5,
                                          color: Colors.transparent,
                                        ),
                                        Expanded(
                                            flex: 3,
                                            child: Text(
                                              state.data!
                                                  .elementAt(i)
                                                  .education
                                                  .replaceWhenNullOrWhiteSpace(),
                                              maxLines: 3,
                                              style: AppTextStyle.title
                                                  .copyWith(
                                                      color:
                                                          AppColor.colorOfIcon),
                                            )),
                                      ],
                                    ),
                                  ),
                                  const Divider(
                                    height: 1,
                                    color: AppColor.colorOfDrawer,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "Kinh nghiệm làm việc",
                                              style: AppTextStyle.title
                                                  .copyWith(
                                                      overflow:
                                                          TextOverflow.visible),
                                            )),
                                        const VerticalDivider(
                                          thickness: 2,
                                          width: 5,
                                          color: Colors.transparent,
                                        ),
                                        Expanded(
                                            flex: 3,
                                            child: Text(
                                              state.data!
                                                  .elementAt(i)
                                                  .careerGoals
                                                  .replaceWhenNullOrWhiteSpace(),
                                              maxLines: 3,
                                              style: AppTextStyle.title
                                                  .copyWith(
                                                      color:
                                                          AppColor.colorOfIcon),
                                            )),
                                      ],
                                    ),
                                  ),
                                  const Divider(
                                    height: 1,
                                    color: AppColor.colorOfDrawer,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "Mục tiêu",
                                              style: AppTextStyle.title
                                                  .copyWith(
                                                      overflow:
                                                          TextOverflow.visible),
                                            )),
                                        const VerticalDivider(
                                          thickness: 2,
                                          width: 5,
                                          color: Colors.transparent,
                                        ),
                                        Expanded(
                                            flex: 3,
                                            child: Text(
                                              state.data!
                                                  .elementAt(i)
                                                  .workExperience
                                                  .replaceWhenNullOrWhiteSpace(),
                                              maxLines: 3,
                                              style: AppTextStyle.title
                                                  .copyWith(
                                                      color:
                                                          AppColor.colorOfIcon),
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
          ),
        ),
      ));

  @override
  getBottomNavigationBar(BuildContext context) => null;

  @override
  String getPageTitle(BuildContext context) => "Hồ sơ ứng viên";
}
