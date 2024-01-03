//
// Created by BlackRose on 03/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//

import 'package:eportal/bloc/common_new/work_search_bloc.dart';
import 'package:eportal/event/common_new/work_search_event.dart';
import 'package:eportal/model/api/request/common_new/data/work_search_data_request.dart';
import 'package:eportal/model/api/request/common_new/work_search_request.dart';
import 'package:eportal/model/api/response/common_new/data/work_search_data_response.dart';
import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/base/page_widget/base_page_widget.dart';
import 'package:eportal/page/share/hiring_search/page/hiring_search_filter_page.dart';
import 'package:eportal/page/share/hiring_search/widget/hiring_search_item.dart';
import 'package:eportal/page/widget/default_search_form_field.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_size_icon.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../hiring_detail/page/hiring_detail_page.dart';

class HiringSearchPage extends BasePageWidget {
  const HiringSearchPage({super.key});

  @override
  State<StatefulWidget> createState() => HiringSearchPageState();
}

class HiringSearchPageState
    extends BasePageState<HiringSearchPage> {
  late WorkSearchBloc workSearchBloc;
  WorkSearchEvent workSearchEvent = WorkSearchEvent(request: WorkSearchRequest(obj: WorkSearchDataRequest()));
  TextEditingController textEditingController = TextEditingController();

  @override
  void initBloc() {
    workSearchBloc = WorkSearchBloc();
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    workSearchBloc.close();
  }

  @override
  void getMoreData() {
    // TODO: implement getMoreData
    workSearchEvent.request.obj.nextData();
    callApi();
  }

  @override
  void initDataLoading() {
    workSearchEvent.request.obj.reloadData();
    callApi();
  }

  @override
  void callApi() {
    workSearchEvent.request.obj.tuKhoa = textEditingController.text;
    workSearchBloc.add(workSearchEvent);
  }
  @override
  PreferredSizeWidget? getAppBar(BuildContext context) => AppBar(
    title: Text(
      getPageTitle(context),
      style: AppTextStyle.titleAppbarPage,
    ),
    backgroundColor: AppColor.colorOfIcon,
    automaticallyImplyLeading: true,
    centerTitle: true,
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: GestureDetector(
            onTap: () {
              nextPage((context) => HiringSearchFilterPage(data:workSearchEvent)).then((value) {
                if(value!=null) {
                  workSearchEvent = value;
                  initDataLoading();
                }
              });
            },
            child: const Icon(
              FontAwesomeIcons.filter,
              color: Colors.white,
              size: AppSizeIcon.sizeOfNormal,
            ),
          ),
        ),
      )
    ],
  );


  @override
  Widget pageUI(BuildContext context) => Container(
    margin: const EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text(
            "Tìm kiếm tin tức tuyển dụng",
            style: AppTextStyle.titlePage.copyWith(
                overflow: TextOverflow.visible,
                fontSize: 18,
                color: AppColor.colorOfIconActive),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 5, top: 5),
          color: Colors.white,
          child: DefaultSearchFormField(
            controller: textEditingController,
            icon: FontAwesomeIcons.magnifyingGlass,
            maxLength: 100,
            textInputAction: TextInputAction.send,
            onFieldSubmitted: (value) => initDataLoading(),
            hintText: "Nội dung tìm kiếm",
            labelText: "Nội dung tìm kiếm",
            helperText: "Ví dụ: abc",
          ),
        ),
        Expanded(
          child: BlocProvider(
              create: (_) => workSearchBloc,
              child: BlocListener<WorkSearchBloc,
                  DataPageState<WorkSearchDataResponse>>(
                listener: (BuildContext context,
                    DataPageState<WorkSearchDataResponse> state) {},
                child: BlocBuilder<WorkSearchBloc,
                    DataPageState<WorkSearchDataResponse>>(
                  builder: (BuildContext context,
                      DataPageState<WorkSearchDataResponse> state) =>
                      handleDataPageState<WorkSearchDataResponse>(
                        state,
                            (context, state) => ListView(
                          shrinkWrap: true,
                          controller: scrollController,
                          children: state.map((e) => HiringSearchItem(data: e,
                            onClickItem: (WorkSearchDataResponse value) {
                              nextPage((context) => HiringDetailPage(hiringId: value.id,));
                            },
                          )).toList(),),
                      ),
                ),
              )),
        ),
      ],
    ),
  );

}