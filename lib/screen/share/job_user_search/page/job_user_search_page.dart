import 'dart:math';
import 'dart:convert' show utf8;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../../../bloc/common_new/danh_sach_doanh_nghiep_bloc.dart';
import '../../../../bloc/common_new/danh_sach_gioi_tinh_bloc.dart';
import '../../../../bloc/common_new/danh_sach_kinh_nghiem_bloc.dart';
import '../../../../bloc/common_new/danh_sach_muc_luong_bloc.dart';
import '../../../../bloc/common_new/danh_sach_quan_huyen_bloc.dart';
import '../../../../bloc/common_new/danh_sach_tinh_tp_bloc.dart';
import '../../../../bloc/common_new/danh_sach_trinh_do_bloc.dart';
import '../../../../bloc/common_new/job_user_search_bloc.dart';
import '../../../../bloc/common_new/ten_tinh_tp_bloc.dart';
import '../../../../bloc/common_new/work_search_bloc.dart';
import '../../../../event/common_new/danh_sach_kinh_nghiem_event.dart';
import '../../../../event/common_new/danh_sach_muc_luong_event.dart';
import '../../../../event/common_new/danh_sach_quan_huyen_event.dart';
import '../../../../event/common_new/danh_sach_tinh_tp_event.dart';
import '../../../../event/common_new/danh_sach_trinh_do_event.dart';
import '../../../../event/common_new/job_user_search_event.dart';
import '../../../../event/common_new/work_search_event.dart';
import '../../../../extension/string_extension.dart';
import '../../../../model/api/request/common_new/danh_sach_kinh_nghiem_request.dart';
import '../../../../model/api/request/common_new/danh_sach_muc_luong_request.dart';
import '../../../../model/api/request/common_new/danh_sach_quan_huyen_request.dart';
import '../../../../model/api/request/common_new/danh_sach_tinh_tp_request.dart';
import '../../../../model/api/request/common_new/danh_sach_trinh_do_request.dart';
import '../../../../model/api/request/common_new/data/common_new_data_request.dart';
import '../../../../model/api/request/common_new/data/danh_sach_quan_huyen_data_request.dart';
import '../../../../model/api/request/common_new/data/job_user_search_data_request.dart';
import '../../../../model/api/request/common_new/data/work_search_data_request.dart';
import '../../../../model/api/request/common_new/job_user_search_request.dart';
import '../../../../model/api/request/common_new/work_search_request.dart';
import '../../../../model/api/response/common_new/danh_sach_doanh_nghiep_response.dart';
import '../../../../model/api/response/common_new/danh_sach_kinh_nghiem_response.dart';
import '../../../../model/api/response/common_new/danh_sach_muc_luong_response.dart';
import '../../../../model/api/response/common_new/danh_sach_quan_huyen_response.dart';
import '../../../../model/api/response/common_new/danh_sach_tinh_tp_response.dart';
import '../../../../model/api/response/common_new/data/danh_sach_tinh_tp_data_response.dart';
import '../../../../model/api/response/common_new/job_user_search_response.dart';
import '../../../../model/api/response/common_new/work_search_response.dart';
import '../../../../model/share/chat_bot/chat_bot_message.dart';
import '../../../../state/base/base_state.dart';
import '../../../../style/app_text_style.dart';
import '../../../../widget/base/base_page.dart';
import '../../../../widget/drawer/filter_drawer.dart';
import '../../../../widget/expandable_fab/expandable_fab.dart';
import '../../empty_example/page/empty_example_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//
// Created by BlackRose on 13/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class JobUserSearchPage extends BasePage {
  const JobUserSearchPage({super.key});

  @override
  State<StatefulWidget> createState() => _JobUserSearchPageState();
}

class _JobUserSearchPageState extends BasePageState<JobUserSearchPage> {
  JobUserSearchBloc jobUserSearchBloc = JobUserSearchBloc();
  JobUserSearchRequest request =
      JobUserSearchRequest(obj: JobUserSearchDataRequest());
  TextEditingController textEditingController = TextEditingController();

  @override
  void initDataLoading() {
    jobUserSearchBloc.add(JobUserSearchEvent(request: request));
    super.initDataLoading();
  }

  @override
  Widget? getEndDrawer(BuildContext context) => FilterDrawer(
        data: request.obj,
      );

  @override
  Widget pageUI(BuildContext context) => Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 5, top: 5),
            color: Colors.white,
            child: TextFormField(
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
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.send,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    _findNews(context);
                  },
                ),
                labelText: 'Nội dung',
                counterText: "",
              ),
            ),
          ),
          Expanded(
            child: BlocProvider(
                create: (_) => jobUserSearchBloc,
                child: BlocListener<JobUserSearchBloc, BaseState>(
                  listener: (BuildContext context, BaseState state) {},
                  child: BlocBuilder<JobUserSearchBloc, BaseState>(
                    builder: (BuildContext context, BaseState state) =>
                        handlerBaseState<JobUserSearchResponse>(
                      state,
                      (context, state) => Column(
                        children: [
                          Container(
                            child: Text(state.toString()),
                          ),
                          Expanded(
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: state.data?.length ?? 0,
                                itemBuilder: (context, i) => GestureDetector(
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
                                        margin: const EdgeInsets.only(top: 5),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Text(
                                                "1",
                                                style: AppTextStyle.title
                                                    .copyWith(
                                                        color: Colors.blue,
                                                        overflow: TextOverflow
                                                            .visible,
                                                        fontWeight:
                                                            FontWeight.bold),
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

  @override
  String getPageTitle(BuildContext context) => "Hồ sơ";

  void _findNews(BuildContext context) {
    if (isValid()) {
      request.obj.tuKhoa = textEditingController.text;
      jobUserSearchBloc.add(JobUserSearchEvent(request: request));
    }
  }
}
