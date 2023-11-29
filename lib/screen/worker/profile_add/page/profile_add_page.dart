import 'package:dropdown_search/dropdown_search.dart';
import 'package:eportal/bloc/common_new/danh_sach_doanh_nghiep_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_gioi_tinh_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_kinh_nghiem_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_muc_luong_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_quan_huyen_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_tinh_tp_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_trinh_do_bloc.dart';
import 'package:eportal/event/common_new/danh_sach_doanh_nghiep_event.dart';
import 'package:eportal/event/common_new/danh_sach_kinh_nghiem_event.dart';
import 'package:eportal/event/common_new/danh_sach_muc_luong_event.dart';
import 'package:eportal/event/common_new/danh_sach_quan_huyen_event.dart';
import 'package:eportal/event/common_new/danh_sach_tinh_tp_event.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_doanh_nghiep_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_kinh_nghiem_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_muc_luong_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_quan_huyen_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_tinh_tp_request.dart';
import 'package:eportal/model/api/request/common_new/data/common_new_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_doanh_nghiep_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_quan_huyen_data_request.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_doanh_nghiep_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_kinh_nghiem_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_muc_luong_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_quan_huyen_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_tinh_tp_data_response.dart';
import 'package:eportal/screen/share/media_image_manage/page/media_image_manage_page.dart';
import 'package:eportal/screen/share/media_video_manage/page/media_video_manage_page.dart';
import 'package:eportal/screen/worker/profile_add/tab/profile_add_basic_tab.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/default_button/default_button.dart';
import 'package:eportal/widget/input/capcha_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../../../extension/dateTime_extension.dart';
import '../../../../extension/string_extension.dart';
import '../../../../widget/base/base_page.dart';
import '../../../../widget/input/field_input.dart';
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

class _ProfileAddPageState extends BasePageState<ProfileAddPage> {
  @override
  String getPageTitle(BuildContext context) => "Tạo hồ sơ";

  @override
  Widget pageUI(BuildContext context) => DefaultTabController(
        key: localKey,
        length: 6,
        child: Column(
          children: [
            TabBar(
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
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    ProfileAddBasicTab(),
                    ProfileAddGeneralTab(),
                    const ProfileAddLevelTab(),
                    const ProfileAddWorkExperienceTab(),
                    ProfileAddCareerGoalsTab(),
                    ProfileAddFieldSkillsTab(),
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
        ),
      );

  _send(BuildContext context) {
    if (isValid()) {
      showCenterMessage("Thêm hồ sơ thành công").then((value) => backPage());
    }
  }
}
