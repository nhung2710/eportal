import 'package:eportal/model/api/response/common_new/data/work_search_data_response.dart';
import 'package:eportal/screen/share/work_search_detail/page/work_search_detail_page.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_elevation.dart';
import 'package:eportal/widget/dialog/filter_job_dialog.dart';
import 'package:eportal/widget/text_icon/text_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../bloc/common_new/work_search_bloc.dart';
import '../../../../event/common_new/work_search_event.dart';
import '../../../../extension/string_extension.dart';
import '../../../../model/api/request/common_new/data/work_search_data_request.dart';
import '../../../../model/api/request/common_new/work_search_request.dart';
import '../../../../model/api/response/common_new/work_search_response.dart';
import '../../../../state/base/base_state.dart';
import '../../../../style/app_text_style.dart';
import '../../../../widget/base/base_page.dart';
import '../../../../widget/input/search_input.dart';
import '../../../../widget/show_full_info/show_full_info.dart';

//
// Created by BlackRose on 13/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class WorkSearchPage extends BasePage {
  const WorkSearchPage({super.key});

  @override
  State<StatefulWidget> createState() => _WorkSearchPageState();
}

class _WorkSearchPageState extends BasePageState<WorkSearchPage> {
  WorkSearchBloc workSearchBloc = WorkSearchBloc();
  WorkSearchRequest request = WorkSearchRequest(obj: WorkSearchDataRequest());
  final filterJobDialogKey = GlobalKey<FilterJobDialogState>();
  late FilterJobDialog filterJobDialog =
      FilterJobDialog(key: filterJobDialogKey, data: request.obj);
  TextEditingController textEditingController = TextEditingController();

  @override
  void initDataLoading() {
    request.obj.tuKhoa = textEditingController.text;
    request.obj.soTrangHienTai = 1;
    workSearchBloc.add(WorkSearchEvent(request: request));

    super.initDataLoading();
  }

  @override
  void getMoreData() {
    request.obj.soTrangHienTai++;
    workSearchBloc.add(WorkSearchEvent(request: request));
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
                showDialog(context: context, builder: (_) => filterJobDialog)
                    .then((value) {
                  initDataLoading();
                });
              },
              hintText: "Nội dung tìm kiếm",
            ),
          ),
          Expanded(
            child: BlocProvider(
                create: (_) => workSearchBloc,
                child: BlocListener<WorkSearchBloc,
                    DataPageState<WorkSearchDataResponse>>(
                  listener: (BuildContext context,
                      DataPageState<WorkSearchDataResponse> state) {},
                  child: BlocBuilder<WorkSearchBloc,
                      DataPageState<WorkSearchDataResponse>>(
                    builder: (BuildContext context,
                            DataPageState<WorkSearchDataResponse> state) =>
                        handleDataPageState<WorkSearchDataResponse>(
                      state,
                      (context, state) => ListView.builder(
                          shrinkWrap: true,
                          controller: scrollController,
                          itemCount: state.length,
                          itemBuilder: (context, i) => GestureDetector(
                                onTap: () =>
                                    nextPage((context) => WorkSearchDetailPage(
                                          workSearchDataResponse:
                                              state.elementAt(i),
                                        )),
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
                                              .description
                                              .supportHtml(),
                                          overflow: TextOverflow.ellipsis,
                                          icon: FontAwesomeIcons.briefcase,
                                          maxLines: 3,
                                          textStyle: AppTextStyle.title
                                              .copyWith(
                                                  color: Colors.black,
                                                  fontSize: 12),
                                          isHasBorder: false,
                                        ),
                                        TextIcon(
                                          overflow: TextOverflow.ellipsis,
                                          text: state
                                              .elementAt(i)
                                              .ages
                                              .supportHtml(),
                                          maxLines: 3,
                                          icon: FontAwesomeIcons.child,
                                          textStyle: AppTextStyle.title
                                              .copyWith(
                                                  color: Colors.black,
                                                  fontSize: 12),
                                          isHasBorder: false,
                                        ),
                                        TextIcon(
                                          text: state
                                              .elementAt(i)
                                              .workTime
                                              .supportHtml(),
                                          overflow: TextOverflow.ellipsis,
                                          icon: FontAwesomeIcons.businessTime,
                                          maxLines: 3,
                                          textStyle: AppTextStyle.title
                                              .copyWith(
                                                  color: Colors.black,
                                                  fontSize: 12),
                                          isHasBorder: false,
                                        ),
                                        TextIcon(
                                          text: state.elementAt(i).benefit,
                                          icon: FontAwesomeIcons.thumbsUp,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          textStyle: AppTextStyle.title
                                              .copyWith(
                                                  color: Colors.blue,
                                                  fontSize: 14),
                                          isHasBorder: false,
                                        ),
                                        ShowFullInfo(
                                          text: "Xem chi tiết",
                                        )
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
