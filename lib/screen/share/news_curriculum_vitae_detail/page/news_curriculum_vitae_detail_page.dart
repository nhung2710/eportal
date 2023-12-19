import 'package:eportal/bloc/common_new/job_user_detail_bloc.dart';
import 'package:eportal/model/api/response/common_new/data/job_user_detail_data_response.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/button/info_button.dart';
import 'package:eportal/widget/button/phone_button.dart';
import 'package:eportal/widget/full_data_item/curriculum_vitae_item.dart';
import 'package:eportal/widget/input/field_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../../../application/global_application.dart';
import '../../../../bloc/admin/profile_save_bloc.dart';
import '../../../../enum/role_type.dart';
import '../../../../event/admin/profile_save_event.dart';
import '../../../../event/common_new/job_user_detail_event.dart';
import '../../../../model/api/request/admin/data/profile_save_data_request.dart';
import '../../../../model/api/request/admin/profile_save_request.dart';
import '../../../../model/api/request/common_new/data/job_user_detail_data_request.dart';
import '../../../../model/api/request/common_new/job_user_detail_request.dart';
import '../../../../model/api/response/admin/data/profile_save_data_response.dart';
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
  late ProfileSaveBloc profileSaveBloc;
  TextEditingController tieuDeController = TextEditingController();
  @override
  void initBloc() {
    jobUserDetailBloc = JobUserDetailBloc();
    profileSaveBloc = ProfileSaveBloc();
  }

  @override
  void initDataLoading() {
    callApi();
    super.initDataLoading();
  }

  @override
  void callApi() {
    jobUserDetailBloc.add(JobUserDetailEvent(
        request: JobUserDetailRequest(
            obj: JobUserDetailDataRequest(id: widget.id ?? "0"))));
    super.callApi();
  }

  @override
  Widget pageUI(BuildContext context) => BlocProvider(
    create: (_) => profileSaveBloc,
    child: BlocListener<ProfileSaveBloc,DataSingleState<ProfileSaveDataResponse>>(
      listener: (BuildContext context, DataSingleState<ProfileSaveDataResponse> state) {
          handlerActionDataSingleState<ProfileSaveDataResponse>(state, (obj) {
          showCenterMessage("Lưu hồ sơ thành công")
          .then((value) => backPage());
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
                      GlobalApplication().roleType == RoleType.bussiness ? InfoButton(
                        onTap: saveProfile,
                        icon: Icons.save_alt,
                        text: "Lưu hồ sơ",
                      ) : Container()
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
    Alert(
        context: context,
        type: AlertType.warning,
        title: "Lưu hồ sơ",
        content:
        Container(
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
        buttons: [
          DialogButton(
            onPressed: () => Navigator.pop(context),
            color: AppColor.colorOfIcon,
            child: const Text(
              "Huỷ",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          DialogButton(
            onPressed: () {
              Navigator.pop(context);
              profileSaveBloc.add(ProfileSaveEvent(request: ProfileSaveRequest(obj: ProfileSaveDataRequest(jobUserID: widget.id, title: tieuDeController.text))));
            },
            color: Colors.red,
            child: const Text(
              "Lưu lại",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }
}
