//
// Created by BlackRose on 02/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//
import 'package:eportal/bloc/common_new/danh_sach_chuyen_muc_bloc.dart';
import 'package:eportal/bloc/common_new/news_search_bloc.dart';
import 'package:eportal/event/common_new/danh_sach_chuyen_muc_event.dart';
import 'package:eportal/event/common_new/news_search_event.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_chuyen_muc_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_chuyen_muc_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/news_search_data_request.dart';
import 'package:eportal/model/api/request/common_new/news_search_request.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_chuyen_muc_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/news_search_data_response.dart';
import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/base/page_widget/base_page_widget.dart';
import 'package:eportal/page/widget/default_button.dart';
import 'package:eportal/page/widget/default_search_form_field.dart';
import 'package:eportal/page/widget/default_select_item.dart';
import 'package:eportal/screen/share/news_detail/page/news_detail_page.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_size_icon.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/news/news_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../extension/string_extension.dart';

class NewsSearchFilterPage extends BasePageWidget {
  final NewsSearchEvent data;
  const NewsSearchFilterPage({super.key,required this.data});

  @override
  State<StatefulWidget> createState() => NewsSearchFilterPageState();
}

class NewsSearchFilterPageState extends BasePageState<NewsSearchFilterPage> {
  late DanhSachChuyenMucBloc danhSachChuyenMucBloc;
  DanhSachChuyenMucEvent danhSachChuyenMucEvent = DanhSachChuyenMucEvent(request: DanhSachChuyenMucRequest(obj: DanhSachChuyenMucDataRequest()));
  TextEditingController textEditingController = TextEditingController();

  @override
  void initBloc() {
    danhSachChuyenMucBloc = DanhSachChuyenMucBloc();
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    danhSachChuyenMucBloc.close();
  }

  @override
  void initDataLoading() {
    callApi();
  }

  @override
  void getMoreData() {
  }

  @override
  void callApi() {
    danhSachChuyenMucBloc.add(danhSachChuyenMucEvent);
  }

  @override
  PreferredSizeWidget? getAppBar(BuildContext context) => defaultTabBar();



  @override
  Widget pageUI(BuildContext context) => Container(
    margin: const EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text(
            "Chọn tiêu chí tìm kiếm",
            style: AppTextStyle.titlePage.copyWith(
                overflow: TextOverflow.visible,
                fontSize: 18,
                color: AppColor.colorOfIconActive),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 5, top: 5),
                    color: Colors.white,
                    child: BlocProvider(
                        create: (_) => danhSachChuyenMucBloc,
                        child: BlocListener<DanhSachChuyenMucBloc,
                            DataMultiState<DanhSachChuyenMucDataResponse>>(
                          listener: (BuildContext context,
                              DataMultiState<DanhSachChuyenMucDataResponse>
                              state) {},
                          child: BlocBuilder<DanhSachChuyenMucBloc,
                              DataMultiState<DanhSachChuyenMucDataResponse>>(
                            builder: (BuildContext context,
                                DataMultiState<DanhSachChuyenMucDataResponse>
                                state) =>
                                _buildViewSearchDanhSachChuyenMuc(
                                    context, state.data),
                          ),
                        )),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: DefaultButton(
                  onPressed: () => submitForm(),
                  text: 'Tìm kiếm',
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget _buildViewSearchDanhSachChuyenMuc(
      BuildContext context, List<DanhSachChuyenMucDataResponse> list) {
    var selectedItem = list.where((element) => element.categoryID == widget.data.request.obj.chuyenMuc).firstOrNull;
    return DefaultSelectItem<DanhSachChuyenMucDataResponse>(
        icon: FontAwesomeIcons.tag,
        selectedItem: selectedItem,
        list: list,
        itemAsString: (DanhSachChuyenMucDataResponse u) =>
            u.categoryName.supportHtml(),
        onChanged: (DanhSachChuyenMucDataResponse? data) {
          if (selectedItem != data) {
            selectedItem = data;
            widget.data.request.obj.chuyenMuc = data?.categoryID;
          }
        },
        labelText: "Loại tin tức",
        hintText: "Loại tin tức",
        title: "Loại tin tức");
  }

  void submitForm() {
    backPage(widget.data);
  }


}