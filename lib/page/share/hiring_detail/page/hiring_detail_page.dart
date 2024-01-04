//
// Created by BlackRose on 03/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//

import 'package:eportal/bloc/common_new/work_detail_bloc.dart';
import 'package:eportal/event/common_new/work_detail_event.dart';
import 'package:eportal/model/api/request/common_new/data/work_detail_data_request.dart';
import 'package:eportal/model/api/request/common_new/work_detail_request.dart';
import 'package:eportal/model/api/response/common_new/data/work_detail_data_response.dart';
import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/base/page_widget/base_page_widget.dart';
import 'package:eportal/page/widget/default_card_item.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_size_icon.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../extension/string_extension.dart';

class HiringDetailPage extends BasePageWidget {
  final String? hiringId;

  const HiringDetailPage({super.key, required this.hiringId});

  @override
  State<StatefulWidget> createState() => _HiringDetailPageState();
}

class _HiringDetailPageState extends BasePageState<HiringDetailPage> {
  late WorkDetailBloc workDetailBloc;
  WorkDetailEvent workDetailEvent =
      WorkDetailEvent(request: WorkDetailRequest(obj: WorkDetailDataRequest()));

  @override
  void initBloc() {
    workDetailBloc = WorkDetailBloc();
    workDetailEvent.request.obj.id = widget.hiringId;
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
    workDetailBloc.add(workDetailEvent);
  }

  @override
  Widget pageUI(BuildContext context) => BlocProvider(
      create: (_) => workDetailBloc,
      child:
          BlocListener<WorkDetailBloc, DataSingleState<WorkDetailDataResponse>>(
        listener: (BuildContext context,
            DataSingleState<WorkDetailDataResponse> state) {},
        child: BlocBuilder<WorkDetailBloc,
            DataSingleState<WorkDetailDataResponse>>(
          builder: (BuildContext context,
                  DataSingleState<WorkDetailDataResponse> state) =>
              handleDataSingleState<WorkDetailDataResponse>(
            state,
            (context, state) => Container(
              margin: const EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () => openOption(state),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        "Chi tiết tuyển dụng",
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
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 5),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            FontAwesomeIcons.tag,
                                            color: AppColor.colorOfIcon,
                                            size: AppSizeIcon.sizeOfNormal,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                              child: Text(
                                            (state?.title).supportHtml(),
                                            style: AppTextStyle.titlePage
                                                .copyWith(),
                                            overflow: TextOverflow.visible,
                                            textAlign: TextAlign.start,
                                          )),
                                        ],
                                      )),
                                  Divider(
                                    height: 20,
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                  Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 5),
                                      child: Text(
                                        '${(state?.description).supportHtml()}\n',
                                        style: AppTextStyle.title.copyWith(
                                            color: Colors.brown,
                                            fontWeight: FontWeight.bold),
                                        overflow: TextOverflow.visible,
                                        textAlign: TextAlign.start,
                                      )),
                                  Divider(
                                    height: 20,
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                  Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 5),
                                      child: Text(
                                        '${(state?.requirement).supportHtml()}\n',
                                        style: AppTextStyle.title.copyWith(
                                            color: Colors.orange,
                                            fontWeight: FontWeight.bold),
                                        overflow: TextOverflow.visible,
                                        textAlign: TextAlign.start,
                                      )),
                                  Divider(
                                    height: 20,
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                  Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 5),
                                      child: Text(
                                        '${(state?.benefit).supportHtml()}\n',
                                        style: AppTextStyle.title.copyWith(
                                            color: Colors.blueAccent,
                                            fontWeight: FontWeight.bold),
                                        overflow: TextOverflow.visible,
                                        textAlign: TextAlign.start,
                                      )),
                                  Divider(
                                    height: 20,
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                  Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 5),
                                      child: Text(
                                        '${(state?.requirementsProfile).supportHtml()}\n',
                                        style: AppTextStyle.title.copyWith(
                                            color: Colors.deepOrangeAccent,
                                            fontWeight: FontWeight.bold),
                                        overflow: TextOverflow.visible,
                                        textAlign: TextAlign.start,
                                      )),
                                  Divider(
                                    height: 20,
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                  Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 5),
                                      child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            (state?.expiredDate)
                                                .formatDateTimeApi(),
                                            style: AppTextStyle.normalChild1
                                                .copyWith(color: Colors.red),
                                            maxLines: 2,
                                            textAlign: TextAlign.end,
                                          )))
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
        ),
      ));

  @override
  PreferredSizeWidget? getAppBar(BuildContext context) => defaultTabBar();

  void openOption(WorkDetailDataResponse? state) {
    List<Widget> children = [];
    if(!(state?.contactUser).isNullOrWhiteSpace()){
      children.add(GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: ListTile(
          leading: const Icon(
            FontAwesomeIcons.userTag,
            color: AppColor.colorOfIcon,
            size: AppSizeIcon.sizeOfNormal,
          ),
          title: Text(state!.contactUser!,style: AppTextStyle.title.copyWith(overflow: TextOverflow.visible),),
        ),
      ));
    }
    if(!(state?.contactAddress).isNullOrWhiteSpace()){
      children.add(GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: ListTile(
          leading: const Icon(
            FontAwesomeIcons.addressCard,
            color: AppColor.colorOfIcon,
            size: AppSizeIcon.sizeOfNormal,
          ),
          title: Text(state!.contactAddress!,style: AppTextStyle.title.copyWith(overflow: TextOverflow.visible),),
          trailing: GestureDetector(
            onTap: ()=> {
              Navigator.pop(context),
              copyText(text: state.contactAddress!)
            },
            child: const Icon(
              FontAwesomeIcons.copy,
              color: AppColor.colorOfIcon,
              size: AppSizeIcon.sizeOfNormal,
            ),
          ),
        ),
      ));
    }
    if(!(state?.contactMobile).isNullOrWhiteSpace()){
      children.add(GestureDetector(
        onTap: () {
          Navigator.pop(context);
          _callPhone(state.contactMobile!);
        },
        child: ListTile(
          leading: const Icon(
            FontAwesomeIcons.mobile,
            color: AppColor.colorOfIcon,
            size: AppSizeIcon.sizeOfNormal,
          ),
          title: Text(state!.contactMobile!,style: AppTextStyle.title.copyWith(overflow: TextOverflow.visible),),
          trailing: GestureDetector(
            onTap: ()=> {
              Navigator.pop(context),
              copyText(text: state.contactMobile!)
            },
            child: const Icon(
              FontAwesomeIcons.copy,
              color: AppColor.colorOfIcon,
              size: AppSizeIcon.sizeOfNormal,
            ),
          ),
        ),
      ));
    }
    if(!(state?.contactEmail).isNullOrWhiteSpace()){
      children.add(GestureDetector(
        onTap: () {
          Navigator.pop(context);
          _sendEmail(state.contactEmail!);
        },
        child: ListTile(
          leading: const Icon(
            FontAwesomeIcons.envelope,
            color: AppColor.colorOfIcon,
            size: AppSizeIcon.sizeOfNormal,
          ),
          title: Text(state!.contactEmail!,style: AppTextStyle.title.copyWith(overflow: TextOverflow.visible),),
          trailing: GestureDetector(
            onTap: ()=> {
              Navigator.pop(context),
              copyText(text: state.contactEmail!)
            },
            child: const Icon(
              FontAwesomeIcons.copy,
              color: AppColor.colorOfIcon,
              size: AppSizeIcon.sizeOfNormal,
            ),
          ),
        ),
      ));
    }
    showBaseBottomSheet(
      children:children
    );
  }

  _callPhone(String phone) {
    launchUrl(Uri(
        scheme: 'tel',
        path: phone
            .replaceWhenNullOrWhiteSpace()
            .replaceAll(RegExp(r'^[0-9]'), '')));
  }


  _sendEmail(String email) {
    launchUrl(Uri(
      scheme: 'mailto',
      path: '$email',
    ));
  }
}
