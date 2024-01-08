//
// Created by BlackRose on 05/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//

import 'package:eportal/bloc/admin/job_user_update_bloc.dart';
import 'package:eportal/model/api/response/admin/data/job_user_list_by_user_name_data_response.dart';
import 'package:eportal/model/api/response/admin/data/job_user_update_data_response.dart';
import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/base/page_widget/base_page_widget.dart';
import 'package:eportal/page/users/user_profile_share/tab/user_profile_basic_tab.dart';
import 'package:eportal/page/users/user_profile_share/tab/user_profile_career_goals_tab.dart';
import 'package:eportal/page/users/user_profile_share/tab/user_profile_field_skills_tab.dart';
import 'package:eportal/page/users/user_profile_share/tab/user_profile_general_tab.dart';
import 'package:eportal/page/users/user_profile_share/tab/user_profile_level_tab.dart';
import 'package:eportal/page/users/user_profile_share/tab/user_profile_work_experience_tab.dart';
import 'package:eportal/page/widget/default_button.dart';
import 'package:eportal/page/widget/default_capcha_text_form_field.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/tab/custom_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../event/admin/job_user_update_event.dart';
import '../../../../model/api/request/admin/data/job_user_update_data_request.dart';
import '../../../../model/api/request/admin/job_user_update_request.dart';

class UserProfileEditPage extends BasePageWidget {
  final JobUserListByUserNameDataResponse data;

  const UserProfileEditPage({super.key, required this.data});

  @override
  State<StatefulWidget> createState() => UserProfileEditPageState();
}

class UserProfileEditPageState extends BasePageState<UserProfileEditPage> {
  late JobUserUpdateBloc jobUserUpdateBloc;
  JobUserUpdateEvent jobUserUpdateEvent = JobUserUpdateEvent(
      request: JobUserUpdateRequest(obj: JobUserUpdateDataRequest()));
  final GlobalKey<UserProfileBasicTabState> keyUserProfileBasicTabState =
      GlobalKey<UserProfileBasicTabState>();
  final GlobalKey<UserProfileGeneralTabState> keyUserProfileGeneralTabState =
      GlobalKey<UserProfileGeneralTabState>();
  final GlobalKey<UserProfileLevelTabState> keyUserProfileLevelTabState =
      GlobalKey<UserProfileLevelTabState>();
  final GlobalKey<UserProfileWorkExperienceTabState>
      keyUserProfileWorkExperienceTabState =
      GlobalKey<UserProfileWorkExperienceTabState>();
  final GlobalKey<UserProfileCareerGoalsTabState>
      keyUserProfileCareerGoalsTabState =
      GlobalKey<UserProfileCareerGoalsTabState>();
  final GlobalKey<UserProfileFieldSkillsTabState>
      keyUserProfileFieldSkillsTabState =
      GlobalKey<UserProfileFieldSkillsTabState>();

  @override
  void initBloc() {
    jobUserUpdateBloc = JobUserUpdateBloc();
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    jobUserUpdateBloc.close();
  }

  @override
  void getMoreData() {}

  @override
  void initDataLoading() {}

  @override
  PreferredSizeWidget? getAppBar(BuildContext context) => defaultTabBar();

  @override
  void callApi() {
    jobUserUpdateEvent.request.obj.tieuDe =
        keyUserProfileBasicTabState.currentState?.titleController.text;
    jobUserUpdateEvent.request.obj.ngayDangTu =
        keyUserProfileBasicTabState.currentState?.fromDateController.text;
    jobUserUpdateEvent.request.obj.ngayDangDen =
        keyUserProfileBasicTabState.currentState?.toDateController.text;
    jobUserUpdateEvent.request.obj.tinhTp = keyUserProfileBasicTabState
        .currentState?.danhSachTinhTpDataResponse?.regionalID;
    jobUserUpdateEvent.request.obj.quanHuyen = keyUserProfileBasicTabState
        .currentState?.danhSachQuanHuyenDataResponse?.regionalID;
    jobUserUpdateEvent.request.obj.nganhNghe = keyUserProfileBasicTabState
        .currentState?.danhSachNganhNgheDataResponse?.careerID;
    jobUserUpdateEvent.request.obj.chucVuHienTai = keyUserProfileGeneralTabState
        .currentState?.danhSachChucVuDataResponseHienTai?.positionID;
    jobUserUpdateEvent.request.obj.chucVuMongMuon =
        keyUserProfileGeneralTabState
            .currentState?.danhSachChucVuDataResponseMongMuon?.positionID;
    jobUserUpdateEvent.request.obj.mucLuong = keyUserProfileGeneralTabState
        .currentState?.danhSachMucLuongDataResponse?.salaryID;
    jobUserUpdateEvent.request.obj.soNamKinhNghiem =
        keyUserProfileGeneralTabState
            .currentState?.danhSachKinhNghiemDataResponse?.experienceID;
    jobUserUpdateEvent.request.obj.trinhDo = keyUserProfileGeneralTabState
        .currentState?.danhSachTrinhDoDataResponse?.educationID;
    jobUserUpdateEvent.request.obj.nhuCau = keyUserProfileGeneralTabState
        .currentState?.danhSachNhuCauDataResponse?.needsID;
    jobUserUpdateEvent.request.obj.kyNang =
        keyUserProfileFieldSkillsTabState.currentState?.skillController.text;
    jobUserUpdateEvent.request.obj.kinhNghiemLV =
        keyUserProfileWorkExperienceTabState
            .currentState?.experienceController.text;
    jobUserUpdateEvent.request.obj.mucTieu = keyUserProfileCareerGoalsTabState
        .currentState?.objectiveController.text;
    jobUserUpdateEvent.request.obj.trinhDoHocVan =
        keyUserProfileLevelTabState.currentState?.educationController.text;

    jobUserUpdateBloc.add(jobUserUpdateEvent);
  }

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
                  .then((value) => backPage(true));
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Sửa hồ sơ",
                    style: AppTextStyle.titlePage.copyWith(
                        overflow: TextOverflow.visible,
                        fontSize: 18,
                        color: AppColor.colorOfIconActive),
                  ),
                ),
              ),
              Expanded(
                child: CustomTabView(tabViews: {
                  "Thông tin hồ sơ": UserProfileBasicTab(
                    key: keyUserProfileBasicTabState,
                    data: widget.data,
                  ),
                  "Thông tin chung": UserProfileGeneralTab(
                    key: keyUserProfileGeneralTabState,
                    data: widget.data,
                  ),
                  "Trình độ học vấn": UserProfileLevelTab(
                    key: keyUserProfileLevelTabState,
                    data: widget.data,
                  ),
                  "Kinh nghiệm làm việc": UserProfileWorkExperienceTab(
                    key: keyUserProfileWorkExperienceTabState,
                    data: widget.data,
                  ),
                  "Mục tiêu nghề nghiệp": UserProfileCareerGoalsTab(
                    key: keyUserProfileCareerGoalsTabState,
                    data: widget.data,
                  ),
                  "Kỹ năng sở trường": UserProfileFieldSkillsTab(
                    key: keyUserProfileFieldSkillsTabState,
                    data: widget.data,
                  ),
                }),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: DefaultCapchaTextFormField(
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (value) => submitForm(),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    margin: const EdgeInsets.all(10),
                    child: DefaultButton(
                      text: 'Sửa',
                      onPressed: () => submitForm(),
                    )),
              ),
            ],
          ),
        ),
      );

  bool _validPage(BuildContext context, BasePageState? state) {
    if (state != null) {
      return state.isValid();
    }
    return true;
  }

  void submitForm() {
    if (isValid()) {
      if (_validPage(context, keyUserProfileBasicTabState.currentState)) {
        if (_validPage(context, keyUserProfileGeneralTabState.currentState)) {
          if (_validPage(context, keyUserProfileLevelTabState.currentState)) {
            if (_validPage(
                context, keyUserProfileWorkExperienceTabState.currentState)) {
              if (_validPage(
                  context, keyUserProfileCareerGoalsTabState.currentState)) {
                if (_validPage(
                    context, keyUserProfileFieldSkillsTabState.currentState)) {
                  callApi();
                }
              }
            }
          }
        }
      }
    }
  }
}
