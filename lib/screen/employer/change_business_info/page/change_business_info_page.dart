import 'package:eportal/model/api/response/common_new/data/job_user_add_data_response.dart';
import 'package:eportal/screen/employer/change_business_info/tab/change_business_info_general_tab.dart';
import 'package:eportal/screen/worker/profile_add/tab/profile_add_basic_tab.dart';
import 'package:eportal/screen/worker/profile_add/tab/profile_add_career_goals_tab.dart';
import 'package:eportal/screen/worker/profile_add/tab/profile_add_field_skills_tab.dart';
import 'package:eportal/screen/worker/profile_add/tab/profile_add_general_tab.dart';
import 'package:eportal/screen/worker/profile_add/tab/profile_add_level_tab.dart';
import 'package:eportal/screen/worker/profile_add/tab/profile_add_work_experience_tab.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/default_button/default_button.dart';
import 'package:eportal/widget/input/capcha_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/common_new/job_user_add_bloc.dart';
import '../../../../event/common_new/job_user_add_event.dart';
import '../../../../extension/string_extension.dart';
import '../../../../model/api/request/common_new/data/job_user_add_data_request.dart';
import '../../../../model/api/request/common_new/job_user_add_request.dart';
import '../../../../widget/base/base_page.dart';

import '../../../../extension/string_extension.dart';
import '../tab/change_business_info_about_tab.dart';
import '../tab/change_business_info_account_tab.dart';
import '../tab/change_business_info_contract_tab.dart';

//
// Created by BlackRose on 04/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class ChangeBusinessInfoPage extends BasePage {
  const ChangeBusinessInfoPage({super.key});

  @override
  State<StatefulWidget> createState() => _ChangeBusinessInfoPageState();
}

class _ChangeBusinessInfoPageState extends BasePageState<ChangeBusinessInfoPage>
    with SingleTickerProviderStateMixin {
  GlobalKey<ChangeBusinessInfoGeneralTabState>
      keyChangeBusinessInfoGeneralTabState =
      GlobalKey<ChangeBusinessInfoGeneralTabState>();
  GlobalKey<ChangeBusinessInfoAboutTabState>
      keyChangeBusinessInfoAboutTabState =
      GlobalKey<ChangeBusinessInfoAboutTabState>();
  GlobalKey<ChangeBusinessInfoContractTabState>
      keyChangeBusinessInfoContractTabState =
      GlobalKey<ChangeBusinessInfoContractTabState>();
  GlobalKey<ChangeBusinessInfoAccountTabState>
      keyChangeBusinessInfoAccountTabState =
      GlobalKey<ChangeBusinessInfoAccountTabState>();
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
  String getPageTitle(BuildContext context) => "Đổi thông tin doanh nghiệp";

  @override
  Widget pageUI(BuildContext context) => BlocProvider(
        create: (_) => jobUserAddBloc,
        child: BlocListener<JobUserAddBloc,
            DataSingleState<JobUserAddDataResponse>>(
          listener: (BuildContext context,
              DataSingleState<JobUserAddDataResponse> state) {
            handlerActionDataSingleState<JobUserAddDataResponse>(state, (obj) {
              showCenterMessage("Tạo hồ sơ thành công")
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
                    text: "Thông tin hồ sơ nhà tuyển dụng",
                  ),
                  Tab(
                    text: "Giới thiệu về nhà tuyển dụng",
                  ),
                  Tab(
                    text: "Thông tin người liên hệ",
                  ),
                  Tab(
                    text: "Thông tin tài khoản quản trị doanh nghiệp",
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
                      ChangeBusinessInfoGeneralTab(
                        key: keyChangeBusinessInfoGeneralTabState,
                      ),
                      ChangeBusinessInfoAboutTab(
                        key: keyChangeBusinessInfoAboutTabState,
                      ),
                      ChangeBusinessInfoContractTab(
                        key: keyChangeBusinessInfoContractTabState,
                      ),
                      ChangeBusinessInfoAccountTab(
                        key: keyChangeBusinessInfoAccountTabState,
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
                    text: 'Thay đổi',
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
    if (isValid()) {
      showCenterMessage("Sửa thông tin thành công").then((value) => backPage());
    }
  }
}
