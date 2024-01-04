//
// Created by BlackRose on 04/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//

import 'package:eportal/bloc/admin/chat_bot_chi_tiet_hoi_thoai_bloc.dart';
import 'package:eportal/event/admin/chat_bot_chi_tiet_hoi_thoai_event.dart';
import 'package:eportal/model/api/request/admin/chat_bot_chi_tiet_hoi_thoai_request.dart';
import 'package:eportal/model/api/request/admin/data/chat_bot_chi_tiet_hoi_thoai_data_request.dart';
import 'package:eportal/model/api/response/admin/data/chat_bot_chi_tiet_hoi_thoai_data_response.dart';
import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/base/page_widget/base_page_widget.dart';
import 'package:eportal/page/share/chat_bot_conversation_detail/widget/chat_bot_conversation_detail_item.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBotConversationDetailPage extends BasePageWidget {
  final String? conversationId;

  const ChatBotConversationDetailPage({super.key, required this.conversationId});

  @override
  State<StatefulWidget> createState() => ChatBotConversationDetailPageState();
}

class ChatBotConversationDetailPageState extends BasePageState<ChatBotConversationDetailPage> {
  late ChatBotChiTietHoiThoaiBloc chatBotChiTietHoiThoaiBloc;
  ChatBotChiTietHoiThoaiEvent chatBotChiTietHoiThoaiEvent = ChatBotChiTietHoiThoaiEvent(request: ChatBotChiTietHoiThoaiRequest(obj: ChatBotChiTietHoiThoaiDataRequest()));

  @override
  void initBloc() {
    chatBotChiTietHoiThoaiBloc = ChatBotChiTietHoiThoaiBloc();
    chatBotChiTietHoiThoaiEvent.request.obj.idHoiThoai = widget.conversationId;
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
    callApi();
  }

  @override
  PreferredSizeWidget? getAppBar(BuildContext context) => defaultTabBar();


  @override
  Widget pageUI(BuildContext context) => Container(
    margin: const EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text(
            "Chi tiết hội thoại",
            style: AppTextStyle.titlePage.copyWith(
                overflow: TextOverflow.visible,
                fontSize: 18,
                color: AppColor.colorOfIconActive),
          ),
        ),
        Expanded(
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
                            (context, state) => ListView(
                              shrinkWrap: true,
                              children: state.map((e) => ChatBotConversationDetailItem(
                                data:e, onClickItem: (ChatBotChiTietHoiThoaiDataResponse value) {  },
                              ))
                                  .toList(),
                            ),
                      ),
                ),
              ))
          ),
      ],
    ),
  );
}