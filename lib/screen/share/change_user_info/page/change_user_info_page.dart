import 'package:eportal/model/api/response/admin/data/user_update_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_gioi_tinh_data_response.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/widget/change_avatar/change_avatar.dart';
import 'package:eportal/widget/default_button/default_button.dart';
import 'package:eportal/widget/input/date_input.dart';
import 'package:eportal/widget/select/select_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../bloc/admin/user_update_bloc.dart';
import '../../../../bloc/common_new/danh_sach_gioi_tinh_bloc.dart';
import '../../../../event/admin/user_update_event.dart';
import '../../../../event/common_new/danh_sach_gioi_tinh_event.dart';
import '../../../../extension/string_extension.dart';
import '../../../../model/api/request/admin/data/user_update_data_request.dart';
import '../../../../model/api/request/admin/user_update_request.dart';
import '../../../../model/api/request/common_new/danh_sach_gioi_tinh_request.dart';
import '../../../../model/api/request/common_new/data/danh_sach_gioi_tinh_data_request.dart';
import '../../../../widget/base/base_page.dart';
import '../../../../widget/input/field_input.dart';

//
// Created by BlackRose on 14/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class ChangeUserInfoPage extends BasePage {
  const ChangeUserInfoPage({super.key});

  @override
  State<StatefulWidget> createState() => _ChangeUserInfoPageState();
}

class _ChangeUserInfoPageState extends BasePageState<ChangeUserInfoPage> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController birthDayController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController idCardController = TextEditingController();
  late DanhSachGioiTinhBloc danhSachGioiTinhBloc;
  UserUpdateRequest request = UserUpdateRequest(obj: UserUpdateDataRequest());
  DanhSachGioiTinhDataResponse? danhSachGioiTinhDataResponse;
  late UserUpdateBloc userUpdateBloc;
  String? gioitinh = "0";

  @override
  void initBloc() {
    userUpdateBloc = UserUpdateBloc();
    danhSachGioiTinhBloc = DanhSachGioiTinhBloc();
  }
  @override
  void disposeBloc() {
    userUpdateBloc.close();
    danhSachGioiTinhBloc.close();
  }

  @override
  void getMoreData() {
    // TODO: implement getMoreData
  }

  @override
  void initDataLoading() {
    callApi();
    // TODO: implement initDataLoading
  }

  @override
  void callApi() {
    danhSachGioiTinhBloc.add(DanhSachGioiTinhEvent(
        request: DanhSachGioiTinhRequest(obj: DanhSachGioiTinhDataRequest())));
  }

  @override
  String getPageTitle(BuildContext context) => "Thay thông tin";

  @override
  Color currentBackgroundColor(BuildContext context) => Colors.white;

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
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: ChangeAvatar(
                      changed: (String value) {
                        request.obj.anhDaiDien = value;
                      },
                    )),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: FieldInput(
                  controller: fullNameController,
                  maxLength: 50,
                  textInputAction: TextInputAction.next,
                  validator: (text) {
                    if (text.isNullOrWhiteSpace()) {
                      return 'Họ và tên không được để trống';
                    }
                    return null;
                  },
                  hintText: 'Họ và tên',
                  icon: Icons.account_box,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: DateInput(
                  controller: birthDayController,
                  textInputAction: TextInputAction.next,
                  validator: (text) {
                    if (text.isNullOrWhiteSpace()) {
                      return 'Ngày tháng năm sinh không được để trống';
                    }
                    return null;
                  },
                  hintText: 'Năm sinh',
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: FieldInput(
                  controller: emailController,
                  maxLength: 50,
                  textInputAction: TextInputAction.next,
                  validator: (text) {
                    if (text.isNullOrWhiteSpace()) {
                      return 'Địa chỉ thư điện tử không được để trống';
                    }
                    return null;
                  },
                  hintText: 'Địa chỉ thư điện tử',
                  icon: Icons.email,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: FieldInput(
                    controller: phoneController,
                    keyboardType: TextInputType.number,
                    maxLength: 50,
                    textInputAction: TextInputAction.next,
                    validator: (text) {
                      if (text.isNullOrWhiteSpace()) {
                        return 'Điện thoại không được để trống';
                      }
                      return null;
                    },
                    hintText: 'Điện thoại',
                    icon: Icons.phone),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: BlocProvider(
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
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: FieldInput(
                  controller: idCardController,
                  maxLength: 12,
                  textInputAction: TextInputAction.done,
                  validator: (text) {
                    if (text.isNullOrWhiteSpace()) {
                      return 'Căn cước công dân không được để trống';
                    }
                    return null;
                  },
                  onFieldSubmitted: (value) => _changeUserInfo(context),
                  hintText: 'Căn cước công dân',
                  icon: Icons.credit_card_sharp,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: FieldInput(
                  controller: addressController,
                  maxLength: 50,
                  textInputAction: TextInputAction.done,
                  validator: (text) {
                    if (text.isNullOrWhiteSpace()) {
                      return 'Địa chỉ không được để trống';
                    }
                    return null;
                  },
                  onFieldSubmitted: (value) => _changeUserInfo(context),
                  hintText: 'Địa chỉ',
                  icon: Icons.home,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: DefaultButton(
                    onPressed: () => _changeUserInfo(context),
                    text: 'Thay đổi thông tin'),
              ),
            ],
          ),
        ),
      );

  _changeUserInfo(BuildContext context) {
    if (isValid()) {
      request.obj.email = emailController.text;
      request.obj.cmnd = idCardController.text;
      request.obj.diaChi = addressController.text;
      request.obj.ngaySinh = birthDayController.text;
      request.obj.dienThoai = phoneController.text;
      request.obj.hoTen = fullNameController.text;
      userUpdateBloc
          .add(UserUpdateEvent(request: request));
    }
  }

  Widget _buildViewSearchDanhSachGioiTinh(
      BuildContext context, List<DanhSachGioiTinhDataResponse> list) {
    return SelectItem<DanhSachGioiTinhDataResponse>(
      icon: FontAwesomeIcons.genderless,
      selectedItem: danhSachGioiTinhDataResponse,
      list: list,
      itemAsString: (DanhSachGioiTinhDataResponse u) => u.name.supportHtml(),
      onChanged: (DanhSachGioiTinhDataResponse? data) {
        if (danhSachGioiTinhDataResponse != data) {
          danhSachGioiTinhDataResponse = data;
          request.obj.gioiTinh = data?.id;
        }
      },
      title: 'Giới tính',
    );
  }

}
