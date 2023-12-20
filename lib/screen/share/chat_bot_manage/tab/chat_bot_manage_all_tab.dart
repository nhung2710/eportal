//
// Created by BlackRose on 20/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//


import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/input/field_input.dart';
import 'package:eportal/widget/input/search_input.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../bloc/admin/chat_bot_danh_sach_hoi_thoai_bloc.dart';
import '../../../../event/admin/chat_bot_danh_sach_hoi_thoai_event.dart';
import '../../../../model/api/request/admin/chat_bot_danh_sach_hoi_thoai_request.dart';
import '../../../../model/api/request/admin/data/chat_bot_danh_sach_hoi_thoai_data_request.dart';

class ChatBotManageAllTab extends BasePage {
  ChatBotManageAllTab({super.key});

  @override
  State<StatefulWidget> createState() => ChatBotManageAllTabState();
}

class ChatBotManageAllTabState
    extends BaseScreenStateActive<ChatBotManageAllTab> {
  TextEditingController textEditingController = TextEditingController();
  ChatBotDanhSachHoiThoaiRequest chatBotDanhSachHoiThoaiRequest = ChatBotDanhSachHoiThoaiRequest(obj: ChatBotDanhSachHoiThoaiDataRequest(trangThai: 0));
  late ChatBotDanhSachHoiThoaiBloc chatBotDanhSachHoiThoaiBloc;

  @override
  void initBloc() {
    chatBotDanhSachHoiThoaiBloc = ChatBotDanhSachHoiThoaiBloc();
  }
  @override
  void initDataLoading() {
    chatBotDanhSachHoiThoaiRequest.obj.soTrangHienTai=1;
    callApi();
  }
  @override
  void getMoreData() {
    chatBotDanhSachHoiThoaiRequest.obj.soTrangHienTai++;
    callApi();
  }

  @override
  void callApi() {
    chatBotDanhSachHoiThoaiRequest.obj.tuKhoa = textEditingController.text;
    chatBotDanhSachHoiThoaiBloc.add(ChatBotDanhSachHoiThoaiEvent(request: chatBotDanhSachHoiThoaiRequest));
  }


  @override
  Color currentBackgroundColor(BuildContext context) => Colors.white;

  @override
  Widget pageUI(BuildContext context) => Column(
    children: [
      Container(
        margin: const EdgeInsets.only(bottom: 5, top: 5),
        color: Colors.white,
        child: SearchInput(
          controller: textEditingController,
          maxLength: 50,
          textInputAction: TextInputAction.send,
          onFieldSubmitted: (value) => initDataLoading(),
          icon: Icons.search,
          onTap: () {
            initDataLoading();
          },
          hintText: "Nội dung tìm kiếm",
        ),
      ),
      Expanded(
        child: ListView(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 10),
            ),


          ],
        ),
      ),
    ],
  );
}