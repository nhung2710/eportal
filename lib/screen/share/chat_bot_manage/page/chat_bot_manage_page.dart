//
// Created by BlackRose on 20/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:eportal/screen/share/chat_bot_manage/tab/chat_bot_manage_all_tab.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/tab/custom_tab_view.dart';
import 'package:flutter/material.dart';

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
  void callApi() {
    // TODO: implement callApi
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    chatBotDanhSachHoiThoaiBloc.close();
  }

  @override
  void getMoreData() {
    // TODO: implement getMoreData
  }

  @override
  void initDataLoading() {
    // TODO: implement initDataLoading
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
