//
// Created by BlackRose on 27/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:eportal/bloc/admin/user_update_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_gioi_tinh_bloc.dart';
import 'package:eportal/event/admin/user_update_event.dart';
import 'package:eportal/event/common_new/danh_sach_gioi_tinh_event.dart';
import 'package:eportal/model/api/response/admin/data/user_update_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_gioi_tinh_data_response.dart';
import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/base/page_widget/base_page_widget.dart';
import 'package:eportal/page/share/change_user_info/widget/change_user_avatar_item.dart';
import 'package:eportal/page/widget/default_button.dart';
import 'package:eportal/page/widget/default_capcha_text_form_field.dart';
import 'package:eportal/page/widget/default_date_text_form_field.dart';
import 'package:eportal/page/widget/default_image_network.dart';
import 'package:eportal/page/widget/default_text_form_field.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../extension/string_extension.dart';
import '../../../../model/api/request/admin/data/user_update_data_request.dart';
import '../../../../model/api/request/admin/user_update_request.dart';
import '../../../../model/api/request/common_new/danh_sach_gioi_tinh_request.dart';
import '../../../../model/api/request/common_new/data/danh_sach_gioi_tinh_data_request.dart';
import '../../../../style/app_color.dart';
import '../../../../style/app_text_style.dart';
import '../../../widget/default_select_item_data_response.dart';

class ChangeUserInfoPage extends BasePageWidget {
  const ChangeUserInfoPage({super.key});

  @override
  State<StatefulWidget> createState() => ChangeUserInfoPageState();
}

class ChangeUserInfoPageState extends BasePageState<ChangeUserInfoPage> {
  TextEditingController hoTenController = TextEditingController();
  TextEditingController ngaySinhController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dienThoaiController = TextEditingController();
  TextEditingController diaChiController = TextEditingController();
  TextEditingController cmndController = TextEditingController();
  UserUpdateEvent userUpdateEvent =
      UserUpdateEvent(request: UserUpdateRequest(obj: UserUpdateDataRequest()));
  DanhSachGioiTinhEvent danhSachGioiTinhEvent = DanhSachGioiTinhEvent(
      request: DanhSachGioiTinhRequest(obj: DanhSachGioiTinhDataRequest()));
  late DanhSachGioiTinhBloc danhSachGioiTinhBloc;
  late UserUpdateBloc userUpdateBloc;
  DanhSachGioiTinhDataResponse? danhSachGioiTinhDataResponse;

  @override
  void callApi() {
    // TODO: implement callApi

    danhSachGioiTinhBloc.add(danhSachGioiTinhEvent);
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    userUpdateBloc.close();
    danhSachGioiTinhBloc.close();
  }

  @override
  void getMoreData() {
    // TODO: implement getMoreData
  }

  @override
  void initBloc() {
    userUpdateBloc = UserUpdateBloc();
    danhSachGioiTinhBloc = DanhSachGioiTinhBloc();
  }

  @override
  void initDataLoading() {
    // TODO: implement initDataLoading
    callApi();
  }

  @override
  double currentPadding(BuildContext context) => 10;

  @override
  PreferredSizeWidget? getAppBar(BuildContext context) => defaultTabBar();

  @override
  Widget pageUI(BuildContext context) => BlocProvider(
        create: (_) => userUpdateBloc,
        child: BlocListener<UserUpdateBloc,
            DataSingleState<UserUpdateDataResponse>>(
          listener: (BuildContext context,
              DataSingleState<UserUpdateDataResponse> state) {
            handlerActionDataSingleState<UserUpdateDataResponse>(state,
                (obj) async {
              showCenterMessage("Thay đổi thông tin tài khoản thành công")
                  .then((value) => backPage());
            });
          },
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Text(
                  "Đổi thông tin tài khoản",
                  style: AppTextStyle.titlePage.copyWith(
                      overflow: TextOverflow.visible,
                      fontSize: 18,
                      color: AppColor.colorOfIconActive),
                ),
              ),
              ChangeUserAvatarItem(
                changed: (String value) {
                  userUpdateEvent.request.obj.anhDaiDien = value;
                }
                ,),
              DefaultTextFormField(
                icon: FontAwesomeIcons.user,
                controller: hoTenController,
                hintText: "Họ và tên",
                labelText: "Họ và tên",
                helperText: "Ví dụ: Nguyễn Văn A",
              ),
              DefaultDateTextFormField(
                hintText: "Ngày tháng năm sinh",
                labelText: "Ngày tháng năm sinh",
                helperText: "Ví dụ: 01/01/2023",
              ),
              DefaultTextFormField(
                icon: FontAwesomeIcons.mobileScreenButton,
                controller: dienThoaiController,
                hintText: "Số điện thoại",
                labelText: "Số điện thoại",
                helperText: "Ví dụ: 0380000000",
              ),
              DefaultTextFormField(
                icon: FontAwesomeIcons.envelope,
                controller: emailController,
                hintText: "Email",
                labelText: "Email",
                helperText: "Ví dụ: abc@gmail.com",
              ),
              DefaultTextFormField(
                icon: FontAwesomeIcons.idCard,
                controller: cmndController,
                hintText: "CMT/CCCD",
                labelText: "CMT/CCCD",
                maxLength: 12,
                helperText: "Ví dụ: 012000000",
              ),
              DefaultTextFormField(
                icon: FontAwesomeIcons.addressCard,
                controller: diaChiController,
                hintText: "Địa chỉ",
                labelText: "Địa chỉ",
                helperText: "Ví dụ: Số 1 ngách 1 ngõ 1 đường 1 quận 1 phường 1",
              ),
              BlocProvider(
                create: (_) => danhSachGioiTinhBloc,
                child: BlocListener<DanhSachGioiTinhBloc,
                    DataMultiState<DanhSachGioiTinhDataResponse>>(
                  listener: (BuildContext context,
                      DataMultiState<DanhSachGioiTinhDataResponse> state) {},
                  child: BlocBuilder<DanhSachGioiTinhBloc,
                          DataMultiState<DanhSachGioiTinhDataResponse>>(
                      builder: (BuildContext context,
                              DataMultiState<DanhSachGioiTinhDataResponse>
                                  state) =>
                          _buildViewSearchDanhSachGioiTinh(
                              context, state.data)),
                ),
              ),
              DefaultCapchaTextFormField(
                helperText: "Ví dụ: AAAAAA",
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: DefaultButton(
                  onPressed: () => changeUserInfo(),
                  text: 'Thay đổi',

                ),
              ),
            ],
          ),
        ),
      );

  Widget _buildViewSearchDanhSachGioiTinh(
      BuildContext context, List<DanhSachGioiTinhDataResponse> list) {
    danhSachGioiTinhDataResponse ??= list.firstOrNull;
    return DefaultSelectItemDataResponse<DanhSachGioiTinhDataResponse>(
      icon: FontAwesomeIcons.venusMars,
      selectedItem: danhSachGioiTinhDataResponse,
      hintText: "Giới tính",
      labelText: "Giới tính",
      helperText: "Ví dụ: Nam",
      list: list,
      itemAsString: (DanhSachGioiTinhDataResponse u) => u.name.supportHtml(),
      onChanged: (DanhSachGioiTinhDataResponse? data) {
        if (danhSachGioiTinhDataResponse != data) {
          danhSachGioiTinhDataResponse = data;
          userUpdateEvent.request.obj.gioiTinh = data?.id;
        }
      },
      title: 'Giới tính',
    );
  }


  void changeUserInfo() {
    if (isValid()) {
      userUpdateEvent.request.obj.email = emailController.text;
      userUpdateEvent.request.obj.cmnd = cmndController.text;
      userUpdateEvent.request.obj.diaChi = diaChiController.text;
      userUpdateEvent.request.obj.ngaySinh = ngaySinhController.text;
      userUpdateEvent.request.obj.dienThoai = dienThoaiController.text;
      userUpdateEvent.request.obj.hoTen = hoTenController.text;
      userUpdateBloc.add(userUpdateEvent);
    }
  }
}
