//
// Created by BlackRose on 04/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//

import 'package:eportal/event/admin/chat_bot_danh_sach_hoi_thoai_event.dart';
import 'package:eportal/event/admin/chat_bot_them_cau_mau_event.dart';
import 'package:eportal/model/share/default_model_select_item_data_response.dart';
import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/base/page_widget/base_page_widget.dart';
import 'package:eportal/page/widget/default_button.dart';
import 'package:eportal/page/widget/default_select_item_data_response.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../extension/string_extension.dart';

class ChatBotConversationSearchFilterPage extends BasePageWidget {
  final ChatBotDanhSachHoiThoaiEvent data;
  const ChatBotConversationSearchFilterPage({super.key,required this.data});

  @override
  State<StatefulWidget> createState() => ChatBotConversationSearchFilterPageState();
}

class ChatBotConversationSearchFilterPageState extends BasePageState<ChatBotConversationSearchFilterPage> {

  final List<DefaultModelSelectItemDataResponse<int>> danhSachTrangThai = [
    DefaultModelSelectItemDataResponse<int>(item: 1, text: "Đang yêu cầu"),
    DefaultModelSelectItemDataResponse<int>(item: 0, text: "Tất cả")
  ];
  @override
  void initBloc() {
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
  }

  @override
  void initDataLoading() {
    callApi();
  }

  @override
  void getMoreData() {
  }

  @override
  void callApi() {

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
            "Chọn tiêu chí tìm kiếm",
            style: AppTextStyle.titlePage.copyWith(
                overflow: TextOverflow.visible,
                fontSize: 18,
                color: AppColor.colorOfIconActive),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 5, top: 5),
                      color: Colors.white,
                      child:
                      _buildViewSearchDanhSachTrangThai(
                          context, danhSachTrangThai),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: DefaultButton(
                  onPressed: () => submitForm(),
                  text: 'Tìm kiếm',
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget _buildViewSearchDanhSachTrangThai(BuildContext context, List<DefaultModelSelectItemDataResponse<int>> list)
  {
    var selectedItem = list.where((element) => element.item == widget.data.request.obj.trangThai).firstOrNull;
    return DefaultSelectItemDataResponse<DefaultModelSelectItemDataResponse<int>>(
        icon: FontAwesomeIcons.arrowsToDot,
        selectedItem: selectedItem,
        list: list,
        itemAsString: (DefaultModelSelectItemDataResponse<int> u) =>
            u.text.supportHtml(),
        onChanged: (DefaultModelSelectItemDataResponse<int>? data) {
          if (selectedItem != data) {
            selectedItem = data;
            widget.data.request.obj.trangThai = data?.item;
          }
        },
        labelText: "Trạng thái",
        hintText: "Trạng thái",
        title: "Trạng thái");
  }

  void submitForm() {
    backPage(widget.data);
  }



}