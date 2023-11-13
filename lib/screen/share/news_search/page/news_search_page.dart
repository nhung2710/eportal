import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
import '../../../../event/common_new/news_search_event.dart';
import '../../../../model/api/request/common_new/data/news_search_data.dart';
import '../../../../model/api/request/common_new/news_search_request.dart';
import '../../../../model/api/response/common_new/news_search_response.dart';
import '../../../../model/share/chat_bot/chat_bot_message.dart';
import '../../../../state/base/base_state.dart';
import '../../../../style/app_text_style.dart';
import '../../../../widget/base/base_page.dart';
import '../../../../widget/expandable_fab/expandable_fab.dart';
import '../../../../widget/image/image_loading.dart';
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
  DanhSachTinhTpBloc danhSachTinhTpBloc = DanhSachTinhTpBloc();
  TenTinhTpBloc tenTinhTpBloc = TenTinhTpBloc();
  DanhSachQuanHuyenBloc danhSachQuanHuyenBloc = DanhSachQuanHuyenBloc();
  DanhSachDoanhNghiepBloc danhSachDoanhNghiepBloc = DanhSachDoanhNghiepBloc();
  DanhSachMucLuongBloc danhSachMucLuongBloc = DanhSachMucLuongBloc();
  DanhSachKinhNghiemBloc danhSachKinhNghiemBloc = DanhSachKinhNghiemBloc();
  DanhSachGioiTinhBloc danhSachGioiTinhBloc = DanhSachGioiTinhBloc();
  DanhSachTrinhDoBloc danhSachTrinhDoBloc = DanhSachTrinhDoBloc();
  NewsSearchRequest request = NewsSearchRequest(obj: NewsSearchData());
  TextEditingController textEditingController = TextEditingController();

  @override
  void initDataLoading() {
    newsSearchBloc.add(NewsSearchEvent(request: request));

    super.initDataLoading();
  }

  @override
  Widget? getFloatingActionButton(BuildContext context) =>
      ExpandableFab(children: [
        ActionButton(
          icon: const Icon(
            Icons.filter_alt,
            color: Colors.white,
          ),
          onPressed: () => _saveSettingFilter(context),
        ),
      ]);

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
                create: (_) => newsSearchBloc,
                child: BlocListener<NewsSearchBloc, BaseState>(
                  listener: (BuildContext context, BaseState state) {},
                  child: BlocBuilder<NewsSearchBloc, BaseState>(
                    builder: (BuildContext context, BaseState state) =>
                        handlerBaseState<NewsSearchResponse>(
                      state,
                      (context, state) => Column(
                        children: [
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
  String getPageTitle(BuildContext context) => "Tìm tin bài";

  void _findNews(BuildContext context) {
    if (isValid()) {}
  }

  _saveSettingFilter(BuildContext context) {
    initDataLoading();
  }
}
