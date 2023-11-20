import 'dart:math';

import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_size_icon.dart';
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
import '../../../../bloc/common_new/home_news_list_bloc.dart';
import '../../../../bloc/common_new/news_search_bloc.dart';
import '../../../../bloc/common_new/ten_tinh_tp_bloc.dart';
import '../../../../event/common_new/danh_sach_kinh_nghiem_event.dart';
import '../../../../event/common_new/danh_sach_muc_luong_event.dart';
import '../../../../event/common_new/danh_sach_quan_huyen_event.dart';
import '../../../../event/common_new/danh_sach_tinh_tp_event.dart';
import '../../../../event/common_new/news_search_event.dart';
import '../../../../extension/string_extension.dart';
import '../../../../model/api/request/common_new/danh_sach_kinh_nghiem_request.dart';
import '../../../../model/api/request/common_new/danh_sach_muc_luong_request.dart';
import '../../../../model/api/request/common_new/danh_sach_quan_huyen_request.dart';
import '../../../../model/api/request/common_new/danh_sach_tinh_tp_request.dart';
import '../../../../model/api/request/common_new/data/common_new_data_request.dart';
import '../../../../model/api/request/common_new/data/danh_sach_quan_huyen_data_request.dart';
import '../../../../model/api/request/common_new/data/news_search_data_request.dart';
import '../../../../model/api/request/common_new/news_search_request.dart';
import '../../../../model/api/response/common_new/danh_sach_doanh_nghiep_response.dart';
import '../../../../model/api/response/common_new/danh_sach_kinh_nghiem_response.dart';
import '../../../../model/api/response/common_new/danh_sach_muc_luong_response.dart';
import '../../../../model/api/response/common_new/danh_sach_quan_huyen_response.dart';
import '../../../../model/api/response/common_new/danh_sach_tinh_tp_response.dart';
import '../../../../model/api/response/common_new/news_search_response.dart';
import '../../../../model/share/chat_bot/chat_bot_message.dart';
import '../../../../state/base/base_state.dart';
import '../../../../style/app_text_style.dart';
import '../../../../widget/base/base_page.dart';
import '../../../../widget/drawer/filter_drawer.dart';
import '../../../../widget/expandable_fab/expandable_fab.dart';
import '../../../../widget/image/image_loading.dart';
import '../../../../widget/news/news_widget.dart';
import '../../empty_example/page/empty_example_page.dart';

//
// Created by BlackRose on 13/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class NewsSearchPage extends BasePage {
  const NewsSearchPage({super.key});

  @override
  State<StatefulWidget> createState() => _NewsSearchPageState();
}

class _NewsSearchPageState extends BasePageState<NewsSearchPage> {
  NewsSearchBloc newsSearchBloc = NewsSearchBloc();
  NewsSearchRequest request =
      NewsSearchRequest(obj: NewsSearchDataRequest(tuKhoa: ""));
  TextEditingController textEditingController = TextEditingController();

  @override
  void initDataLoading() {
    newsSearchBloc.add(NewsSearchEvent(request: request));
    super.initDataLoading();
  }

  @override
  Widget pageUI(BuildContext context) => Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 5, top: 5),
            color: Colors.white,
            child: TextFormField(
              controller: textEditingController,
              maxLength: 100,
              textInputAction: TextInputAction.send,
              onFieldSubmitted: (value) => _findNews(context),
              decoration: InputDecoration(
                isDense: true,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.send,
                    color: AppColor.colorOfIcon,
                    size: AppSizeIcon.sizeOfNormal,
                  ),
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    _findNews(context);
                  },
                ),
                hintText: 'Tìm kiếm',
                counterText: "",
              ),
              style: AppTextStyle.normal,
            ),
          ),
          Expanded(
            child: BlocProvider(
                create: (_) => newsSearchBloc,
                child: BlocListener<NewsSearchBloc, BaseState>(
                  listener: (BuildContext context, BaseState state) {},
                  child: BlocBuilder<NewsSearchBloc, BaseState>(
                    builder: (BuildContext context, BaseState state) =>
                        handlerBaseState<NewsSearchResponse>(
                      state,
                      (context, state) => (state.data?.length ?? 0) == 0
                          ? buildNotFoundData(context)
                          : SingleChildScrollView(
                              child: Column(
                                children: [
                                  ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: state.data!.length,
                                      itemBuilder: (context, i) => NewsWidget(
                                            title:
                                                state.data?.elementAt(i).title,
                                            imageUrl: state.data
                                                ?.elementAt(i)
                                                .imagePath,
                                            content: state.data
                                                ?.elementAt(i)
                                                .summary,
                                          )),
                                ],
                              ),
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
  String getPageTitle(BuildContext context) => "Tìm kiếm";

  void _findNews(BuildContext context) {
    if (isValid()) {
      request.obj.tuKhoa = textEditingController.text;
      newsSearchBloc.add(NewsSearchEvent(request: request));
    }
  }
}
