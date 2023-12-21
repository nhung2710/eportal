// ignore_for_file: prefer_relative_imports

import 'package:eportal/bloc/admin/job_user_update_bloc.dart';
import 'package:eportal/event/admin/job_user_update_event.dart';
import 'package:eportal/model/api/request/admin/data/job_user_update_data_request.dart';
import 'package:eportal/model/api/request/admin/job_user_update_request.dart';
import 'package:eportal/model/api/response/admin/data/job_user_list_by_user_name_data_response.dart';
import 'package:eportal/model/api/response/admin/data/job_user_update_data_response.dart';
import 'package:eportal/screen/worker/profile_edit/tab/profile_edit_basic_tab.dart';
import 'package:eportal/screen/worker/profile_edit/tab/profile_edit_career_goals_tab.dart';
import 'package:eportal/screen/worker/profile_edit/tab/profile_edit_field_skills_tab.dart';
import 'package:eportal/screen/worker/profile_edit/tab/profile_edit_general_tab.dart';
import 'package:eportal/screen/worker/profile_edit/tab/profile_edit_level_tab.dart';
import 'package:eportal/screen/worker/profile_edit/tab/profile_edit_work_experience_tab.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/widget/default_button/default_button.dart';
import 'package:eportal/widget/input/capcha_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widget/base/base_page.dart';
import '../../../../widget/tab/custom_tab_view.dart';

//
// Created by BlackRose on 20/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class ProfileEditPage extends BasePage {
  JobUserListByUserNameDataResponse data;

  ProfileEditPage({super.key, required this.data});

  @override
  State<StatefulWidget> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends BasePageState<ProfileEditPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ProfileEditBasicTabState> keyProfileEditBasicTabState =
      GlobalKey<ProfileEditBasicTabState>();
  final GlobalKey<ProfileEditGeneralTabState> keyProfileEditGeneralTabState =
      GlobalKey<ProfileEditGeneralTabState>();
  final GlobalKey<ProfileEditLevelTabState> keyProfileEditLevelTabState =
      GlobalKey<ProfileEditLevelTabState>();
  final GlobalKey<ProfileEditWorkExperienceTabState>
      keyProfileEditWorkExperienceTabState =
      GlobalKey<ProfileEditWorkExperienceTabState>();
  final GlobalKey<ProfileEditCareerGoalsTabState>
      keyProfileEditCareerGoalsTabState =
      GlobalKey<ProfileEditCareerGoalsTabState>();
  final GlobalKey<ProfileEditFieldSkillsTabState>
      keyProfileEditFieldSkillsTabState =
      GlobalKey<ProfileEditFieldSkillsTabState>();
  final GlobalKey<CustomTabViewState> keyCustomTabViewState =
      GlobalKey<CustomTabViewState>();
  late JobUserUpdateBloc jobUserUpdateBloc;

  @override
  void callApi() {
    // TODO: implement callApi
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    jobUserUpdateBloc.close();
  }

  @override
  void getMoreData() {
    // TODO: implement getMoreData
  }

  @override
  void initBloc() {
    // TODO: implement initBloc
    jobUserUpdateBloc = JobUserUpdateBloc();
  }

  @override
  void initDataLoading() {
    // TODO: implement initDataLoading
  }

  @override
  String getPageTitle(BuildContext context) => "Sửa hồ sơ";

  @override
  Widget pageUI(BuildContext context) => BlocProvider(
        create: (_) => jobUserUpdateBloc,
        child: BlocListener<JobUserUpdateBloc,
            DataSingleState<List<JobUserUpdateDataResponse>>>(
          listener: (BuildContext context,
              DataSingleState<List<JobUserUpdateDataResponse>> state) {
            handlerActionDataSingleState<List<JobUserUpdateDataResponse>>(state,
                (obj) {
              showCenterMessage("Sửa hồ sơ thành công")
                  .then((value) => backPage());
            });
          },
          child: Column(
            children: [
              Expanded(
                child: CustomTabView(key: keyCustomTabViewState, tabViews: {
                  "Thông tin hồ sơ": ProfileEditBasicTab(
                    key: keyProfileEditBasicTabState,
                    data: widget.data,
                  ),
                  "Thông tin chung": ProfileEditGeneralTab(
                    key: keyProfileEditGeneralTabState,
                    data: widget.data,
                  ),
                  "Trình độ học vấn": ProfileEditLevelTab(
                    key: keyProfileEditLevelTabState,
                    data: widget.data,
                  ),
                  "Kinh nghiệm làm việc": ProfileEditWorkExperienceTab(
                    key: keyProfileEditWorkExperienceTabState,
                    data: widget.data,
                  ),
                  "Mục tiêu nghề nghiệp": ProfileEditCareerGoalsTab(
                    key: keyProfileEditCareerGoalsTabState,
                    data: widget.data,
                  ),
                  "Kỹ năng sở trường": ProfileEditFieldSkillsTab(
                    key: keyProfileEditFieldSkillsTabState,
                    data: widget.data,
                  ),
                }),
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
      );

  _validPage(BuildContext context, BasePageState? state, int page) {
    if (state?.isValid() == true) {
      return true;
    } else {
      keyCustomTabViewState.currentState?.nextPage(page);
      return false;
    }
  }

  _send(BuildContext context) {
    if (_validBeforeSend(context)) {
      jobUserUpdateBloc.add(JobUserUpdateEvent(
          request: JobUserUpdateRequest(
              obj: JobUserUpdateDataRequest(
                  tieuDe: keyProfileEditBasicTabState
                      .currentState?.titleController.text,
                  ngayDangTu: keyProfileEditBasicTabState
                      .currentState?.fromDateController.text,
                  ngayDangDen: keyProfileEditBasicTabState
                      .currentState?.toDateController.text,
                  tinhTp: keyProfileEditBasicTabState.currentState?.widget
                      .danhSachTinhTpDataResponse?.regionalID,
                  quanHuyen: keyProfileEditBasicTabState.currentState?.widget
                      .danhSachQuanHuyenDataResponse?.regionalID,
                  nganhNghe: keyProfileEditBasicTabState.currentState?.widget
                      .danhSachNganhNgheDataResponse?.careerID,
                  chucVuHienTai: keyProfileEditGeneralTabState.currentState
                      ?.widget.danhSachChucVuDataResponseHienTai?.positionID,
                  chucVuMongMuon: keyProfileEditGeneralTabState.currentState?.widget.danhSachChucVuDataResponseMongMuon?.positionID,
                  mucLuong: keyProfileEditGeneralTabState.currentState?.widget.danhSachMucLuongDataResponse?.salaryID,
                  soNamKinhNghiem: keyProfileEditGeneralTabState.currentState?.widget.danhSachKinhNghiemDataResponse?.experienceID,
                  trinhDo: keyProfileEditGeneralTabState.currentState?.widget.danhSachTrinhDoDataResponse?.educationID,
                  nhuCau: keyProfileEditGeneralTabState.currentState?.widget.danhSachNhuCauDataResponse?.needsID,
                  kyNang: keyProfileEditFieldSkillsTabState.currentState?.skillController.text,
                  kinhNghiemLV: keyProfileEditWorkExperienceTabState.currentState?.experienceController.text,
                  mucTieu: keyProfileEditCareerGoalsTabState.currentState?.objectiveController.text,
                  trinhDoHocVan: keyProfileEditLevelTabState.currentState?.educationController.text))));
    }
  }

  bool _validBeforeSend(BuildContext context) {
    if (_validPage(context, keyProfileEditBasicTabState.currentState, 0)) {
      if (_validPage(context, keyProfileEditGeneralTabState.currentState, 1)) {
        if (_validPage(context, keyProfileEditLevelTabState.currentState, 2)) {
          if (_validPage(
              context, keyProfileEditWorkExperienceTabState.currentState, 3)) {
            if (_validPage(
                context, keyProfileEditCareerGoalsTabState.currentState, 4)) {
              if (_validPage(
                  context, keyProfileEditFieldSkillsTabState.currentState, 5)) {
                if (isValid()) {
                  return true;
                }
              }
            }
          }
        }
      }
    }
    return false;
  }
}
