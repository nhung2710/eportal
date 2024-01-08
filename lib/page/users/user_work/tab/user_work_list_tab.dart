
//
// Created by BlackRose on 08/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//

import 'package:eportal/bloc/common_new/work_search_bloc.dart';
import 'package:eportal/model/api/request/common_new/data/work_search_data_request.dart';
import 'package:eportal/model/api/request/common_new/work_search_request.dart';
import 'package:eportal/model/api/response/admin/data/job_user_list_by_user_name_data_response.dart';
import 'package:eportal/model/api/response/admin/data/job_user_send_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/work_search_data_response.dart';
import 'package:eportal/page/base/page_state/base_page_keep_state.dart';
import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/base/page_widget/base_page_widget.dart';
import 'package:eportal/page/share/hiring_detail/page/hiring_detail_page.dart';
import 'package:eportal/page/share/hiring_search/page/hiring_search_filter_page.dart';
import 'package:eportal/page/share/hiring_search/widget/hiring_search_item.dart';
import 'package:eportal/page/users/reference/page/reference_page.dart';
import 'package:eportal/page/users/user_profile_edit/page/user_profile_edit_page.dart';
import 'package:eportal/page/users/user_profile_history/page/user_profile_history_page.dart';
import 'package:eportal/page/users/user_work/widget/user_work_list_item.dart';
import 'package:eportal/page/widget/default_search_form_field.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_size_icon.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../bloc/admin/job_user_send_bloc.dart';
import '../../../../event/admin/job_user_send_event.dart';
import '../../../../event/common_new/work_search_event.dart';
import '../../../../model/api/request/admin/data/job_user_send_data_request.dart';
import '../../../../model/api/request/admin/job_user_send_request.dart';
import '../../../../widget/base/base_page.dart';
import '../../user_work_apply/page/user_work_apply_page.dart';

class UserWorkListTab extends BasePageWidget {
  const UserWorkListTab({super.key});

  @override
  State<StatefulWidget> createState() => UserWorkListTabState();
}

class UserWorkListTabState extends BasePageKeepState<UserWorkListTab> {
  late WorkSearchBloc workSearchBloc;
  late JobUserSendBloc jobUserSendBloc;
  JobUserSendEvent jobUserSendEvent = JobUserSendEvent(request: JobUserSendRequest(obj: JobUserSendDataRequest()));
  WorkSearchEvent workSearchEvent = WorkSearchEvent(request: WorkSearchRequest(obj: WorkSearchDataRequest()));
  TextEditingController textEditingController = TextEditingController();
  @override
  void initBloc() {
    jobUserSendBloc = JobUserSendBloc();
    workSearchBloc = WorkSearchBloc();
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    workSearchBloc.close();
    jobUserSendBloc.close();
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
  double getBottomFloatingActionButtonBottom(BuildContext context) => 70;

  @override
  void callApi() {

    workSearchEvent.request.obj.tuKhoa = textEditingController.text;
    workSearchBloc.add(workSearchEvent);
  }

  @override
  Widget pageUI(BuildContext context) => BlocProvider(
    create: (_) => jobUserSendBloc,
    child: BlocListener<JobUserSendBloc,
        DataSingleState<JobUserSendDataResponse>>(
      listener: (BuildContext context,
          DataSingleState<JobUserSendDataResponse> state) {
        handlerActionDataSingleState<JobUserSendDataResponse>(state, (obj) {
          showCenterMessage("Nộp hồ sơ ứng tuyển thành công")
              .then((value) => initDataLoading());
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                      nextPage((context) => HiringSearchFilterPage(data:workSearchEvent)).then((value) {
                        if(value!=null) {
                          workSearchEvent = value;
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
                            children: state.map((e) => UserWorkListItem(data: e,
                              onClickItem: (WorkSearchDataResponse value) => showChooseAction(value),
                            )).toList(),),
                        ),
                  ),
                )),
          ),
        ],
      ),
    ),
  );

  void showChooseAction(WorkSearchDataResponse value) {

    showBaseBottomSheet(children: [
      GestureDetector(
        onTap: () {
          Navigator.pop(context);
          nextPage((context) => HiringDetailPage(hiringId: value.id));
        },
        child: ListTile(
          leading: const Icon(
            FontAwesomeIcons.tags,
            color: AppColor.colorOfIcon,
            size: AppSizeIcon.sizeOfNormal,
          ),
          title: Text(
            "Chi tiết",
            style: AppTextStyle.title.copyWith(overflow: TextOverflow.visible),
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.pop(context);
          processDemo().then((value) => showCenterMessage("Đã đánh dấu đã xem"));
        },
        child: ListTile(
          leading: const Icon(
            FontAwesomeIcons.tags,
            color: AppColor.colorOfIcon,
            size: AppSizeIcon.sizeOfNormal,
          ),
          title: Text(
            "Xem",
            style: AppTextStyle.title.copyWith(overflow: TextOverflow.visible),
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.pop(context);
          processDemo().then((value) => showCenterMessage("Đã đánh dấu đã lưu"));
        },
        child: ListTile(
          leading: const Icon(
            FontAwesomeIcons.floppyDisk,
            color: AppColor.colorOfIcon,
            size: AppSizeIcon.sizeOfNormal,
          ),
          title: Text(
            "Lưu lại",
            style: AppTextStyle.title.copyWith(overflow: TextOverflow.visible),
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.pop(context);
          nextPage((context) => const UserWorkApplyPage()).then((result){
            if(result!=null){
              jobUserSendEvent.request.obj.jobUserID = result.jobUserID;
              jobUserSendEvent.request.obj.workID = value.workID;
              jobUserSendBloc.add(jobUserSendEvent);
            }
          });
        },
        child: ListTile(
          leading: const Icon(
            FontAwesomeIcons.paperPlane,
            color: AppColor.colorOfIcon,
            size: AppSizeIcon.sizeOfNormal,
          ),
          title: Text(
            "Ứng tuyển",
            style: AppTextStyle.title.copyWith(overflow: TextOverflow.visible),
          ),
        ),
      ),
    ]);
  }
}