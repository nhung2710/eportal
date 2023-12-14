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
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/default_button/default_button.dart';
import 'package:eportal/widget/input/capcha_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../extension/string_extension.dart';
import '../../../../widget/base/base_page.dart';

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
  GlobalKey<ProfileEditBasicTabState> keyProfileEditBasicTabState =
      GlobalKey<ProfileEditBasicTabState>();
  GlobalKey<ProfileEditGeneralTabState> keyProfileEditGeneralTabState =
      GlobalKey<ProfileEditGeneralTabState>();
  GlobalKey<ProfileEditLevelTabState> keyProfileEditLevelTabState =
      GlobalKey<ProfileEditLevelTabState>();
  GlobalKey<ProfileEditWorkExperienceTabState>
      keyProfileEditWorkExperienceTabState =
      GlobalKey<ProfileEditWorkExperienceTabState>();
  GlobalKey<ProfileEditCareerGoalsTabState> keyProfileEditCareerGoalsTabState =
      GlobalKey<ProfileEditCareerGoalsTabState>();
  GlobalKey<ProfileEditFieldSkillsTabState> keyProfileEditFieldSkillsTabState =
      GlobalKey<ProfileEditFieldSkillsTabState>();
  late JobUserUpdateBloc jobUserUpdateBloc;
  late TabController _tabController;

  @override
  void initDataLoading() {
    jobUserUpdateBloc = JobUserUpdateBloc();
    // TODO: implement initDataLoading
    _tabController = TabController(
        vsync: this, length: 6, animationDuration: const Duration(seconds: 0));
    super.initDataLoading();
  }

  @override
  String getPageTitle(BuildContext context) => "Sửa hồ sơ";

  @override
  Widget pageUI(BuildContext context) => BlocProvider(
        create: (_) => jobUserUpdateBloc,
        child: BlocListener<JobUserUpdateBloc,
            DataSingleState<JobUserUpdateDataResponse>>(
          listener: (BuildContext context,
              DataSingleState<JobUserUpdateDataResponse> state) {
            handlerActionDataSingleState<JobUserUpdateDataResponse>(state,
                (obj) {
              showCenterMessage("Sửa hồ sơ thành công")
                  .then((value) => backPage());
            });
          },
          child: Column(
            children: [
              TabBar(
                controller: _tabController,
                indicatorColor: AppColor.colorOfIcon,
                labelColor: AppColor.colorOfIcon,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                labelStyle:
                    AppTextStyle.title.copyWith(overflow: TextOverflow.visible),
                indicatorWeight: 2,
                tabs: const [
                  Tab(
                    text: "Thông tin hồ sơ",
                  ),
                  Tab(
                    text: "Thông tin chung",
                  ),
                  Tab(
                    text: "Trình độ học vấn",
                  ),
                  Tab(
                    text: "Kinh nghiệm làm việc",
                  ),
                  Tab(
                    text: "Mục tiêu nghề nghiệp",
                  ),
                  Tab(
                    text: "Kỹ năng sở trường",
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 5),
                  child: TabBarView(
                    controller: _tabController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      ProfileEditBasicTab(
                        key: keyProfileEditBasicTabState,
                        data: widget.data,
                      ),
                      ProfileEditGeneralTab(
                        key: keyProfileEditGeneralTabState,
                        data: widget.data,
                      ),
                      ProfileEditLevelTab(
                        key: keyProfileEditLevelTabState,
                        data: widget.data,
                      ),
                      ProfileEditWorkExperienceTab(
                        key: keyProfileEditWorkExperienceTabState,
                        data: widget.data,
                      ),
                      ProfileEditCareerGoalsTab(
                        key: keyProfileEditCareerGoalsTabState,
                        data: widget.data,
                      ),
                      ProfileEditFieldSkillsTab(
                        key: keyProfileEditFieldSkillsTabState,
                        data: widget.data,
                      ),
                    ],
                  ),
                ),
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
      _tabController.animateTo(page);
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
                  nhuCau: (keyProfileEditGeneralTabState.currentState?.widget.danhSachNhuCauDataResponse?.docUnitID).replaceWhenNullOrWhiteSpace("0120720169190368"),
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
