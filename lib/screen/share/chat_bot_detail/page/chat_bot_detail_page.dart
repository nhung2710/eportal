//
// Created by BlackRose on 21/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//


import 'package:eportal/bloc/admin/chat_bot_danh_sach_hoi_thoai_bloc.dart';
import 'package:eportal/bloc/admin/chat_bot_them_cau_mau_bloc.dart';
import 'package:eportal/event/admin/chat_bot_chi_tiet_hoi_thoai_event.dart';
import 'package:eportal/model/api/response/admin/data/chat_bot_chi_tiet_hoi_thoai_data_response.dart';
import 'package:eportal/screen/share/chat_bot_detail/widget/chat_bot_detail_item.dart';
import 'package:eportal/screen/share/chat_bot_manage/tab/chat_bot_manage_all_tab.dart';
import 'package:eportal/screen/share/chat_bot_manage/tab/chat_bot_manage_currently_tab.dart';
import 'package:eportal/screen/share/chat_bot_manage/widget/chat_bot_manage_item.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/expandable_fab/expandable_fab.dart';
import 'package:eportal/widget/input/field_input.dart';
import 'package:eportal/widget/tab/custom_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../bloc/admin/chat_bot_chi_tiet_hoi_thoai_bloc.dart';
import '../../../../event/admin/chat_bot_them_cau_mau_event.dart';
import '../../../../model/api/request/admin/chat_bot_chi_tiet_hoi_thoai_request.dart';
import '../../../../model/api/request/admin/chat_bot_them_cau_mau_request.dart';
import '../../../../model/api/request/admin/data/chat_bot_chi_tiet_hoi_thoai_data_request.dart';
import '../../../../model/api/request/admin/data/chat_bot_them_cau_mau_data_request.dart';
import '../../../../model/api/response/admin/data/chat_bot_them_cau_mau_data_response.dart';

class ChatBotDetailPage extends BasePage {
  String? id;
  ChatBotDetailPage({super.key,this.id});

  @override
  State<StatefulWidget> createState() => _ChatBotDetailPageState();
}

class _ChatBotDetailPageState extends BasePageState<ChatBotDetailPage> {
  ChatBotChiTietHoiThoaiEvent chatBotChiTietHoiThoaiEvent = ChatBotChiTietHoiThoaiEvent(request: ChatBotChiTietHoiThoaiRequest(obj: ChatBotChiTietHoiThoaiDataRequest()));
  ChatBotThemCauMauEvent chatBotThemCauMauEvent = ChatBotThemCauMauEvent(request: ChatBotThemCauMauRequest(obj: ChatBotThemCauMauDataRequest()));
  late ChatBotChiTietHoiThoaiBloc chatBotChiTietHoiThoaiBloc;
  late ChatBotThemCauMauBloc chatBotThemCauMauBloc;
  TextEditingController cauMauController = TextEditingController();
  @override
  void initBloc() {
    chatBotThemCauMauBloc = ChatBotThemCauMauBloc();
    chatBotChiTietHoiThoaiBloc = ChatBotChiTietHoiThoaiBloc();
    chatBotChiTietHoiThoaiEvent.request.obj.idHoiThoai = "12";// widget.id;
  }

  @override
  void callApi() {
    // TODO: implement callApi
    chatBotChiTietHoiThoaiBloc.add(chatBotChiTietHoiThoaiEvent);
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    chatBotChiTietHoiThoaiBloc.close();
  }

  @override
  void getMoreData() {
    // TODO: implement getMoreData
  }

  @override
  void initDataLoading() {
    // TODO: implement initDataLoading
    callApi();
  }


  @override
  Widget pageUI(BuildContext context) => BlocProvider(
    create: (_) => chatBotThemCauMauBloc,
    child: BlocListener<ChatBotThemCauMauBloc,
        DataSingleState<String>>(
      listener: (BuildContext context, DataSingleState<String> state) {
        handlerActionDataSingleState<String>(state, (obj) {
          showCenterMessage("Xoá hội thoại thành công").then((value) => initDataLoading());
        });
      },
      child: BlocProvider(
          create: (_) => chatBotChiTietHoiThoaiBloc,
          child: BlocListener<ChatBotChiTietHoiThoaiBloc,
              DataMultiState<ChatBotChiTietHoiThoaiDataResponse>>(
            listener: (BuildContext context,
                DataMultiState<ChatBotChiTietHoiThoaiDataResponse> state) {},
            child: BlocBuilder<ChatBotChiTietHoiThoaiBloc,
                DataMultiState<ChatBotChiTietHoiThoaiDataResponse>>(
              builder: (BuildContext context,
                  DataMultiState<ChatBotChiTietHoiThoaiDataResponse> state) =>
                  handleDataMultiState<ChatBotChiTietHoiThoaiDataResponse>(
                    state,
                        (context, state) {
                      return ListView.builder(
                          shrinkWrap: true,
                          controller: scrollController,
                          itemCount: state.length,
                          itemBuilder: (context, i) => ChatBotDetailItem(
                            data : state.elementAt(i),
                            onTap: () => themCauMau(state.elementAt(i)),

                          ));
                    },
                  ),
            ),
          )),
    ),
  );

  @override
  String getPageTitle(BuildContext context) => "Chi tiết hội thoại";

  void themCauMau(ChatBotChiTietHoiThoaiDataResponse item) {

    showAlertChoose(allow: () => themCauMauCommit(item),
      content: Container(
        margin: const EdgeInsets.only(top: 10),
        width: double.infinity,
        color: Colors.transparent,
        child: FieldInput(
          controller: cauMauController,
          maxLength: 300,
          textInputAction: TextInputAction.next,
          validator: (text) {
            if (text == null || text.isEmpty) {
              return 'Mẫu câu không được để trống';
            }
            return null;
          },
          hintText: 'Mẫu câu',
          icon: FontAwesomeIcons.tags,
        ),
      ),
      title: "Thêm mẫu câu",
    );
  }

  void themCauMauCommit(ChatBotChiTietHoiThoaiDataResponse item) {
    chatBotThemCauMauEvent.request.obj.cauMau = cauMauController.text;
    chatBotThemCauMauBloc.add(chatBotThemCauMauEvent);
  }
}