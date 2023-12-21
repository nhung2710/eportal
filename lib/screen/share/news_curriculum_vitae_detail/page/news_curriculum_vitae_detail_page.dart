import 'package:eportal/bloc/common_new/job_user_detail_bloc.dart';
import 'package:eportal/model/api/response/common_new/data/job_user_detail_data_response.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/full_data_item/curriculum_vitae_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../event/common_new/job_user_detail_event.dart';
import '../../../../extension/string_extension.dart';
import '../../../../model/api/request/common_new/data/job_user_detail_data_request.dart';
import '../../../../model/api/request/common_new/job_user_detail_request.dart';
import '../../../../state/base/base_state.dart';

//
// Created by BlackRose on 20/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class NewsCurriculumVitaeDetailPage extends BasePage {
  String? id;

  NewsCurriculumVitaeDetailPage({
    super.key,
    this.id,
  });

  @override
  State<StatefulWidget> createState() => _NewsCurriculumVitaeDetailPageState();
}

class _NewsCurriculumVitaeDetailPageState
    extends BasePageState<NewsCurriculumVitaeDetailPage> {
  late JobUserDetailBloc jobUserDetailBloc;
  TextEditingController tieuDeController = TextEditingController();
  JobUserDetailRequest request =
      JobUserDetailRequest(obj: JobUserDetailDataRequest());

  @override
  void initBloc() {
    jobUserDetailBloc = JobUserDetailBloc();
    request.obj.id = widget.id.replaceWhenNullOrWhiteSpace("0");
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    jobUserDetailBloc.close();
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
    jobUserDetailBloc.add(JobUserDetailEvent(request: request));
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
                ],
              ),
            ),
          ),
        ),
      ));

  @override
  String getPageTitle(BuildContext context) => "Chi tiết hồ sơ ứng viên";
}
