//
// Created by BlackRose on 03/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//

import 'package:eportal/bloc/common_new/job_user_detail_bloc.dart';
import 'package:eportal/event/common_new/job_user_detail_event.dart';
import 'package:eportal/model/api/request/common_new/data/job_user_detail_data_request.dart';
import 'package:eportal/model/api/request/common_new/job_user_detail_request.dart';
import 'package:eportal/model/api/response/common_new/data/job_user_detail_data_response.dart';
import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/base/page_widget/base_page_widget.dart';
import 'package:eportal/page/widget/default_card_item.dart';
import 'package:eportal/page/widget/default_image_network.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_size_icon.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../extension/string_extension.dart';

class ProfileDetailPage extends BasePageWidget {
  final String? profileId;

  const ProfileDetailPage({super.key, required this.profileId});

  @override
  State<StatefulWidget> createState() => _ProfileDetailPageState();
}

class _ProfileDetailPageState extends BasePageState<ProfileDetailPage> {
  late JobUserDetailBloc jobUserDetailBloc;
  JobUserDetailEvent jobUserDetailEvent = JobUserDetailEvent(request: JobUserDetailRequest(obj: JobUserDetailDataRequest()));

  @override
  void initBloc() {
    jobUserDetailBloc = JobUserDetailBloc();
    jobUserDetailEvent.request.obj.id = widget.profileId;
  }

  @override
  void initDataLoading() {
    callApi();
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
  }

  @override
  void getMoreData() {
    // TODO: implement getMoreData
  }

  @override
  void callApi() {
    jobUserDetailBloc.add(jobUserDetailEvent);
  }

  @override
  Widget pageUI(BuildContext context) => BlocProvider(
      create: (_) => jobUserDetailBloc,
      child:
      BlocListener<JobUserDetailBloc, DataSingleState<JobUserDetailDataResponse>>(
        listener: (BuildContext context,
            DataSingleState<JobUserDetailDataResponse> state) {},
        child: BlocBuilder<JobUserDetailBloc,
            DataSingleState<JobUserDetailDataResponse>>(
          builder: (BuildContext context,
              DataSingleState<JobUserDetailDataResponse> state) =>
              handleDataSingleState<JobUserDetailDataResponse>(
                state,
                    (context, state) => Container(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          "Chi tiết hồ sơ",
                          style: AppTextStyle.titlePage.copyWith(
                              overflow: TextOverflow.visible,
                              fontSize: 18,
                              color: AppColor.colorOfIconActive),
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          children: [
                            DefaultCardItem(
                              child: Container(
                                margin: const EdgeInsets.all(5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                                        child: Row(
                                          children: [
                                            const Icon(FontAwesomeIcons.tag,
                                              color: AppColor.colorOfIcon,
                                              size: AppSizeIcon.sizeOfNormal,),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(child: Text((state?.title).supportHtml(),style: AppTextStyle.titlePage.copyWith(),overflow: TextOverflow.visible,textAlign: TextAlign.start,)),
                                          ],
                                        )
                                    ),
                                    Divider(
                                      height: 20,
                                      color: Colors.grey.withOpacity(0.5),
                                    ),
                                    Container(
                                        margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                                        child: Text('${(state?.education).supportHtml()}\n',style: AppTextStyle.title.copyWith(color: Colors.brown,fontWeight: FontWeight.bold),overflow: TextOverflow.visible,textAlign: TextAlign.start,)
                                    ),
                                    Divider(
                                      height: 20,
                                      color: Colors.grey.withOpacity(0.5),
                                    ),
                                    Container(
                                        margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                                        child: Text('${(state?.skillsForte).supportHtml()}\n',style: AppTextStyle.title.copyWith(color: Colors.orange,fontWeight: FontWeight.bold),overflow: TextOverflow.visible,textAlign: TextAlign.start,)
                                    ),
                                    Divider(
                                      height: 20,
                                      color: Colors.grey.withOpacity(0.5),
                                    ),
                                    Container(
                                        margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                                        child: Text('${(state?.workExperience).supportHtml()}\n',style: AppTextStyle.title.copyWith(color: Colors.blueAccent,fontWeight: FontWeight.bold),overflow: TextOverflow.visible,textAlign: TextAlign.start,)
                                    ),
                                    Divider(
                                      height: 20,
                                      color: Colors.grey.withOpacity(0.5),
                                    ),
                                    Container(
                                        margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                                        child: Text('${(state?.careerGoals).supportHtml()}\n',style: AppTextStyle.title.copyWith(color: Colors.deepOrangeAccent,fontWeight: FontWeight.bold),overflow: TextOverflow.visible,textAlign: TextAlign.start,)
                                    ),
                                    Container(
                                        margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Text((state?.approvalDate).formatDateTimeApi(),style: AppTextStyle.normalChild1.copyWith(),maxLines: 2,textAlign: TextAlign.end,))
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
        ),
      ));

  @override
  PreferredSizeWidget? getAppBar(BuildContext context) => defaultTabBar();
}