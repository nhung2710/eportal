import 'package:eportal/bloc/common_new/job_user_search_bloc.dart';
import 'package:eportal/event/common_new/job_user_search_event.dart';
import 'package:eportal/model/api/request/common_new/data/job_user_search_data_request.dart';
import 'package:eportal/model/api/request/common_new/job_user_search_request.dart';
import 'package:eportal/model/api/response/common_new/data/job_user_search_data_response.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_elevation.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/dialog/filter_job_dialog.dart';
import 'package:eportal/widget/input/search_input.dart';
import 'package:eportal/widget/show_full_info/show_full_info.dart';
import 'package:eportal/widget/text_icon/text_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../extension/string_extension.dart';

//
// Created by BlackRose on 24/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class NewsCurriculumVitaeSearchPage extends BasePage {
  const NewsCurriculumVitaeSearchPage({super.key});

  @override
  State<StatefulWidget> createState() => _NewsCurriculumVitaeSearchPageState();
}

class _NewsCurriculumVitaeSearchPageState
    extends BasePageState<NewsCurriculumVitaeSearchPage> {
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
    jobUserSearchBloc.add(JobUserSearchEvent(request: request));

    super.initDataLoading();
  }

  @override
  void getMoreData() {
    request.obj.soTrangHienTai++;
    jobUserSearchBloc.add(JobUserSearchEvent(request: request));
  }

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
                          itemBuilder: (context, i) => GestureDetector(
                                onTap: () => {},
                                child: Card(
                                  elevation: AppElevation.sizeOfNormal,
                                  color: AppColor.colorOfApp,
                                  shadowColor: AppColor.colorOfIcon,
                                  borderOnForeground: false,
                                  margin: const EdgeInsets.all(5),
                                  shape: const RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: AppColor.colorOfDrawer,
                                          width: 0.2),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TextIcon(
                                          text: state
                                              .elementAt(i)
                                              .title
                                              .supportHtml(),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 3,
                                          icon: FontAwesomeIcons.tags,
                                          textStyle: AppTextStyle.title
                                              .copyWith(
                                                  color: Colors.black,
                                                  fontSize: 12),
                                          isHasBorder: false,
                                        ),
                                        TextIcon(
                                          text: state
                                              .elementAt(i)
                                              .education
                                              .supportHtml(),
                                          icon: FontAwesomeIcons.graduationCap,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          textStyle: AppTextStyle.title
                                              .copyWith(
                                                  color: Colors.black,
                                                  fontSize: 12),
                                          isHasBorder: false,
                                        ),
                                        TextIcon(
                                          text: state
                                              .elementAt(i)
                                              .careerGoals
                                              .supportHtml(),
                                          icon:
                                              FontAwesomeIcons.clockRotateLeft,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          textStyle: AppTextStyle.title
                                              .copyWith(
                                                  color: Colors.black,
                                                  fontSize: 12),
                                          isHasBorder: false,
                                        ),
                                        TextIcon(
                                          text: state
                                              .elementAt(i)
                                              .skillsForte
                                              .supportHtml(),
                                          icon: FontAwesomeIcons.globe,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          textStyle: AppTextStyle.title
                                              .copyWith(
                                                  color: Colors.black,
                                                  fontSize: 12),
                                          isHasBorder: false,
                                        ),
                                        TextIcon(
                                          text: state
                                              .elementAt(i)
                                              .workExperience
                                              .supportHtml(),
                                          icon: FontAwesomeIcons.bullseye,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          textStyle: AppTextStyle.title
                                              .copyWith(
                                                  color: AppColor.colorOfIcon,
                                                  fontSize: 14),
                                          isHasBorder: false,
                                        ),
                                        ShowFullInfo(
                                          text: "Xem chi tiết",
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )),
                    ),
                  ),
                )),
          ),
        ],
      );

  @override
  getBottomNavigationBar(BuildContext context) => null;

  @override
  String getPageTitle(BuildContext context) => "Tìm kiếm";
}
