import 'package:eportal/bloc/admin/job_user_add_bloc.dart';
import 'package:eportal/bloc/admin/work_add_bloc.dart';
import 'package:eportal/event/admin/job_user_add_event.dart';
import 'package:eportal/model/api/request/admin/data/job_user_add_data_request.dart';
import 'package:eportal/model/api/request/admin/job_user_add_request.dart';
import 'package:eportal/model/api/response/admin/data/job_user_add_data_response.dart';
import 'package:eportal/model/api/response/admin/data/work_add_data_response.dart';
import 'package:eportal/screen/employer/job_advertisement_add/tab/job_advertisement_add_contract_tab.dart';
import 'package:eportal/screen/employer/job_advertisement_add/tab/job_advertisement_add_description_tab.dart';
import 'package:eportal/screen/worker/profile_add/tab/profile_add_basic_tab.dart';
import 'package:eportal/screen/worker/profile_add/tab/profile_add_career_goals_tab.dart';
import 'package:eportal/screen/worker/profile_add/tab/profile_add_field_skills_tab.dart';
import 'package:eportal/screen/worker/profile_add/tab/profile_add_general_tab.dart';
import 'package:eportal/screen/worker/profile_add/tab/profile_add_level_tab.dart';
import 'package:eportal/screen/worker/profile_add/tab/profile_add_work_experience_tab.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/default_button/default_button.dart';
import 'package:eportal/widget/input/capcha_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../extension/string_extension.dart';
import '../../../../widget/tab/custom_tab_view.dart';
import '../tab/job_advertisement_add_basic_tab.dart';
import '../tab/job_advertisement_add_general_tab.dart';

//
// Created by BlackRose on 04/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class JobAdvertisementAddPage extends BasePage {
  JobAdvertisementAddPage({super.key});

  @override
  State<StatefulWidget> createState() => _JobAdvertisementAddPageState();
}

class _JobAdvertisementAddPageState
    extends BasePageState<JobAdvertisementAddPage> {
  GlobalKey<CustomTabViewState> keyCustomTabViewState =
      GlobalKey<CustomTabViewState>();
  GlobalKey<JobAdvertisementAddBasicTabState>
      keyJobAdvertisementAddBasicTabState =
      GlobalKey<JobAdvertisementAddBasicTabState>();
  GlobalKey<JobAdvertisementAddGeneralTabState>
      keyJobAdvertisementAddGeneralTabState =
      GlobalKey<JobAdvertisementAddGeneralTabState>();
  GlobalKey<JobAdvertisementAddContractTabState>
      keyJobAdvertisementAddContractTabState =
      GlobalKey<JobAdvertisementAddContractTabState>();
  GlobalKey<JobAdvertisementAddDescriptionTabState>
      keyJobAdvertisementAddDescriptionTabState =
      GlobalKey<JobAdvertisementAddDescriptionTabState>();
  late WorkAddBloc workAddBloc;

  @override
  void initBloc() {
    workAddBloc = WorkAddBloc();
  }

  @override
  void initDataLoading() {
    super.initDataLoading();
  }

  @override
  String getPageTitle(BuildContext context) => "Tạo tin tuyển dụng";

  @override
  Widget pageUI(BuildContext context) => BlocProvider(
        create: (_) => workAddBloc,
        child: BlocListener<WorkAddBloc, DataSingleState<WorkAddDataResponse>>(
          listener: (BuildContext context,
              DataSingleState<WorkAddDataResponse> state) {
            handlerActionDataSingleState<WorkAddDataResponse>(state, (obj) {
              showCenterMessage("Tạo tin tuyển dụng thành công")
                  .then((value) => backPage());
            });
          },
          child: Column(
            children: [
              Expanded(
                child: CustomTabView(
                  tabViews: {
                    "Thông tin tuyển dụng": JobAdvertisementAddBasicTab(
                      key: keyJobAdvertisementAddBasicTabState,
                    ),
                    "Thông tin chung": JobAdvertisementAddGeneralTab(
                      key: keyJobAdvertisementAddGeneralTabState,
                    ),
                    "Mô tả công việc": JobAdvertisementAddDescriptionTab(
                      key: keyJobAdvertisementAddDescriptionTabState,
                    ),
                    "Thông tin liên hệ": JobAdvertisementAddContractTab(
                      key: keyJobAdvertisementAddContractTabState,
                    ),
                  },
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
    if (_validBeforeSend(context)) {}
  }

  bool _validBeforeSend(BuildContext context) {
    if (_validPage(
        context, keyJobAdvertisementAddBasicTabState.currentState, 0)) {
      if (_validPage(
          context, keyJobAdvertisementAddGeneralTabState.currentState, 1)) {}
    }
    return false;
  }
}
