


//
// Created by BlackRose on 08/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//

import 'package:eportal/bloc/common_new/job_user_search_bloc.dart';
import 'package:eportal/bloc/common_new/work_search_bloc.dart';
import 'package:eportal/event/common_new/job_user_search_event.dart';
import 'package:eportal/model/api/request/common_new/data/job_user_search_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/work_search_data_request.dart';
import 'package:eportal/model/api/request/common_new/job_user_search_request.dart';
import 'package:eportal/model/api/request/common_new/work_search_request.dart';
import 'package:eportal/model/api/response/admin/data/job_user_list_by_user_name_data_response.dart';
import 'package:eportal/model/api/response/admin/data/job_user_send_data_response.dart';
import 'package:eportal/model/api/response/admin/data/profile_save_data_response.dart';
import 'package:eportal/model/api/response/admin/profile_save_response.dart';
import 'package:eportal/model/api/response/common_new/data/job_user_search_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/work_search_data_response.dart';
import 'package:eportal/page/base/page_state/base_page_keep_state.dart';
import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/base/page_widget/base_page_widget.dart';
import 'package:eportal/page/business/business_user_profile/widget/business_user_profile_applied_item.dart';
import 'package:eportal/page/business/business_user_profile/widget/business_user_profile_item.dart';
import 'package:eportal/page/share/hiring_detail/page/hiring_detail_page.dart';
import 'package:eportal/page/share/hiring_search/page/hiring_search_filter_page.dart';
import 'package:eportal/page/share/hiring_search/widget/hiring_search_item.dart';
import 'package:eportal/page/share/profile_detail/page/profile_detail_page.dart';
import 'package:eportal/page/share/profile_search/page/profile_search_filter_page.dart';
import 'package:eportal/page/users/reference/page/reference_page.dart';
import 'package:eportal/page/users/user_profile_edit/page/user_profile_edit_page.dart';
import 'package:eportal/page/users/user_profile_history/page/user_profile_history_page.dart';
import 'package:eportal/page/users/user_work/widget/user_work_list_item.dart';
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
import '../../../../bloc/admin/profile_save_bloc.dart';
import '../../../../event/admin/job_user_send_event.dart';
import '../../../../event/admin/profile_save_event.dart';
import '../../../../event/common_new/work_search_event.dart';
import '../../../../model/api/request/admin/data/job_user_send_data_request.dart';
import '../../../../model/api/request/admin/data/profile_save_data_request.dart';
import '../../../../model/api/request/admin/job_user_send_request.dart';
import '../../../../model/api/request/admin/profile_save_request.dart';
import '../../../../widget/base/base_page.dart';

class BusinessUserProfileTab extends BasePageWidget {
  const BusinessUserProfileTab({super.key});

  @override
  State<StatefulWidget> createState() => BusinessUserProfileTabState();
}

class BusinessUserProfileTabState extends BasePageKeepState<BusinessUserProfileTab> {
  late JobUserSearchBloc jobUserSearchBloc;
  late ProfileSaveBloc profileSaveBloc;
  ProfileSaveEvent profileSaveEvent = ProfileSaveEvent(request: ProfileSaveRequest(obj: ProfileSaveDataRequest()));
  JobUserSearchEvent jobUserSearchEvent = JobUserSearchEvent(request: JobUserSearchRequest(obj: JobUserSearchDataRequest()));
  TextEditingController textEditingController = TextEditingController();
  @override
  void initBloc() {
    jobUserSearchBloc = JobUserSearchBloc();
    profileSaveBloc = ProfileSaveBloc();
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    jobUserSearchBloc.close();

    profileSaveBloc.close();
  }

  @override
  void getMoreData() {
    // TODO: implement getMoreData
    jobUserSearchEvent.request.obj.nextData();
    callApi();
  }

  @override
  void initDataLoading() {
    jobUserSearchEvent.request.obj.reloadData();
    callApi();
  }

  @override
  double getBottomFloatingActionButtonBottom(BuildContext context) => 70;

  @override
  void callApi() {

    jobUserSearchEvent.request.obj.tuKhoa = textEditingController.text;
    jobUserSearchBloc.add(jobUserSearchEvent);
  }

  @override
  Widget pageUI(BuildContext context) => BlocProvider(
    create: (_) => profileSaveBloc,
    child: BlocListener<ProfileSaveBloc,
        DataSingleState<ProfileSaveDataResponse>>(
      listener: (BuildContext context,
          DataSingleState<ProfileSaveDataResponse> state) {
        handlerActionDataSingleState<ProfileSaveDataResponse>(state, (obj) {
          showCenterMessage("Lưu hồ sơ ứng tuyển thành công")
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
                      nextPage((context) => ProfileSearchFilterPage(data:jobUserSearchEvent)).then((value) {
                        if(value!=null) {
                          jobUserSearchEvent = value;
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
                create: (_) => jobUserSearchBloc,
                child: BlocListener<JobUserSearchBloc,
                    DataPageState<JobUserSearchDataResponse>>(
                  listener: (BuildContext context,
                      DataPageState<JobUserSearchDataResponse> state) {},
                  child: BlocBuilder<JobUserSearchBloc,
                      DataPageState<JobUserSearchDataResponse>>(
                    builder: (BuildContext context,
                        DataPageState<JobUserSearchDataResponse> state) =>
                        handleDataPageState<JobUserSearchDataResponse>(
                          state,
                              (context, state) => ListView(
                            shrinkWrap: true,
                            controller: scrollController,
                            children: state.map((e) => BusinessUserProfileItem(data: e,
                              onClickItem: (JobUserSearchDataResponse value) => showChooseAction(value),
                            )).toList(),),
                        ),
                  ),
                )),
          ),
        ],
      ),
    ),
  );

  void showChooseAction(JobUserSearchDataResponse value) {

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
          profileSaveEvent.request.obj.jobUserID =value.jobUserID;
          profileSaveEvent.request.obj.title = "Lưu hồ sơ";
          profileSaveBloc.add(profileSaveEvent);
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
          processDemo().then((value) => showCenterMessage("Đã đánh dấu đã lưu"));
        },
        child: ListTile(
          leading: const Icon(
            FontAwesomeIcons.floppyDisk,
            color: AppColor.colorOfIcon,
            size: AppSizeIcon.sizeOfNormal,
          ),
          title: Text(
            "Chặn",
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