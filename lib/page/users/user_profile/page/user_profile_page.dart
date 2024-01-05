//
// Created by BlackRose on 03/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//

import 'package:eportal/bloc/admin/job_user_list_by_user_name_bloc.dart';
import 'package:eportal/bloc/common_new/home_job_user_list_bloc.dart';
import 'package:eportal/event/admin/job_user_list_by_user_name_event.dart';
import 'package:eportal/model/api/request/admin/data/job_user_list_by_user_name_data_request.dart';
import 'package:eportal/model/api/request/admin/job_user_list_by_user_name_request.dart';
import 'package:eportal/model/api/response/admin/data/job_user_list_by_user_name_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/home_job_user_list_data_response.dart';
import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/share/profile/widget/profile_item.dart';
import 'package:eportal/page/share/profile_detail/page/profile_detail_page.dart';
import 'package:eportal/page/share/profile_search/page/profile_search_page.dart';
import 'package:eportal/page/users/reference/page/reference_page.dart';
import 'package:eportal/page/users/user_profile/widget/user_profile_item.dart';
import 'package:eportal/page/users/user_profile_add/page/user_profile_add_page.dart';
import 'package:eportal/page/users/user_profile_history/page/user_profile_history_page.dart';
import 'package:eportal/page/widget/default_search_form_field.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_size_icon.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/expandable_fab/expandable_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../event/common_new/home_job_user_list_event.dart';
import '../../../../model/api/request/common_new/data/home_job_user_list_data_request.dart';
import '../../../../model/api/request/common_new/home_job_user_list_request.dart';
import '../../../base/page_widget/base_page_widget.dart';
import '../../user_profile_edit/page/user_profile_edit_page.dart';
class UserProfilePage extends BasePageWidget {
  const UserProfilePage({super.key});

  @override
  State<StatefulWidget> createState() => UserProfilePageState();
}

class UserProfilePageState
    extends BasePageState<UserProfilePage> {
  late JobUserListByUserNameBloc jobUserListByUserNameBloc;
  JobUserListByUserNameEvent jobUserListByUserNameEvent = JobUserListByUserNameEvent(request: JobUserListByUserNameRequest(obj: JobUserListByUserNameDataRequest()));
  TextEditingController textEditingController = TextEditingController();
  @override
  void initBloc() {
    jobUserListByUserNameBloc = JobUserListByUserNameBloc();
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    jobUserListByUserNameBloc.close();
  }

  @override
  void getMoreData() {
    jobUserListByUserNameEvent.request.obj.nextData();
    callApi();
    // TODO: implement getMoreData
  }

  @override
  void initDataLoading() {
    jobUserListByUserNameEvent.request.obj.reloadData();
    callApi();
  }
  @override
  double getBottomFloatingActionButtonBottom(BuildContext context)  => 70;

  @override
  void callApi() {
    jobUserListByUserNameEvent.request.obj.tuKhoa = textEditingController.text;
    jobUserListByUserNameBloc.add(jobUserListByUserNameEvent);
  }

  @override
  Widget? getFloatingActionButton(BuildContext context) => ExpandableFab(
    children: [
      ActionButton(
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            nextPage((context) => const UserProfileAddPage());
          }

      ),
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
            "Hồ sơ của tôi",
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
              create: (_) => jobUserListByUserNameBloc,
              child: BlocListener<JobUserListByUserNameBloc,
                  DataPageState<JobUserListByUserNameDataResponse>>(
                listener: (BuildContext context,
                    DataPageState<JobUserListByUserNameDataResponse> state) {},
                child: BlocBuilder<JobUserListByUserNameBloc,
                    DataPageState<JobUserListByUserNameDataResponse>>(
                  builder: (BuildContext context,
                      DataPageState<JobUserListByUserNameDataResponse> state) =>
                      handleDataPageState<JobUserListByUserNameDataResponse>(
                        state,
                            (context, state) => ListView(
                              shrinkWrap: true,
                              controller: scrollController,
                              children: state.map((e) => UserProfileItem(data: e,
                                onClickItem: (JobUserListByUserNameDataResponse value) => showChooseAction(value),
                              )).toList(),),
                      ),
                ),
              )),
        ),
      ],
    ),
  );


  void showChooseAction(JobUserListByUserNameDataResponse value) {
    showBaseBottomSheet(
        children:[
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              nextPage((context) => UserProfileEditPage(data: value,));
            },
            child: ListTile(
              leading: const Icon(
                FontAwesomeIcons.penToSquare,
                color: AppColor.colorOfIcon,
                size: AppSizeIcon.sizeOfNormal,
              ),
              title: Text("Sửa hồ sơ",style: AppTextStyle.title.copyWith(overflow: TextOverflow.visible),),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              nextPage((context) => ReferencePage(userProfileId: value.jobUserID,));
            },
            child: ListTile(
              leading: const Icon(
                FontAwesomeIcons.userTag,
                color: AppColor.colorOfIcon,
                size: AppSizeIcon.sizeOfNormal,
              ),
              title: Text("Sửa người tham khảo",style: AppTextStyle.title.copyWith(overflow: TextOverflow.visible),),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              nextPage((context) => UserProfileHistoryPage(userProfileId: value.jobUserID));
            },
            child: ListTile(
              leading: const Icon(
                FontAwesomeIcons.clockRotateLeft,
                color: AppColor.colorOfIcon,
                size: AppSizeIcon.sizeOfNormal,
              ),
              title: Text("Xem lịch sử hồ sơ",style: AppTextStyle.title.copyWith(overflow: TextOverflow.visible),),
            ),
          )
        ]
    );
  }
}