//
// Created by BlackRose on 1/8/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//

import 'package:eportal/bloc/admin/job_user_list_by_user_name_bloc.dart';
import 'package:eportal/bloc/admin/work_search_by_user_name_bloc.dart';
import 'package:eportal/event/admin/job_user_list_by_user_name_event.dart';
import 'package:eportal/event/admin/work_search_by_user_name_event.dart';
import 'package:eportal/model/api/request/admin/data/job_user_list_by_user_name_data_request.dart';
import 'package:eportal/model/api/request/admin/data/work_search_by_user_name_data_request.dart';
import 'package:eportal/model/api/request/admin/job_user_list_by_user_name_request.dart';
import 'package:eportal/model/api/request/admin/work_search_by_user_name_request.dart';
import 'package:eportal/model/api/response/admin/data/job_user_list_by_user_name_data_response.dart';
import 'package:eportal/model/api/response/admin/data/work_search_by_user_name_data_response.dart';
import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/base/page_widget/base_page_widget.dart';
import 'package:eportal/page/business/business_job/page/business_job_filter_page.dart';
import 'package:eportal/page/business/business_job/widget/business_job_item.dart';
import 'package:eportal/page/users/user_profile/widget/user_profile_item.dart';
import 'package:eportal/page/widget/default_search_form_field.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_size_icon.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/expandable_fab/expandable_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BusinessJobPage extends BasePageWidget {
  const BusinessJobPage({super.key});

  @override
  State<StatefulWidget> createState() => BusinessJobPageState();
}

class BusinessJobPageState extends BasePageState<BusinessJobPage> {
  late WorkSearchByUserNameBloc workSearchByUserNameBloc;
  WorkSearchByUserNameEvent workSearchByUserNameEvent =
  WorkSearchByUserNameEvent(
      request: WorkSearchByUserNameRequest(
          obj: WorkSearchByUserNameDataRequest()));
  TextEditingController textEditingController = TextEditingController();
  @override
  void initBloc() {
    workSearchByUserNameBloc = WorkSearchByUserNameBloc();
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    workSearchByUserNameBloc.close();
  }

  @override
  void getMoreData() {
    workSearchByUserNameEvent.request.obj.nextData();
    callApi();
    // TODO: implement getMoreData
  }

  @override
  void initDataLoading() {
    workSearchByUserNameEvent.request.obj.reloadData();
    callApi();
  }

  @override
  double getBottomFloatingActionButtonBottom(BuildContext context) => 70;

  @override
  Widget? getFloatingActionButton(BuildContext context) => ExpandableFab(
    children: [
      ActionButton(
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            /*nextPage((context) => const UserProfileAddPage()).then((value) {
              if (value == true) {
                initDataLoading();
              }
            });*/
          }),
    ],
  );
  @override
  void callApi() {
    workSearchByUserNameBloc.add(workSearchByUserNameEvent);
  }

  @override
  Widget pageUI(BuildContext context) => Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Text(
                "Danh sách tin tuyển dụng",
                style: AppTextStyle.titlePage.copyWith(
                    overflow: TextOverflow.visible,
                    fontSize: 18,
                    color: AppColor.colorOfIconActive),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 5, top: 5),
              color: Colors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
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
                  Container(
                    margin: const EdgeInsets.only(top: 20,left: 10,right: 10),
                    child: GestureDetector(
                      onTap: () {
                        nextPage((context) => BusinessJobFilterPage(data:workSearchByUserNameEvent)).then((value) {
                          if(value!=null) {
                            workSearchByUserNameEvent = value;
                            initDataLoading();
                          }
                        });
                      },
                      child: const Icon(
                        FontAwesomeIcons.filter,
                        color: Colors.blueAccent,
                        size: AppSizeIcon.sizeOfNormal,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: BlocProvider(
                  create: (_) => workSearchByUserNameBloc,
                  child: BlocListener<WorkSearchByUserNameBloc,
                      DataPageState<WorkSearchByUserNameDataResponse>>(
                    listener: (BuildContext context,
                        DataPageState<WorkSearchByUserNameDataResponse>
                        state) {},
                    child: BlocBuilder<WorkSearchByUserNameBloc,
                        DataPageState<WorkSearchByUserNameDataResponse>>(
                      builder: (BuildContext context,
                          DataPageState<WorkSearchByUserNameDataResponse>
                          state) =>
                          handleDataPageState<
                              WorkSearchByUserNameDataResponse>(
                            state,
                                (context, state) => ListView(
                              shrinkWrap: true,
                              controller: scrollController,
                              children: state
                                  .map((e) => BusinessJobItem(
                                data: e,
                                onClickItem:
                                    (WorkSearchByUserNameDataResponse
                                value) =>
                                    showChooseAction(value),
                              ))
                                  .toList(),
                            ),
                          ),
                    ),
                  )),
            ),
          ],
        ),
      );

  showChooseAction(WorkSearchByUserNameDataResponse value) {
    
  }
}
