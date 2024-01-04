//
// Created by BlackRose on 03/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//
import 'package:eportal/bloc/admin/chat_bot_danh_dau_sao_bloc.dart';
import 'package:eportal/bloc/admin/chat_bot_danh_sach_hoi_thoai_bloc.dart';
import 'package:eportal/bloc/admin/chat_bot_them_cau_mau_bloc.dart';
import 'package:eportal/bloc/admin/chat_bot_xoa_hoi_thoai_bloc.dart';
import 'package:eportal/event/admin/chat_bot_danh_dau_sao_event.dart';
import 'package:eportal/event/admin/chat_bot_danh_sach_hoi_thoai_event.dart';
import 'package:eportal/event/admin/chat_bot_them_cau_mau_event.dart';
import 'package:eportal/event/admin/chat_bot_xoa_hoi_thoai_event.dart';
import 'package:eportal/extension/error_extension.dart';
import 'package:eportal/model/api/request/admin/chat_bot_danh_dau_sao_request.dart';
import 'package:eportal/model/api/request/admin/chat_bot_danh_sach_hoi_thoai_request.dart';
import 'package:eportal/model/api/request/admin/chat_bot_them_cau_mau_request.dart';
import 'package:eportal/model/api/request/admin/chat_bot_xoa_hoi_thoai_request.dart';
import 'package:eportal/model/api/request/admin/data/chat_bot_danh_dau_sao_data_request.dart';
import 'package:eportal/model/api/request/admin/data/chat_bot_danh_sach_hoi_thoai_data_request.dart';
import 'package:eportal/model/api/request/admin/data/chat_bot_them_cau_mau_data_request.dart';
import 'package:eportal/model/api/request/admin/data/chat_bot_xoa_hoi_thoai_data_request.dart';
import 'package:eportal/model/api/response/admin/data/chat_bot_danh_sach_hoi_thoai_data_response.dart';
import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/base/page_widget/base_page_widget.dart';
import 'package:eportal/page/share/chat_bot_conversation_detail/page/chat_bot_conversation_detail_page.dart';
import 'package:eportal/page/share/chat_bot_conversation_search/page/chat_bot_conversation_search_filter_page.dart';
import 'package:eportal/page/share/profile/widget/profile_item.dart';
import 'package:eportal/page/widget/default_search_form_field.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_size_icon.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/expandable_fab/expandable_fab.dart';
import 'package:eportal/widget/input/field_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widget/chat_bot_conversation_search_item.dart';
class ChatBotConversationSearchPage extends BasePageWidget {
  const ChatBotConversationSearchPage({super.key});

  @override
  State<StatefulWidget> createState() => ChatBotConversationSearchPageState();
}

class ChatBotConversationSearchPageState
    extends BasePageState<ChatBotConversationSearchPage> {
  late ChatBotDanhSachHoiThoaiBloc chatBotDanhSachHoiThoaiBloc;
  late ChatBotDanhDauSaoBloc chatBotDanhDauSaoBloc;
  late ChatBotXoaHoiThoaiBloc chatBotXoaHoiThoaiBloc;
  ChatBotDanhSachHoiThoaiEvent chatBotDanhSachHoiThoaiEvent = ChatBotDanhSachHoiThoaiEvent(request: ChatBotDanhSachHoiThoaiRequest(obj: ChatBotDanhSachHoiThoaiDataRequest()));
  ChatBotDanhDauSaoEvent chatBotDanhDauSaoEvent = ChatBotDanhDauSaoEvent(request: ChatBotDanhDauSaoRequest(obj: ChatBotDanhDauSaoDataRequest()));
  ChatBotXoaHoiThoaiEvent chatBotXoaHoiThoaiEvent = ChatBotXoaHoiThoaiEvent(request: ChatBotXoaHoiThoaiRequest(obj: ChatBotXoaHoiThoaiDataRequest()));
  TextEditingController textEditingController = TextEditingController();
  ChatBotThemCauMauEvent chatBotThemCauMauEvent = ChatBotThemCauMauEvent(request: ChatBotThemCauMauRequest(obj: ChatBotThemCauMauDataRequest()));

  late ChatBotThemCauMauBloc chatBotThemCauMauBloc;
  TextEditingController cauMauController = TextEditingController();
  @override
  void initBloc() {
    chatBotDanhSachHoiThoaiBloc = ChatBotDanhSachHoiThoaiBloc();
    chatBotThemCauMauBloc = ChatBotThemCauMauBloc();
    chatBotDanhDauSaoBloc = ChatBotDanhDauSaoBloc();
    chatBotXoaHoiThoaiBloc = ChatBotXoaHoiThoaiBloc();
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    chatBotThemCauMauBloc.close();
    chatBotDanhSachHoiThoaiBloc.close();
    chatBotDanhDauSaoBloc.close();
    chatBotXoaHoiThoaiBloc.close();
  }

  @override
  void getMoreData() {
    // TODO: implement getMoreData
    chatBotDanhSachHoiThoaiEvent.request.obj.nextData();
    callApi();
  }

  @override
  void initDataLoading() {
    chatBotDanhSachHoiThoaiEvent.request.obj.reloadData();
    callApi();
  }

  @override
  void callApi() {
    chatBotDanhSachHoiThoaiBloc.add(chatBotDanhSachHoiThoaiEvent);
  }

  @override
  Widget? getFloatingActionButton(BuildContext context) => ExpandableFab(
    initNumberGroup: 1,
    children: [
      ActionButton(
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () => themCauMau(),
      ),
    ],
  );
  @override
  PreferredSizeWidget? getAppBar(BuildContext context) => AppBar(
    title: Text(
      getPageTitle(context),
      style: AppTextStyle.titleAppbarPage,
    ),
    backgroundColor: AppColor.colorOfIcon,
    automaticallyImplyLeading: true,
    centerTitle: true,
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: GestureDetector(
            onTap: () {
              nextPage((context) => ChatBotConversationSearchFilterPage(data:chatBotDanhSachHoiThoaiEvent)).then((value) {
                if(value!=null) {
                  chatBotDanhSachHoiThoaiEvent = value;
                  initDataLoading();
                }
              });
            },
            child: const Icon(
              FontAwesomeIcons.filter,
              color: Colors.white,
              size: AppSizeIcon.sizeOfNormal,
            ),
          ),
        ),
      )
    ],
  );

  @override
  Widget pageUI(BuildContext context) => BlocProvider(
    create: (_) => chatBotThemCauMauBloc,
    child: BlocListener<ChatBotThemCauMauBloc,
        DataSingleState<String>>(
      listener: (context,state){
        handlerActionDataSingleState<String>(state, (obj) {
          showCenterMessage("Thêm câu mẫu thành công").then((value) => initDataLoading());
        });
      },
      child: BlocProvider(
        create: (_) => chatBotDanhDauSaoBloc,
        child: BlocListener<ChatBotDanhDauSaoBloc,
            DataSingleState<String>>(
          listener: (context,state){
            handlerActionDataSingleState<String>(state, (obj) {
              showCenterMessage("Đánh dấu sao hội thoại thành công").then((value) => initDataLoading());
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
              child: Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        "Danh sách hội thoại",
                        style: AppTextStyle.titlePage.copyWith(
                            overflow: TextOverflow.visible,
                            fontSize: 18,
                            color: AppColor.colorOfIconActive),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 5, top: 5),
                      color: Colors.white,
                      child: DefaultSearchFormField(
                        controller: textEditingController,
                        icon: FontAwesomeIcons.magnifyingGlass,
                        maxLength: 100,
                        textInputAction: TextInputAction.send,
                        onFieldSubmitted: (value) => initDataLoading(),
                        hintText: "Nội dung tìm kiếm",
                        labelText: "Nội dung tìm kiếm",
                        helperText: "Ví dụ: abc",
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
                                        (context, state) => ListView(
                                      shrinkWrap: true,
                                      controller: scrollController,
                                      children: state.where((element) => element.isDelete != true).map((e) => ChatBotConversationSearchItem(data: e,
                                        onClickItem: (ChatBotDanhSachHoiThoaiDataResponse value) => showChooseAction(value),
                                      )).toList(),),
                                  ),
                            ),
                          )),
                    ),
                  ],
                ),
              )
            ),
          ),
        ),
      ),
    ),
  );


  alertChangeRateStar(ChatBotDanhSachHoiThoaiDataResponse value) {

    var rateStar = ErrorExtension().handleFunctionError(() => double.tryParse(value.danhDauSao??"0")??0)??0;
    showAlertChoose(allow: ()=>updateStar(value,rateStar),
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

  void updateStar(ChatBotDanhSachHoiThoaiDataResponse item,double rateStar) {
    chatBotDanhDauSaoEvent.request.obj.idHoiThoai = item.id;
    chatBotDanhDauSaoEvent.request.obj.soSao = rateStar.toInt().toString();
    chatBotDanhDauSaoBloc.add(chatBotDanhDauSaoEvent);
  }

  void removeConversation(ChatBotDanhSachHoiThoaiDataResponse item) {
    showAlertChoose(
      title: "Xoá hội thoại",
      desc: "Bạn chắc chắn muốn xoá hội thoại này không?",
      allow: (){
        chatBotXoaHoiThoaiEvent.request.obj.idHoiThoai = item.id;
        chatBotXoaHoiThoaiBloc.add(chatBotXoaHoiThoaiEvent);
      },
    );
  }

  void showChooseAction(ChatBotDanhSachHoiThoaiDataResponse value) {
    showBaseBottomSheet(
        children:[
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              nextPage((context) => ChatBotConversationDetailPage(conversationId: value.id,));
            },
            child: ListTile(
              leading: const Icon(
                FontAwesomeIcons.eye,
                color: AppColor.colorOfIcon,
                size: AppSizeIcon.sizeOfNormal,
              ),
              title: Text("Xem chi tiết hội thoại",style: AppTextStyle.title.copyWith(overflow: TextOverflow.visible),),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              alertChangeRateStar(value);
            },
            child: ListTile(
              leading: const Icon(
                FontAwesomeIcons.solidStar,
                color: AppColor.colorOfIcon,
                size: AppSizeIcon.sizeOfNormal,
              ),
              title: Text("Đánh dấu sao hội thoại",style: AppTextStyle.title.copyWith(overflow: TextOverflow.visible),),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              removeConversation(value);
            },
            child: ListTile(
              leading: const Icon(
                FontAwesomeIcons.trashCan,
                color: Colors.red,
                size: AppSizeIcon.sizeOfNormal,
              ),
              title: Text("Xoá",style: AppTextStyle.title.copyWith(overflow: TextOverflow.visible,color: Colors.red),),
            ),
          )
        ]
    );
  }

  void themCauMau() {
    showAlertChoose(allow: () {
      chatBotThemCauMauEvent.request.obj.cauMau = cauMauController.text;
      chatBotThemCauMauBloc.add(chatBotThemCauMauEvent);
    },
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

}