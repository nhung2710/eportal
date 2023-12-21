//
// Created by BlackRose on 20/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:eportal/bloc/admin/chat_bot_danh_dau_sao_bloc.dart';
import 'package:eportal/bloc/admin/chat_bot_xoa_hoi_thoai_bloc.dart';
import 'package:eportal/event/admin/chat_bot_danh_dau_sao_event.dart';
import 'package:eportal/event/admin/chat_bot_xoa_hoi_thoai_event.dart';
import 'package:eportal/extension/error_extension.dart';
import 'package:eportal/model/api/request/admin/chat_bot_danh_dau_sao_request.dart';
import 'package:eportal/model/api/request/admin/chat_bot_xoa_hoi_thoai_request.dart';
import 'package:eportal/model/api/request/admin/data/chat_bot_danh_dau_sao_data_request.dart';
import 'package:eportal/model/api/request/admin/data/chat_bot_xoa_hoi_thoai_data_request.dart';
import 'package:eportal/model/api/response/admin/data/chat_bot_danh_dau_sao_data_response.dart';
import 'package:eportal/model/api/response/admin/data/chat_bot_danh_sach_hoi_thoai_data_response.dart';
import 'package:eportal/model/api/response/admin/data/chat_bot_xoa_hoi_thoai_data_response.dart';
import 'package:eportal/screen/share/chat_bot_detail/page/chat_bot_detail_page.dart';
import 'package:eportal/screen/share/chat_bot_manage/widget/chat_bot_manage_item.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/input/search_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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
  ChatBotDanhSachHoiThoaiRequest chatBotDanhSachHoiThoaiRequest =
  ChatBotDanhSachHoiThoaiRequest(
      obj: ChatBotDanhSachHoiThoaiDataRequest(trangThai: 0));
  ChatBotDanhDauSaoRequest chatBotDanhDauSaoRequest = ChatBotDanhDauSaoRequest(obj: ChatBotDanhDauSaoDataRequest());
  ChatBotXoaHoiThoaiRequest chatBotXoaHoiThoaiRequest = ChatBotXoaHoiThoaiRequest(obj: ChatBotXoaHoiThoaiDataRequest());
  late ChatBotDanhSachHoiThoaiBloc chatBotDanhSachHoiThoaiBloc;
  late ChatBotDanhDauSaoBloc chatBotDanhDauSaoBloc;
  late ChatBotXoaHoiThoaiBloc chatBotXoaHoiThoaiBloc;
  late ChatBotDanhSachHoiThoaiDataResponse chatBotDanhSachHoiThoaiDataResponseSelected;
  double rateStar = 0;
  @override
  void initBloc() {
    chatBotDanhSachHoiThoaiBloc = ChatBotDanhSachHoiThoaiBloc();
    chatBotDanhDauSaoBloc = ChatBotDanhDauSaoBloc();
    chatBotXoaHoiThoaiBloc = ChatBotXoaHoiThoaiBloc();
  }

  @override
  void initDataLoading() {
    chatBotDanhSachHoiThoaiRequest.obj.soTrangHienTai = 1;
    callApi();
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    chatBotDanhSachHoiThoaiBloc.close();
    chatBotDanhDauSaoBloc.close();
    chatBotXoaHoiThoaiBloc.close();
  }

  @override
  void getMoreData() {
    chatBotDanhSachHoiThoaiRequest.obj.soTrangHienTai++;
    callApi();
  }

  @override
  void callApi() {
    chatBotDanhSachHoiThoaiRequest.obj.tuKhoa = textEditingController.text;
    chatBotDanhSachHoiThoaiBloc.add(
        ChatBotDanhSachHoiThoaiEvent(request: chatBotDanhSachHoiThoaiRequest));
  }

  @override
  Color currentBackgroundColor(BuildContext context) => Colors.white;

  @override
  Widget pageUI(BuildContext context) => BlocProvider(
    create: (_) => chatBotDanhDauSaoBloc,
    child: BlocListener<ChatBotDanhDauSaoBloc,
        DataSingleState<String>>(
      listener: (context,state){
        handlerActionDataSingleState<String>(state, (obj) {
          showCenterMessage("Đánh dấu sao thành công").then((value) => initDataLoading());
        });
      },
      child: BlocProvider(
        create: (_) => chatBotXoaHoiThoaiBloc,
        child: BlocListener<ChatBotXoaHoiThoaiBloc,
            DataSingleState<String>>(
          listener: (context,state){
            handlerActionDataSingleState<String>(state, (obj) {
              showCenterMessage("Xoá hội thoại thành công").then((value) => initDataLoading());
            });
          },
          child: Column(
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
                child: BlocProvider(
                    create: (_) => chatBotDanhSachHoiThoaiBloc,
                    child: BlocListener<ChatBotDanhSachHoiThoaiBloc,
                        DataPageState<ChatBotDanhSachHoiThoaiDataResponse>>(
                      listener: (BuildContext context,
                          DataPageState<ChatBotDanhSachHoiThoaiDataResponse> state) {},
                      child: BlocBuilder<ChatBotDanhSachHoiThoaiBloc,
                          DataPageState<ChatBotDanhSachHoiThoaiDataResponse>>(
                        builder: (BuildContext context,
                            DataPageState<ChatBotDanhSachHoiThoaiDataResponse> state) =>
                            handleDataPageState<ChatBotDanhSachHoiThoaiDataResponse>(
                              state,
                                  (context, state) {
                                    var lstData = state.where((element) => !(element.isDelete??false)).toList();
                                    return ListView.builder(
                                        shrinkWrap: true,
                                        controller: scrollController,
                                        itemCount: lstData.length,
                                        itemBuilder: (context, i) => ChatBotManageItem(
                                          data : lstData.elementAt(i),
                                          onTapDetail: () => onDetail(state.elementAt(i)),
                                          onTapDelete: () => onDelete(state.elementAt(i)),
                                          onTapChangeStar: () => onChangeStar(state.elementAt(i)),

                                        ));
                                  },
                            ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    ),
  );

  onDetail(ChatBotDanhSachHoiThoaiDataResponse item) {
    nextPage((context) => ChatBotDetailPage(id: item.id,));
  }

  onDelete(ChatBotDanhSachHoiThoaiDataResponse item) {
    showAlertChoose(allow: ()=>delete(item),
      title: "Xoá hội thoại",
      desc: "Bạn chắc chắn muốn xoá hội thoại này không?",);
  }


  void delete(ChatBotDanhSachHoiThoaiDataResponse item) {
    chatBotXoaHoiThoaiRequest.obj.idHoiThoai = item.id;
    chatBotXoaHoiThoaiBloc.add(ChatBotXoaHoiThoaiEvent(request: chatBotXoaHoiThoaiRequest));
  }
  onChangeStar(ChatBotDanhSachHoiThoaiDataResponse item) {
    chatBotDanhSachHoiThoaiDataResponseSelected = item;
    rateStar = ErrorExtension().handleFunctionError(() => double.tryParse(item.danhDauSao??"0")??0)??0;

    showAlertChoose(allow: ()=>updateStar(item),
      content: Container(
        margin: const EdgeInsets.only(top: 10),
        width: double.infinity,
        child: Center(
          child: RatingBar.builder(
            initialRating: rateStar,
            unratedColor: Colors.grey,
            itemSize: 40,
            glow: false,
            itemCount: 5,
            wrapAlignment: WrapAlignment.center,
            itemBuilder: (BuildContext context, int index) => const Icon(
              Icons.star,
              color: AppColor.colorOfIcon,
            ),
            onRatingUpdate: (double value) {
              rateStar = value;
            },
          ),
        ),
      ),
      title: "Đánh dấu sao",);
  }

  void updateStar(ChatBotDanhSachHoiThoaiDataResponse item) {
    chatBotDanhDauSaoRequest.obj.idHoiThoai = item.id;
    chatBotDanhDauSaoRequest.obj.soSao = rateStar.toInt().toString();
    chatBotDanhDauSaoBloc.add(ChatBotDanhDauSaoEvent(request: chatBotDanhDauSaoRequest));
  }

}