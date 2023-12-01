import 'package:eportal/screen/worker/profile_add/tab/profile_add_basic_tab.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/default_button/default_button.dart';
import 'package:eportal/widget/input/capcha_input.dart';
import 'package:flutter/material.dart';

import '../../../../bloc/common_new/job_user_add_bloc.dart';
import '../../../../event/common_new/job_user_add_event.dart';
import '../../../../model/api/request/common_new/data/job_user_add_data_request.dart';
import '../../../../model/api/request/common_new/job_user_add_request.dart';
import '../../../../widget/base/base_page.dart';
import '../tab/profile_add_career_goals_tab.dart';
import '../tab/profile_add_field_skills_tab.dart';
import '../tab/profile_add_general_tab.dart';
import '../tab/profile_add_level_tab.dart';
import '../tab/profile_add_work_experience_tab.dart';

//
// Created by BlackRose on 20/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class ProfileAddPage extends BasePage {
  ProfileAddPage({super.key});

  @override
  State<StatefulWidget> createState() => _ProfileAddPageState();
}

class _ProfileAddPageState extends BasePageState<ProfileAddPage>
    with SingleTickerProviderStateMixin {
  GlobalKey<ProfileAddBasicTabState> keyProfileAddBasicTabState =
      GlobalKey<ProfileAddBasicTabState>();
  GlobalKey<ProfileAddGeneralTabState> keyProfileAddGeneralTabState =
      GlobalKey<ProfileAddGeneralTabState>();
  GlobalKey<ProfileAddLevelTabState> keyProfileAddLevelTabState =
      GlobalKey<ProfileAddLevelTabState>();
  GlobalKey<ProfileAddWorkExperienceTabState>
      keyProfileAddWorkExperienceTabState =
      GlobalKey<ProfileAddWorkExperienceTabState>();
  GlobalKey<ProfileAddCareerGoalsTabState> keyProfileAddCareerGoalsTabState =
      GlobalKey<ProfileAddCareerGoalsTabState>();
  GlobalKey<ProfileAddFieldSkillsTabState> keyProfileAddFieldSkillsTabState =
      GlobalKey<ProfileAddFieldSkillsTabState>();
  late JobUserAddBloc jobUserAddBloc;
  late TabController _tabController;

  @override
  void initDataLoading() {
    jobUserAddBloc = JobUserAddBloc();
    // TODO: implement initDataLoading
    _tabController = TabController(
        vsync: this, length: 6, animationDuration: const Duration(seconds: 0));
    super.initDataLoading();
  }

  @override
  String getPageTitle(BuildContext context) => "Tạo hồ sơ";

  @override
  Widget pageUI(BuildContext context) => Column(
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
                  ProfileAddBasicTab(
                    key: keyProfileAddBasicTabState,
                  ),
                  ProfileAddGeneralTab(
                    key: keyProfileAddGeneralTabState,
                  ),
                  ProfileAddLevelTab(
                    key: keyProfileAddLevelTabState,
                  ),
                  ProfileAddWorkExperienceTab(
                    key: keyProfileAddWorkExperienceTabState,
                  ),
                  ProfileAddCareerGoalsTab(
                    key: keyProfileAddCareerGoalsTabState,
                  ),
                  ProfileAddFieldSkillsTab(
                    key: keyProfileAddFieldSkillsTabState,
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
                text: 'Tạo',
                onPressed: () => _send(context),
              )),
        ],
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
      jobUserAddBloc.add(JobUserAddEvent(
          request: JobUserAddRequest(
              obj: JobUserAddDataRequest(
        tieuDe: keyProfileAddBasicTabState.currentState?.titleController.text,
        ngayDangTu:
            keyProfileAddBasicTabState.currentState?.fromDateController.text,
        ngayDangDen:
            keyProfileAddBasicTabState.currentState?.toDateController.text,
        tinhTp: keyProfileAddBasicTabState
            .currentState?.widget.danhSachTinhTpDataResponse?.regionalID,
        quanHuyen: keyProfileAddBasicTabState
            .currentState?.widget.danhSachQuanHuyenDataResponse?.regionalID,
        nganhNghe: keyProfileAddBasicTabState
            .currentState?.widget.danhSachNganhNgheDataResponse?.careerID,
        chucVuHienTai: keyProfileAddGeneralTabState
            .currentState?.widget.danhSachChucVuDataResponseHienTai?.positionID,
        chucVuMongMuon: keyProfileAddGeneralTabState.currentState?.widget
            .danhSachChucVuDataResponseMongMuon?.positionID,
        mucLuong: keyProfileAddGeneralTabState
            .currentState?.widget.danhSachMucLuongDataResponse?.salaryID,
        kinhNghiemLV: keyProfileAddGeneralTabState
            .currentState?.widget.danhSachKinhNghiemDataResponse?.experienceID,
      ))));
      showCenterMessage("Thêm hồ sơ thành công").then((value) => backPage());
    }
  }

  bool _validBeforeSend(BuildContext context) {
    if (_validPage(context, keyProfileAddBasicTabState.currentState, 0)) {
      if (_validPage(context, keyProfileAddGeneralTabState.currentState, 1)) {
        if (_validPage(context, keyProfileAddLevelTabState.currentState, 2)) {
          if (_validPage(
              context, keyProfileAddWorkExperienceTabState.currentState, 3)) {
            if (_validPage(
                context, keyProfileAddCareerGoalsTabState.currentState, 4)) {
              if (_validPage(
                  context, keyProfileAddFieldSkillsTabState.currentState, 5)) {
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
