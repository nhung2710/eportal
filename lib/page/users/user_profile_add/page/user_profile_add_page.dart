//
// Created by BlackRose on 05/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//

import 'package:eportal/bloc/admin/job_user_add_bloc.dart';
import 'package:eportal/event/admin/job_user_add_event.dart';
import 'package:eportal/model/api/response/admin/data/job_user_add_data_response.dart';
import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/base/page_widget/base_page_widget.dart';
import 'package:eportal/page/users/user_profile_share/tab/user_profile_basic_tab.dart';
import 'package:eportal/page/users/user_profile_share/tab/user_profile_career_goals_tab.dart';
import 'package:eportal/page/users/user_profile_share/tab/user_profile_field_skills_tab.dart';
import 'package:eportal/page/users/user_profile_share/tab/user_profile_general_tab.dart';
import 'package:eportal/page/users/user_profile_share/tab/user_profile_level_tab.dart';
import 'package:eportal/page/users/user_profile_share/tab/user_profile_work_experience_tab.dart';
import 'package:eportal/page/widget/default_button.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/tab/custom_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../model/api/request/admin/data/job_user_add_data_request.dart';
import '../../../../model/api/request/admin/job_user_add_request.dart';
import '../../../widget/default_capcha_text_form_field.dart';

class UserProfileAddPage extends BasePageWidget {
  const UserProfileAddPage({super.key});

  @override
  State<StatefulWidget> createState() => UserProfileAddPageState();
}

class UserProfileAddPageState extends BasePageState<UserProfileAddPage> {
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
  late JobUserAddBloc jobUserAddBloc;
  JobUserAddEvent jobUserAddEvent =
      JobUserAddEvent(request: JobUserAddRequest(obj: JobUserAddDataRequest()));

  @override
  void initBloc() {
    jobUserAddBloc = JobUserAddBloc();
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    jobUserAddBloc.close();
  }

  @override
  void getMoreData() {}

  @override
  void initDataLoading() {}

  @override
  PreferredSizeWidget? getAppBar(BuildContext context) => defaultTabBar();

  @override
  void callApi() {
    jobUserAddEvent.request.obj.tieuDe =
        keyUserProfileBasicTabState.currentState?.titleController.text;
    jobUserAddEvent.request.obj.ngayDangTu =
        keyUserProfileBasicTabState.currentState?.fromDateController.text;
    jobUserAddEvent.request.obj.ngayDangDen =
        keyUserProfileBasicTabState.currentState?.toDateController.text;
    jobUserAddEvent.request.obj.tinhTp = keyUserProfileBasicTabState
        .currentState?.danhSachTinhTpDataResponse?.regionalID;
    jobUserAddEvent.request.obj.quanHuyen = keyUserProfileBasicTabState
        .currentState?.danhSachQuanHuyenDataResponse?.regionalID;
    jobUserAddEvent.request.obj.nganhNghe = keyUserProfileBasicTabState
        .currentState?.danhSachNganhNgheDataResponse?.careerID;
    jobUserAddEvent.request.obj.chucVuHienTai = keyUserProfileGeneralTabState
        .currentState?.danhSachChucVuDataResponseHienTai?.positionID;
    jobUserAddEvent.request.obj.chucVuMongMuon = keyUserProfileGeneralTabState
        .currentState?.danhSachChucVuDataResponseMongMuon?.positionID;
    jobUserAddEvent.request.obj.mucLuong = keyUserProfileGeneralTabState
        .currentState?.danhSachMucLuongDataResponse?.salaryID;
    jobUserAddEvent.request.obj.soNamKinhNghiem = keyUserProfileGeneralTabState
        .currentState?.danhSachKinhNghiemDataResponse?.experienceID;
    jobUserAddEvent.request.obj.trinhDo = keyUserProfileGeneralTabState
        .currentState?.danhSachTrinhDoDataResponse?.educationID;
    jobUserAddEvent.request.obj.nhuCau = keyUserProfileGeneralTabState
        .currentState?.danhSachNhuCauDataResponse?.needsID;
    jobUserAddEvent.request.obj.kyNang =
        keyUserProfileFieldSkillsTabState.currentState?.skillController.text;
    jobUserAddEvent.request.obj.kinhNghiemLV =
        keyUserProfileWorkExperienceTabState
            .currentState?.experienceController.text;
    jobUserAddEvent.request.obj.mucTieu = keyUserProfileCareerGoalsTabState
        .currentState?.objectiveController.text;
    jobUserAddEvent.request.obj.trinhDoHocVan =
        keyUserProfileLevelTabState.currentState?.educationController.text;

    jobUserAddBloc.add(jobUserAddEvent);
  }

  @override
  Widget pageUI(BuildContext context) => BlocProvider(
        create: (_) => jobUserAddBloc,
        child: BlocListener<JobUserAddBloc,
            DataSingleState<JobUserAddDataResponse>>(
          listener: (BuildContext context,
              DataSingleState<JobUserAddDataResponse> state) {
            handlerActionDataSingleState<JobUserAddDataResponse>(state, (obj) {
              showCenterMessage("Tạo hồ sơ thành công")
                  .then((value) => backPage(true));
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    "Tạo hồ sơ",
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
                  ),
                  "Thông tin chung": UserProfileGeneralTab(
                    key: keyUserProfileGeneralTabState,
                  ),
                  "Trình độ học vấn": UserProfileLevelTab(
                    key: keyUserProfileLevelTabState,
                  ),
                  "Kinh nghiệm làm việc": UserProfileWorkExperienceTab(
                    key: keyUserProfileWorkExperienceTabState,
                  ),
                  "Mục tiêu nghề nghiệp": UserProfileCareerGoalsTab(
                    key: keyUserProfileCareerGoalsTabState,
                  ),
                  "Kỹ năng sở trường": UserProfileFieldSkillsTab(
                    key: keyUserProfileFieldSkillsTabState,
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
                      text: 'Tạo',
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
