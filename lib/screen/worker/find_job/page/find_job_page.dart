import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/common_new/work_search_bloc.dart';
import '../../../../event/common_new/work_search_event.dart';
import '../../../../model/api/request/common_new/data/work_search_data_request.dart';
import '../../../../model/api/request/common_new/work_search_request.dart';
import '../../../../model/api/response/common_new/work_search_response.dart';
import '../../../../state/base/base_state.dart';
import '../../../../widget/input/search_input.dart';
import '../../../share/empty_example/page/empty_example_page.dart';

//
// Created by BlackRose on 11/9/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class FindJobPage extends BasePage {
  const FindJobPage({super.key});

  @override
  State<StatefulWidget> createState() => _FindJobPageState();
}

class _FindJobPageState extends BasePageStateActive<FindJobPage> {
  WorkSearchBloc workSearchBloc = WorkSearchBloc();
  WorkSearchRequest request = WorkSearchRequest(obj: WorkSearchDataRequest());

  TextEditingController textEditingController = TextEditingController();

  @override
  void initDataLoading() {
    workSearchBloc.add(WorkSearchEvent(request: request));

    super.initDataLoading();
  }

  @override
  bool isHasAppBar(BuildContext context) => false;

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
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Vui lòng nhập nội dung muốn gửi';
                }
                return null;
              },
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
                child: BlocListener<WorkSearchBloc, BaseState>(
                  listener: (BuildContext context, BaseState state) {},
                  child: BlocBuilder<WorkSearchBloc, BaseState>(
                    builder: (BuildContext context, BaseState state) =>
                        handlerBaseState<WorkSearchResponse>(
                      state,
                      (context, state) => (state.data?.length ?? 0) == 0
                          ? buildNotFoundData(context)
                          : Column(
                              children: [
                                Text(state.toString()),
                                Expanded(
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: state.data?.length ?? 0,
                                      itemBuilder: (context, i) =>
                                          GestureDetector(
                                            onTap: () => nextPage(
                                                (context) => EmptyExamplePage(
                                                      isHasAppBar: true,
                                                    )),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.white,
                                              ),
                                              padding: const EdgeInsets.all(10),
                                              margin:
                                                  const EdgeInsets.only(top: 5),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                      "1",
                                                      style: AppTextStyle.title
                                                          .copyWith(
                                                              color: AppColor
                                                                  .colorOfIcon,
                                                              overflow:
                                                                  TextOverflow
                                                                      .visible,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )),
                                ),
                              ],
                            ),
                    ),
                  ),
                )),
          ),
        ],
      );

  @override
  getBottomNavigationBar(BuildContext context) => null;

  void _findNews(BuildContext context) {
    if (isValid()) {
      request.obj.tuKhoa = textEditingController.text;
      workSearchBloc.add(WorkSearchEvent(request: request));
    }
  }
}
