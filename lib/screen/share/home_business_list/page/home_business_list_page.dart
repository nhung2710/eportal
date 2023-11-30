import 'package:eportal/model/api/request/common_new/data/home_business_list_data_request.dart';
import 'package:eportal/model/api/response/common_new/data/home_business_list_data_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/common_new/home_business_list_bloc.dart';
import '../../../../event/common_new/home_business_list_event.dart';
import '../../../../extension/string_extension.dart';
import '../../../../model/api/request/common_new/home_business_list_request.dart';
import '../../../../state/base/base_state.dart';
import '../../../../style/app_color.dart';
import '../../../../style/app_text_style.dart';
import '../../../../widget/base/base_page.dart';
import '../../empty_example/page/empty_example_page.dart';

//
// Created by BlackRose on 14/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class HomeBusinessListPage extends BasePage {
  HomeBusinessListPage({super.key});

  @override
  State<StatefulWidget> createState() => _HomeBusinessListPageState();
}

class _HomeBusinessListPageState
    extends BasePageStateActive<HomeBusinessListPage> {
  HomeBusinessListBloc homeBusinessListBloc = HomeBusinessListBloc();

  @override
  String getPageTitle(BuildContext context) {
    return "Danh sách công ty tuyển dụng";
  }

  @override
  void initDataLoading() {
    homeBusinessListBloc.add(HomeBusinessListEvent(
        request: HomeBusinessListRequest(obj: HomeBusinessListDataRequest())));
    super.initDataLoading();
  }

  @override
  Widget pageUI(BuildContext context) => BlocProvider(
      create: (_) => homeBusinessListBloc,
      child: BlocListener<HomeBusinessListBloc,
          DataMultiState<HomeBusinessListDataResponse>>(
        listener: (BuildContext context,
            DataMultiState<HomeBusinessListDataResponse> state) {},
        child: BlocBuilder<HomeBusinessListBloc,
            DataMultiState<HomeBusinessListDataResponse>>(
          builder: (BuildContext context,
                  DataMultiState<HomeBusinessListDataResponse> state) =>
              handleDataMultiState<HomeBusinessListDataResponse>(
            state,
            (context, state) => Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state!.length,
                      itemBuilder: (context, i) => GestureDetector(
                            onTap: () => nextPage((context) => EmptyExamplePage(
                                  isHasAppBar: true,
                                )),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                              ),
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.only(top: 5),
                              child: Text(
                                "${(state!.elementAt(i).businessVn)?.supportHtml()}",
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
