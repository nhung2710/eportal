import 'package:eportal/bloc/common_new/home_works_list_bloc.dart';
import 'package:eportal/event/common_new/home_works_list_event.dart';
import 'package:eportal/extension/string_extension.dart';
import 'package:eportal/model/api/request/common_new/data/common_new_data.dart';
import 'package:eportal/model/api/request/common_new/home_works_list_request.dart';
import 'package:eportal/model/api/response/common_new/home_works_list_response.dart';
import 'package:eportal/screen/share/empty_example/page/empty_example_page.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/show_full_info/show_full_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constant/application_constant.dart';
import '../../../../style/app_color.dart';
import '../../home_works_list/page/home_works_list_page.dart';

//
// Created by BlackRose on 11/9/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class HomeWorksListPreview extends BasePage {
  int flag;

  HomeWorksListPreview({super.key, required this.flag});

  @override
  State<StatefulWidget> createState() => _HomeWorksListPreviewState();
}

class _HomeWorksListPreviewState
    extends BasePageStateActive<HomeWorksListPreview> {
  HomeWorksListBloc homeWorksListCommonBloc = HomeWorksListBloc();

  @override
  bool isHasAppBar(BuildContext context) => false;

  @override
  void initDataLoading() {
    homeWorksListCommonBloc.add(HomeWorksListEvent(
        request: HomeWorksListRequest(
            obj: CommonNewData(
                flag: widget.flag,
                top: ApplicationConstant.NUMBER_PREVIEW_ITEM))));
    super.initDataLoading();
  }

  @override
  Color currentBackgroundColor(BuildContext context) => Colors.transparent;

  @override
  double currentPadding(BuildContext context) => 0;

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
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                (state.data?.elementAt(i).title)
                                    .replaceWhenNullOrWhiteSpace(),
                                style: AppTextStyle.title.copyWith(
                                    color: AppColor.colorOfText,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),
                ),
                ShowFullInfo(
                  onTap: () => nextPage((context) => HomeWorksListPage(
                        flag: widget.flag,
                      )),
                ),
              ],
            ),
          ),
        ),
      ));
}
