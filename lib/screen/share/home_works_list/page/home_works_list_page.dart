import 'package:eportal/widget/base/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/common_new/home_works_list_bloc.dart';
import '../../../../constant/application_constant.dart';
import '../../../../event/common_new/home_works_list_event.dart';
import '../../../../extension/string_extension.dart';
import '../../../../model/api/request/common_new/data/common_new_data_request.dart';
import '../../../../model/api/request/common_new/home_works_list_request.dart';
import '../../../../model/api/response/common_new/home_works_list_response.dart';
import '../../../../state/base/base_state.dart';
import '../../../../style/app_color.dart';
import '../../../../style/app_text_style.dart';
import '../../empty_example/page/empty_example_page.dart';

//
// Created by BlackRose on 11/9/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class HomeWorksListPage extends BasePage {
  int flag;

  HomeWorksListPage({super.key, required this.flag});

  @override
  State<StatefulWidget> createState() => _HomeWorksListPageState();
}

class _HomeWorksListPageState extends BasePageStateActive<HomeWorksListPage> {
  HomeWorksListBloc homeWorksListCommonBloc = HomeWorksListBloc();

  @override
  String getPageTitle(BuildContext context) {
    switch (widget.flag) {
      case 0:
        return "Việc làm tốt nhất";
      case 1:
        return "Việc làm mới nhất";
      case 2:
        return "Việc làm lương cao";
    }
    return ApplicationConstant.EMPTY;
  }

  @override
  void initDataLoading() {
    homeWorksListCommonBloc.add(HomeWorksListEvent(
        request: HomeWorksListRequest(
            obj: CommonNewDataRequest(
                flag: widget.flag,
                top: ApplicationConstant.NUMBER_FULL_ITEM))));
    super.initDataLoading();
  }

  @override
  Widget pageUI(BuildContext context) => BlocProvider(
      create: (_) => homeWorksListCommonBloc,
      child: BlocListener<HomeWorksListBloc, BaseState>(
        listener: (BuildContext context, BaseState state) {},
        child: BlocBuilder<HomeWorksListBloc, BaseState>(
          builder: (BuildContext context, BaseState state) =>
              handlerBaseState<HomeWorksListResponse>(
            state,
            (context, state) => Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.data?.length ?? 0,
                      itemBuilder: (context, i) => GestureDetector(
                            onTap: () => nextPage((context) => EmptyExamplePage(
                                  isHasAppBar: true,
                                )),
                            child: Container(
                              margin: const EdgeInsets.only(top: 5),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                              ),
                              child: Text(
                                "${(state.data?.elementAt(i).title)?.replaceWhenNullOrWhiteSpace()}",
                                style: AppTextStyle.title.copyWith(
                                    overflow: TextOverflow.visible,
                                    color: AppColor.colorOfText,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),
                ),
              ],
            ),
          ),
        ),
      ));
}
