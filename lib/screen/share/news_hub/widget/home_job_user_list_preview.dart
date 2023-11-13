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
import 'package:flutter_html/flutter_html.dart';

import '../../../../bloc/common_new/home_business_list_bloc.dart';
import '../../../../bloc/common_new/home_job_user_list_bloc.dart';
import '../../../../constant/application_constant.dart';
import '../../../../event/common_new/home_business_list_event.dart';
import '../../../../event/common_new/home_job_user_list_event.dart';
import '../../../../model/api/request/common_new/home_business_list_request.dart';
import '../../../../model/api/request/common_new/home_job_user_list_request.dart';
import '../../../../model/api/response/common_new/home_business_list_response.dart';
import '../../../../model/api/response/common_new/home_job_user_list_response.dart';
import '../../../../widget/image/image_loading.dart';

//
// Created by BlackRose on 13/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class HomeJobUserListPreview extends BasePage {
  const HomeJobUserListPreview({super.key});

  @override
  State<StatefulWidget> createState() => _HomeJobUserListPreviewState();
}

class _HomeJobUserListPreviewState
    extends BasePageStateActive<HomeJobUserListPreview> {
  HomeJobUserListBloc homeJobUserListBloc = HomeJobUserListBloc();

  @override
  bool isHasAppBar(BuildContext context) => false;

  @override
  void initDataLoading() {
    homeJobUserListBloc.add(HomeJobUserListEvent(
        request: HomeJobUserListRequest(
            obj: CommonNewData(top: ApplicationConstant.NUMBER_PREVIEW_ITEM))));
    super.initDataLoading();
  }

  @override
  Color currentBackgroundColor(BuildContext context) => Colors.transparent;

  @override
  double currentPadding(BuildContext context) => 0;

  @override
  Widget pageUI(BuildContext context) => BlocProvider(
      create: (_) => homeJobUserListBloc,
      child: BlocListener<HomeJobUserListBloc, BaseState>(
        listener: (BuildContext context, BaseState state) {},
        child: BlocBuilder<HomeJobUserListBloc, BaseState>(
          builder: (BuildContext context, BaseState state) =>
              handlerBaseState<HomeJobUserListResponse>(
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
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: ImageLoading(
                                        imageUrl: state.data!
                                            .elementAt(i)
                                            .logo
                                            .getImageUrl(),
                                        imageBuilder: (BuildContext context,
                                            ImageProvider<Object>
                                                imageProvider) {
                                          return ClipRRect(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(5.0)),
                                            child: Image(
                                              image: imageProvider,
                                              fit: BoxFit.fill,
                                            ),
                                          );
                                        },
                                      )),
                                  Expanded(
                                    flex: 4,
                                    child: Text(
                                      (state.data?.elementAt(i).businessVn)
                                          .supportHtml(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                ),
                ShowFullInfo(
                  onTap: () => nextPage((context) => EmptyExamplePage(
                        isHasAppBar: true,
                      )),
                ),
              ],
            ),
          ),
        ),
      ));
}
