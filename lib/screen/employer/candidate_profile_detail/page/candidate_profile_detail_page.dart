//
// Created by BlackRose on 20/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:eportal/bloc/admin/profile_save_bloc.dart';
import 'package:eportal/bloc/common_new/job_user_detail_bloc.dart';
import 'package:eportal/event/admin/profile_save_event.dart';
import 'package:eportal/event/common_new/job_user_detail_event.dart';
import 'package:eportal/model/api/request/admin/data/profile_save_data_request.dart';
import 'package:eportal/model/api/request/admin/profile_save_request.dart';
import 'package:eportal/model/api/request/common_new/data/job_user_detail_data_request.dart';
import 'package:eportal/model/api/request/common_new/job_user_detail_request.dart';
import 'package:eportal/model/api/response/admin/data/profile_save_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/job_user_detail_data_response.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/button/info_button.dart';
import 'package:eportal/widget/full_data_item/curriculum_vitae_item.dart';
import 'package:eportal/widget/input/field_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class CandidateProfileDetailPage extends BasePage {
  String? id;

  CandidateProfileDetailPage({
    super.key,
    this.id,
  });

  @override
  State<StatefulWidget> createState() => _CandidateProfileDetailPageState();
}

class _CandidateProfileDetailPageState
    extends BasePageState<CandidateProfileDetailPage> {
  late JobUserDetailBloc jobUserDetailBloc;
  late ProfileSaveBloc profileSaveBloc;
  TextEditingController tieuDeController = TextEditingController();

  @override
  void initBloc() {
    jobUserDetailBloc = JobUserDetailBloc();
    profileSaveBloc = ProfileSaveBloc();
  }

  @override
  void disposeBloc() {
    jobUserDetailBloc.close();
    profileSaveBloc.close();
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
  void callApi() {
    jobUserDetailBloc.add(JobUserDetailEvent(
        request: JobUserDetailRequest(
            obj: JobUserDetailDataRequest(id: widget.id ?? "0"))));
  }

  @override
  Widget pageUI(BuildContext context) => BlocProvider(
        create: (_) => profileSaveBloc,
        child: BlocListener<ProfileSaveBloc,
            DataSingleState<ProfileSaveDataResponse>>(
          listener: (BuildContext context,
              DataSingleState<ProfileSaveDataResponse> state) {
            handlerActionDataSingleState<ProfileSaveDataResponse>(state, (obj) {
              tieuDeController.clear();
              showCenterMessage("Lưu hồ sơ thành công");
            });
          },
          child: BlocProvider(
              create: (_) => jobUserDetailBloc,
              child: BlocListener<JobUserDetailBloc,
                  DataSingleState<JobUserDetailDataResponse>>(
                listener: (BuildContext context,
                    DataSingleState<JobUserDetailDataResponse> state) {},
                child: BlocBuilder<JobUserDetailBloc,
                    DataSingleState<JobUserDetailDataResponse>>(
                  builder: (BuildContext context,
                          DataSingleState<JobUserDetailDataResponse> state) =>
                      handleDataSingleState<JobUserDetailDataResponse>(
                    state,
                    (context, state) => SingleChildScrollView(
                      child: Column(
                        children: [
                          CurriculumVitaeItem(
                            title: state?.title,
                            education: state?.education,
                            careerGoals: state?.careerGoals,
                            skillsForte: state?.skillsForte,
                            workExperience: state?.workExperience,
                            isShowFull: true,
                          ),
                          InfoButton(
                            onTap: saveProfile,
                            icon: Icons.save_alt,
                            text: "Lưu hồ sơ",
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )),
        ),
      );

  @override
  String getPageTitle(BuildContext context) => "Chi tiết hồ sơ ứng viên";

  void saveProfile() {
    showAlertChoose(allow: () => save(),
      content: Container(
        margin: const EdgeInsets.only(top: 10),
        width: double.infinity,
        child: FieldInput(
          controller: tieuDeController,
          maxLength: 100,
          textInputAction: TextInputAction.next,
          validator: (text) {
            if (text == null || text.isEmpty) {
              return 'Tiêu đề không được để trống';
            }
            return null;
          },
          hintText: 'Tiêu đề',
          icon: FontAwesomeIcons.tags,
        ),
      ),
      title: "Lưu hồ sơ",
    );
  }

  save() {
    profileSaveBloc.add(ProfileSaveEvent(
        request: ProfileSaveRequest(
            obj: ProfileSaveDataRequest(
                jobUserID: widget.id,
                title: tieuDeController.text))));
  }
}
