import 'package:eportal/model/api/response/common_new/data/work_search_data_response.dart';
import 'package:eportal/screen/share/work_search_detail/page/work_search_detail_page.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_elevation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/common_new/work_search_bloc.dart';
import '../../../../event/common_new/work_search_event.dart';
import '../../../../extension/string_extension.dart';
import '../../../../model/api/request/common_new/data/work_search_data_request.dart';
import '../../../../model/api/request/common_new/work_search_request.dart';
import '../../../../model/api/response/common_new/work_search_response.dart';
import '../../../../state/base/base_state.dart';
import '../../../../style/app_text_style.dart';
import '../../../../widget/base/base_page.dart';
import '../../../../widget/drawer/filter_drawer.dart';
import '../../../../widget/input/search_input.dart';

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

  TextEditingController textEditingController = TextEditingController();

  @override
  void initDataLoading() {
    workSearchBloc.add(WorkSearchEvent(request: request));

    super.initDataLoading();
  }

  @override
  Widget? getEndDrawer(BuildContext context) => FilterDrawer(
        data: request.obj,
        key: localKey,
      );

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
              onFieldSubmitted: (value) => _findNews(context),
              icon: Icons.search,
              onTap: () {
                _findNews(context);
              },
              hintText: "Nội dung tìm kiếm",
            ),
          ),
          Expanded(
            child: BlocProvider(
                create: (_) => workSearchBloc,
                child: BlocListener<WorkSearchBloc, DataState<List<WorkSearchDataResponse>>>(
                  listener: (BuildContext context, DataState<List<WorkSearchDataResponse>> state) {},
                  child: BlocBuilder<WorkSearchBloc, DataState<List<WorkSearchDataResponse>>>(
                    builder: (BuildContext context, DataState<List<WorkSearchDataResponse>> state) =>
                        handleDataState<List<WorkSearchDataResponse>>(
                      state,
                      (context, state) => ListView.builder(
                              shrinkWrap: true,
                              itemCount: state!.length,
                              itemBuilder: (context, i) => GestureDetector(
                                    onTap: () => nextPage(
                                        (context) => WorkSearchDetailPage(
                                              workSearchDataResponse:
                                                  state!.elementAt(i),
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
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Text(
                                                state!
                                                    .elementAt(i)
                                                    .title
                                                    .supportHtml(),
                                                style: AppTextStyle.title
                                                    .copyWith(
                                                        overflow: TextOverflow
                                                            .visible,
                                                        color: AppColor
                                                            .colorOfIcon),
                                              ),
                                            ),
                                            const Divider(
                                              height: 1,
                                              color: AppColor.colorOfDrawer,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                      flex: 1,
                                                      child: Text(
                                                        "Ngành nghề",
                                                        style: AppTextStyle
                                                            .title
                                                            .copyWith(
                                                                overflow:
                                                                    TextOverflow
                                                                        .visible),
                                                      )),
                                                  const VerticalDivider(
                                                    thickness: 2,
                                                    width: 5,
                                                    color: Colors.transparent,
                                                  ),
                                                  Expanded(
                                                      flex: 3,
                                                      child: Text(
                                                        state!
                                                            .elementAt(i)
                                                            .description
                                                            .supportHtml(),
                                                        maxLines: 3,
                                                        style: AppTextStyle
                                                            .title
                                                            .copyWith(
                                                                color: AppColor
                                                                    .colorOfIcon),
                                                      )),
                                                ],
                                              ),
                                            ),
                                            const Divider(
                                              height: 1,
                                              color: AppColor.colorOfDrawer,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                      flex: 1,
                                                      child: Text(
                                                        "Tuổi",
                                                        style: AppTextStyle
                                                            .title
                                                            .copyWith(
                                                                overflow:
                                                                    TextOverflow
                                                                        .visible),
                                                      )),
                                                  const VerticalDivider(
                                                    thickness: 2,
                                                    width: 5,
                                                    color: Colors.transparent,
                                                  ),
                                                  Expanded(
                                                      flex: 3,
                                                      child: Text(
                                                        state!
                                                            .elementAt(i)
                                                            .ages
                                                            .supportHtml(),
                                                        maxLines: 3,
                                                        style: AppTextStyle
                                                            .title
                                                            .copyWith(
                                                                color: AppColor
                                                                    .colorOfIcon),
                                                      )),
                                                ],
                                              ),
                                            ),
                                            const Divider(
                                              height: 1,
                                              color: AppColor.colorOfDrawer,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                      flex: 1,
                                                      child: Text(
                                                        "Thời gian làm",
                                                        style: AppTextStyle
                                                            .title
                                                            .copyWith(
                                                                overflow:
                                                                    TextOverflow
                                                                        .visible),
                                                      )),
                                                  const VerticalDivider(
                                                    thickness: 2,
                                                    width: 5,
                                                    color: Colors.transparent,
                                                  ),
                                                  Expanded(
                                                      flex: 3,
                                                      child: Text(
                                                        state!
                                                            .elementAt(i)
                                                            .workTime
                                                            .supportHtml(),
                                                        maxLines: 3,
                                                        style: AppTextStyle
                                                            .title
                                                            .copyWith(
                                                                color: AppColor
                                                                    .colorOfIcon),
                                                      )),
                                                ],
                                              ),
                                            ),
                                            const Divider(
                                              height: 1,
                                              color: AppColor.colorOfDrawer,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                      flex: 1,
                                                      child: Text(
                                                        "Yêu cầu",
                                                        style: AppTextStyle
                                                            .title
                                                            .copyWith(
                                                                overflow:
                                                                    TextOverflow
                                                                        .visible),
                                                      )),
                                                  const VerticalDivider(
                                                    thickness: 2,
                                                    width: 5,
                                                    color: Colors.transparent,
                                                  ),
                                                  Expanded(
                                                      flex: 3,
                                                      child: Text(
                                                        state!
                                                            .elementAt(i)
                                                            .requirement
                                                            .supportHtml(),
                                                        maxLines: 3,
                                                        style: AppTextStyle
                                                            .title
                                                            .copyWith(
                                                                color: AppColor
                                                                    .colorOfIcon),
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
                )),
          ),
        ],
      );

  @override
  getBottomNavigationBar(BuildContext context) => null;

  @override
  String getPageTitle(BuildContext context) => "Tìm kiếm";

  void _findNews(BuildContext context) {
    if (isValid()) {
      request.obj.tuKhoa = textEditingController.text;
      workSearchBloc.add(WorkSearchEvent(request: request));
    }
  }
}
