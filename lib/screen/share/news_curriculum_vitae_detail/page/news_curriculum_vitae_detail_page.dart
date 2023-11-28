import 'package:eportal/bloc/common_new/job_user_detail_bloc.dart';
import 'package:eportal/model/api/response/common_new/data/job_user_detail_data_response.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_elevation.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/full_data_item/curriculum_vitae_item.dart';
import 'package:eportal/widget/text_icon/text_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../event/common_new/job_user_detail_event.dart';
import '../../../../extension/string_extension.dart';
import '../../../../model/api/request/common_new/data/job_user_detail_data_request.dart';
import '../../../../model/api/request/common_new/job_user_detail_request.dart';
import '../../../../model/api/response/common_new/data/home_job_user_list_data_response.dart';
import '../../../../state/base/base_state.dart';

//
// Created by BlackRose on 20/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class NewsCurriculumVitaeDetailPage extends BasePage {
  int? id;

  NewsCurriculumVitaeDetailPage({
    super.key,
    this.id,
  });

  @override
  State<StatefulWidget> createState() => _NewsCurriculumVitaeDetailPageState();
}

class _NewsCurriculumVitaeDetailPageState
    extends BasePageState<NewsCurriculumVitaeDetailPage> {
  JobUserDetailBloc jobUserDetailBloc = JobUserDetailBloc();

  @override
  void initDataLoading() {
    callApi();
    super.initDataLoading();
  }

  @override
  void callApi() {
    jobUserDetailBloc.add(JobUserDetailEvent(
        request: JobUserDetailRequest(
            obj: JobUserDetailDataRequest(id: widget.id ?? 0))));
    super.callApi();
  }

  @override
  Widget pageUI(BuildContext context) => BlocProvider(
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
              child: CurriculumVitaeItem(
                title: state?.title,
                education: state?.education,
                careerGoals: state?.careerGoals,
                skillsForte: state?.skillsForte,
                workExperience: state?.workExperience,
                isShowFull: true,
              ),
            ),
          ),
        ),
      ));

  @override
  String getPageTitle(BuildContext context) => "Chi tiết hồ sơ ứng viên";
}
