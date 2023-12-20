//
// Created by BlackRose on 20/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//


import 'dart:math';

import 'package:eportal/model/api/response/admin/data/chat_bot_danh_sach_hoi_thoai_data_response.dart';
import 'package:eportal/model/share/chat_bot/chat_bot_message.dart';
import 'package:eportal/screen/employer/job_advertisement_add/tab/job_advertisement_add_basic_tab.dart';
import 'package:eportal/screen/share/chat_bot_manage/tab/chat_bot_manage_all_tab.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/input/search_input.dart';
import 'package:eportal/widget/tab/custom_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/admin/chat_bot_danh_sach_hoi_thoai_bloc.dart';
import '../tab/chat_bot_manage_currently_tab.dart';

class ChatBotManagePage extends BasePage {
  const ChatBotManagePage({super.key});

  @override
  State<StatefulWidget> createState() => _ChatBotManagePageState();
}

class _ChatBotManagePageState extends BasePageState<ChatBotManagePage> {
  late ChatBotDanhSachHoiThoaiBloc chatBotDanhSachHoiThoaiBloc;
  
  @override
  void initBloc() {
    chatBotDanhSachHoiThoaiBloc = ChatBotDanhSachHoiThoaiBloc();
  }

  @override
  Widget pageUI(BuildContext context) => CustomTabView(
    isScrollable: false,
    tabViews: {
      "Đang yêu cầu": ChatBotManageCurrentlyTab(),
      "Tất cả": ChatBotManageAllTab(),
    },
  );


  @override
  String getPageTitle(BuildContext context) => "Danh sách hội thoại";

  
}