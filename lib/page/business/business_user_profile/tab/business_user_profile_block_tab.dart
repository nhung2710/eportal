





//
// Created by BlackRose on 08/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//

import 'package:eportal/bloc/admin/profile_black_list_bloc.dart';
import 'package:eportal/bloc/admin/work_view_list_bloc.dart';
import 'package:eportal/bloc/admin/work_view_list_bloc.dart';
import 'package:eportal/bloc/admin/work_view_list_bloc.dart';
import 'package:eportal/bloc/common_new/work_search_bloc.dart';
import 'package:eportal/event/admin/profile_black_list_event.dart';
import 'package:eportal/event/admin/work_view_list_event.dart';
import 'package:eportal/model/api/request/admin/data/profile_black_list_data_request.dart';
import 'package:eportal/model/api/request/admin/data/work_view_list_data_request.dart';
import 'package:eportal/model/api/request/admin/profile_black_list_request.dart';
import 'package:eportal/model/api/request/admin/work_view_list_request.dart';
import 'package:eportal/model/api/request/common_new/data/work_search_data_request.dart';
import 'package:eportal/model/api/request/common_new/work_search_request.dart';
import 'package:eportal/model/api/response/admin/data/job_user_list_by_user_name_data_response.dart';
import 'package:eportal/model/api/response/admin/data/job_user_send_data_response.dart';
import 'package:eportal/model/api/response/admin/data/profile_black_list_data_response.dart';
import 'package:eportal/model/api/response/admin/data/work_view_list_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/work_search_data_response.dart';
import 'package:eportal/page/base/page_state/base_page_keep_state.dart';
import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/base/page_widget/base_page_widget.dart';
import 'package:eportal/page/share/hiring_detail/page/hiring_detail_page.dart';
import 'package:eportal/page/share/hiring_search/page/hiring_search_filter_page.dart';
import 'package:eportal/page/share/hiring_search/widget/hiring_search_item.dart';
import 'package:eportal/page/share/profile_detail/page/profile_detail_page.dart';
import 'package:eportal/page/users/reference/page/reference_page.dart';
import 'package:eportal/page/users/user_profile_edit/page/user_profile_edit_page.dart';
import 'package:eportal/page/users/user_profile_history/page/user_profile_history_page.dart';
import 'package:eportal/page/users/user_work/widget/user_work_list_item.dart';
import 'package:eportal/page/users/user_work/widget/user_work_list_viewed_item.dart';
import 'package:eportal/page/users/user_work_apply/page/user_work_apply_page.dart';
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
import '../widget/business_user_profile_block_item.dart';

class BusinessUserProfileBlockTab extends BasePageWidget {
  const BusinessUserProfileBlockTab({super.key});

  @override
  State<StatefulWidget> createState() => BusinessUserProfileBlockTabState();
}

class BusinessUserProfileBlockTabState extends BasePageKeepState<BusinessUserProfileBlockTab> {
  late ProfileBlackListBloc profileBlackListBloc;
  late JobUserSendBloc jobUserSendBloc;
  JobUserSendEvent jobUserSendEvent = JobUserSendEvent(request: JobUserSendRequest(obj: JobUserSendDataRequest()));
  ProfileBlackListEvent profileBlackListEvent = ProfileBlackListEvent(request: ProfileBlackListRequest(obj: ProfileBlackListDataRequest()));
  TextEditingController textEditingController = TextEditingController();
  @override
  void initBloc() {
    jobUserSendBloc = JobUserSendBloc();
    profileBlackListBloc = ProfileBlackListBloc();
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    profileBlackListBloc.close();
    jobUserSendBloc.close();
  }

  @override
  void getMoreData() {
    // TODO: implement getMoreData
    profileBlackListEvent.request.obj.nextData();
    callApi();
  }

  @override
  void initDataLoading() {
    profileBlackListEvent.request.obj.reloadData();
    callApi();
  }

  @override
  double getBottomFloatingActionButtonBottom(BuildContext context) => 70;

  @override
  void callApi() {

    profileBlackListEvent.request.obj.tuKhoa = textEditingController.text;
    profileBlackListBloc.add(profileBlackListEvent);
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
            child: Expanded(
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
          ),

          Expanded(
            child: BlocProvider(
                create: (_) => profileBlackListBloc,
                child: BlocListener<ProfileBlackListBloc,
                    DataPageState<ProfileBlackListDataResponse>>(
                  listener: (BuildContext context,
                      DataPageState<ProfileBlackListDataResponse> state) {},
                  child: BlocBuilder<ProfileBlackListBloc,
                      DataPageState<ProfileBlackListDataResponse>>(
                    builder: (BuildContext context,
                        DataPageState<ProfileBlackListDataResponse> state) =>
                        handleDataPageState<ProfileBlackListDataResponse>(
                          state,
                              (context, state) => ListView(
                            shrinkWrap: true,
                            controller: scrollController,
                            children: state.map((e) => BusinessUserProfileBlockItem(data:  e,
                              onClickItem: (ProfileBlackListDataResponse value) => showChooseAction(value),
                            )).toList(),),
                        ),
                  ),
                )),
          ),
        ],
      ),
    ),
  );

  void showChooseAction(ProfileBlackListDataResponse value) {

    showBaseBottomSheet(children: [
      GestureDetector(
        onTap: () {
          Navigator.pop(context);
          nextPage((context) => ProfileDetailPage(profileId: value.id));
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