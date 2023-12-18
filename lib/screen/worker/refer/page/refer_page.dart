//
// Created by BlackRose on 12/17/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:eportal/bloc/admin/job_user_list_by_user_name_bloc.dart';
import 'package:eportal/bloc/admin/job_user_refer_list_bloc.dart';
import 'package:eportal/bloc/admin/job_user_refer_save_bloc.dart';
import 'package:eportal/enum/data_bloc_status.dart';
import 'package:eportal/event/admin/job_user_list_by_user_name_event.dart';
import 'package:eportal/event/admin/job_user_refer_list_event.dart';
import 'package:eportal/event/admin/job_user_refer_save_event.dart';
import 'package:eportal/model/api/request/admin/data/job_user_list_by_user_name_data_request.dart';
import 'package:eportal/model/api/request/admin/data/job_user_refer_list_data_request.dart';
import 'package:eportal/model/api/request/admin/job_user_list_by_user_name_request.dart';
import 'package:eportal/model/api/request/admin/job_user_refer_add_request.dart';
import 'package:eportal/model/api/request/admin/job_user_refer_delete_request.dart';
import 'package:eportal/model/api/request/admin/job_user_refer_list_request.dart';
import 'package:eportal/model/api/request/admin/job_user_refer_update_request.dart';
import 'package:eportal/model/api/response/admin/data/job_user_list_by_user_name_data_response.dart';
import 'package:eportal/model/api/response/admin/data/job_user_refer_list_data_response.dart';
import 'package:eportal/screen/worker/profile_add/page/profile_add_page.dart';
import 'package:eportal/screen/worker/profile_edit/page/profile_edit_page.dart';
import 'package:eportal/screen/worker/refer/widget/refer_widget_item.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_elevation.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/default_button/default_button.dart';
import 'package:eportal/widget/expandable_fab/expandable_fab.dart';
import 'package:eportal/widget/full_data_item/curriculum_vitae_item.dart';
import 'package:eportal/widget/input/capcha_input.dart';
import 'package:eportal/widget/input/field_input.dart';
import 'package:eportal/widget/input/search_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/admin/job_user_refer_add_bloc.dart';
import '../../../../extension/string_extension.dart';
import '../../../../model/api/request/admin/data/job_user_refer_add_data_request.dart';
import '../../../../model/api/request/admin/data/job_user_refer_delete_data_request.dart';
import '../../../../model/api/request/admin/data/job_user_refer_update_data_request.dart';

class ReferPage extends BasePage {
  JobUserListByUserNameDataResponse data;

  ReferPage({super.key, required this.data});

  @override
  State<StatefulWidget> createState() => _ReferPageState();
}

class _ReferPageState extends BasePageStateActive<ReferPage> {
  late JobUserReferListBloc jobUserReferListBloc;
  late JobUserReferSaveBloc jobUserReferSaveBloc;
  late JobUserReferAddBloc jobUserReferAddBloc;
  List<JobUserReferAddDataRequest> lstJobUserReferAddDataRequest =
      <JobUserReferAddDataRequest>[];

  List<JobUserReferDeleteRequest> lstJobUserReferDeleteRequest = [];
  List<JobUserReferAddRequest> lstJobUserReferAddRequest = [];
  List<JobUserReferUpdateRequest> lstJobUserReferUpdateRequest = [];

  @override
  void initBloc() {
    jobUserReferListBloc = JobUserReferListBloc();
    jobUserReferSaveBloc = JobUserReferSaveBloc();
    jobUserReferAddBloc = JobUserReferAddBloc();
    super.initBloc();
  }

  @override
  void initDataLoading() {
    callApi();
    super.initDataLoading();
  }

  @override
  void callApi() {
    jobUserReferListBloc.add(JobUserReferListEvent(
        request: JobUserReferListRequest(
            obj: JobUserReferListDataRequest(
                jobUserID: widget.data.jobUserID))));
  }

  @override
  String getPageTitle(BuildContext context) => "Người tham khảo";

  @override
  bool isHasAppBar(BuildContext context) => true;

  @override
  Widget? getFloatingActionButton(BuildContext context) =>
      ExpandableFab(initNumberGroup: 1, children: [
        ActionButton(
          icon: const Icon(Icons.add, color: Colors.white),
          onPressed: () {
            lstJobUserReferAddDataRequest.add(
                JobUserReferAddDataRequest(jobUserID: widget.data.jobUserID));
            setState(() {});
          },
        ),
      ]);

  @override
  Widget pageUI(BuildContext context) => BlocProvider(
        create: (_) => jobUserReferSaveBloc,
        child: BlocListener<JobUserReferSaveBloc, DataSingleState<Object>>(
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
                          jobUserID: widget.data.jobUserID,
                          id: e.id,
                          chucVu: e.chucVu,
                          email: e.email,
                          hoTen: e.hoTen,
                          moiQuanHe: e.moiQuanHe,
                          noiCongTac: e.noiCongTac,
                          soDienThoai: e.soDienThoai)));

                  setState(() {});
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        controller: scrollController,
                        itemCount: lstJobUserReferAddDataRequest.length,
                        itemBuilder: (BuildContext context, int index) =>
                            ReferWidgetItem(
                              data: lstJobUserReferAddDataRequest
                                  .elementAt(index),
                              onPressed: () {
                                var id = lstJobUserReferAddDataRequest
                                    .elementAt(index)
                                    .id;
                                if (!id.isNullOrWhiteSpace()) {
                                  lstJobUserReferDeleteRequest.add(
                                      JobUserReferDeleteRequest(
                                          obj: JobUserReferDeleteDataRequest(
                                              id: id)));
                                }
                                lstJobUserReferAddDataRequest.removeAt(index);
                                setState(() {});
                              },
                            )),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: CapchaInput(
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (value) => _send(context),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: DefaultButton(
                        text: 'Sửa',
                        onPressed: () => _send(context),
                      )),
                ],
              ),
            ),
          ),
        ),
      );

  _send(BuildContext context) {
    if (isValid()) {
      var lstJobUserReferAddRequest = lstJobUserReferAddDataRequest
          .where((element) => element.id.isNullOrWhiteSpace())
          .map((e) => JobUserReferAddRequest(obj: e))
          .toList();
      var lstJobUserReferUpdateRequest = lstJobUserReferAddDataRequest
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
      jobUserReferSaveBloc.add(JobUserReferSaveEvent(
        lstJobUserReferDeleteRequest: lstJobUserReferDeleteRequest,
        lstJobUserReferAddRequest: lstJobUserReferAddRequest,
        lstJobUserReferUpdateRequest: lstJobUserReferUpdateRequest,
      ));
    }
  }
}
