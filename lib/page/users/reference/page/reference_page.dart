//
// Created by BlackRose on 04/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//
import 'package:eportal/bloc/admin/job_user_refer_list_bloc.dart';
import 'package:eportal/bloc/admin/job_user_refer_save_bloc.dart';
import 'package:eportal/enum/data_bloc_status.dart';
import 'package:eportal/event/admin/job_user_refer_save_event.dart';
import 'package:eportal/model/api/request/admin/data/job_user_refer_add_data_request.dart';
import 'package:eportal/model/api/request/admin/data/job_user_refer_delete_data_request.dart';
import 'package:eportal/model/api/request/admin/data/job_user_refer_update_data_request.dart';
import 'package:eportal/model/api/request/admin/job_user_refer_add_request.dart';
import 'package:eportal/model/api/request/admin/job_user_refer_delete_request.dart';
import 'package:eportal/model/api/request/admin/job_user_refer_update_request.dart';
import 'package:eportal/model/api/response/admin/data/job_user_refer_list_data_response.dart';
import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/base/page_widget/base_page_widget.dart';
import 'package:eportal/page/users/reference/widget/reference_item.dart';
import 'package:eportal/page/users/user_profile/widget/user_profile_item.dart';
import 'package:eportal/page/widget/default_button.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_size_icon.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/expandable_fab/expandable_fab.dart';
import 'package:eportal/widget/input/capcha_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../event/admin/job_user_refer_list_event.dart';
import '../../../../extension/string_extension.dart';
import '../../../../model/api/request/admin/data/job_user_refer_list_data_request.dart';
import '../../../../model/api/request/admin/job_user_refer_list_request.dart';
import '../../../../state/base/base_state.dart';
import '../../../widget/default_capcha_text_form_field.dart';

class ReferencePage extends BasePageWidget {
  final String? userProfileId;
  const ReferencePage({super.key,this.userProfileId});

  @override
  State<StatefulWidget> createState() => ReferencePageState();
}

class ReferencePageState
    extends BasePageState<ReferencePage> {
  late JobUserReferSaveBloc jobUserReferSaveBloc;
  late JobUserReferListBloc jobUserReferListBloc;
  JobUserReferSaveEvent jobUserReferSaveEvent = JobUserReferSaveEvent(lstJobUserReferDeleteRequest: [], lstJobUserReferAddRequest: [], lstJobUserReferUpdateRequest: []);
  JobUserReferListEvent jobUserReferListEvent = JobUserReferListEvent(request: JobUserReferListRequest(obj: JobUserReferListDataRequest()));

  TextEditingController textEditingController = TextEditingController();

  List<JobUserReferAddDataRequest> lstJobUserReferAddDataRequest = [];

  @override
  void initBloc() {
    jobUserReferSaveBloc = JobUserReferSaveBloc();
    jobUserReferListBloc = JobUserReferListBloc();
    jobUserReferListEvent.request.obj.jobUserID = widget.userProfileId;
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    jobUserReferListBloc.close();
    jobUserReferSaveBloc.close();

  }

  @override
  void getMoreData() {
    // TODO: implement getMoreData
  }

  @override
  void initDataLoading() {
    callApi();
  }
  @override
  double getBottomFloatingActionButtonBottom(BuildContext context)  => 100;

  @override
  PreferredSizeWidget? getAppBar(BuildContext context) => defaultTabBar();
  @override
  void callApi() {
    jobUserReferListBloc.add(jobUserReferListEvent);
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
            lstJobUserReferAddDataRequest.add(
                JobUserReferAddDataRequest(jobUserID: widget.userProfileId));
            setState(() {});
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
            "Sửa người tham khảo",
            style: AppTextStyle.titlePage.copyWith(
                overflow: TextOverflow.visible,
                fontSize: 18,
                color: AppColor.colorOfIconActive),
          ),
        ),
        Expanded(
          child: BlocProvider(
              create: (_) => jobUserReferSaveBloc,
              child: BlocListener<JobUserReferSaveBloc,
                  DataSingleState<Object>>(
                listener: (BuildContext context, state) {
                  if (state.status == DataBlocStatus.success) {
                    showCenterMessage("Sửa người tham khảo thành công")
                        .then((value) => backPage());
                  }
                  if (state.status == DataBlocStatus.error) {
                    showCenterError(
                        "Có lỗi trong quá trình sửa vui lòng thử lại sau");
                  }
                },
                child: BlocProvider(
                  create: (_) => jobUserReferListBloc,
                  child: BlocListener<JobUserReferListBloc,
                      DataMultiState<JobUserReferListDataResponse>>(
                    listener: (BuildContext context, state) {
                      if (state.status == DataBlocStatus.success) {
                        lstJobUserReferAddDataRequest.clear();
                        lstJobUserReferAddDataRequest.addAll(state.data.map((e) =>
                            JobUserReferAddDataRequest(
                                jobUserID: widget.userProfileId,
                                id: e.id,
                                chucVu: e.chucVu,
                                email: e.email,
                                hoTen: e.hoTen,
                                moiQuanHe: e.moiQuanHe,
                                noiCongTac: e.noiCongTac,
                                soDienThoai: e.soDienThoai)).toList());

                        setState(() {});
                      }
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ListView(
                            shrinkWrap: true,
                            controller: scrollController,
                            children: lstJobUserReferAddDataRequest.map((e) => ReferenceItem(data: e,
                              onClickItem: (JobUserReferAddDataRequest value) {  },
                              onDeleteItem: (JobUserReferAddDataRequest value) => removeItem(value),
                            )).toList(),),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: CapchaInput(
                            textInputAction: TextInputAction.done,
                            onFieldSubmitted: (value) => submitData(context),
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: Align(
                              alignment: Alignment.center,
                              child: DefaultButton(
                                text: 'Sửa',
                                onPressed: () => submitData(context),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              )),
        ),
      ],
    ),
  );


  void showChooseAction(JobUserReferListDataResponse value) {
    showBaseBottomSheet(
        children:[
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
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

  void submitData(BuildContext context) {
    if(isValid()){
      jobUserReferSaveEvent.lstJobUserReferAddRequest = lstJobUserReferAddDataRequest
          .where((element) => element.id.isNullOrWhiteSpace())
          .map((e) => JobUserReferAddRequest(obj: e))
          .toList();
      jobUserReferSaveEvent.lstJobUserReferUpdateRequest = lstJobUserReferAddDataRequest
          .where((element) => !element.id.isNullOrWhiteSpace())
          .map((e) => JobUserReferUpdateRequest(
          obj: JobUserReferUpdateDataRequest(
            id: e.id,
            soDienThoai: e.soDienThoai,
            noiCongTac: e.noiCongTac,
            moiQuanHe: e.moiQuanHe,
            hoTen: e.hoTen,
            email: e.email,
            chucVu: e.chucVu,
            jobUserID: e.jobUserID,
          )))
          .toList();
      jobUserReferSaveBloc.add(jobUserReferSaveEvent);
    }
  }

  removeItem(JobUserReferAddDataRequest value) {

    var id = value.id;
    if (!id.isNullOrWhiteSpace()) {
      jobUserReferSaveEvent.lstJobUserReferDeleteRequest.add(JobUserReferDeleteRequest(obj: JobUserReferDeleteDataRequest(id: value.id)));
    }
    lstJobUserReferAddDataRequest.remove(value);
    setState(() {});
  }
}