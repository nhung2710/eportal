

//
// Created by BlackRose on 08/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//

import 'package:eportal/bloc/common_new/dang_nhap_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_gioi_tinh_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_quan_huyen_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_tinh_tp_bloc.dart';
import 'package:eportal/event/common_new/dang_nhap_event.dart';
import 'package:eportal/event/common_new/danh_sach_gioi_tinh_event.dart';
import 'package:eportal/event/common_new/danh_sach_quan_huyen_event.dart';
import 'package:eportal/event/common_new/danh_sach_tinh_tp_event.dart';
import 'package:eportal/model/api/request/common_new/dang_nhap_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_gioi_tinh_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_quan_huyen_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_tinh_tp_request.dart';
import 'package:eportal/model/api/request/common_new/data/dang_nhap_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_gioi_tinh_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_quan_huyen_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_tinh_tp_data_request.dart';
import 'package:eportal/model/api/response/common_new/data/dang_nhap_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_gioi_tinh_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_quan_huyen_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_tinh_tp_data_response.dart';
import 'package:eportal/model/share/default_model_select_item_data_response.dart';
import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/base/page_widget/base_page_widget.dart';
import 'package:eportal/page/widget/default_button.dart';
import 'package:eportal/page/widget/default_capcha_text_form_field.dart';
import 'package:eportal/page/widget/default_date_text_form_field.dart';
import 'package:eportal/page/widget/default_select_item_data_response.dart';
import 'package:eportal/page/widget/default_text_form_field.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../extension/string_extension.dart';

class GroupAddressPage extends BasePageWidget {
  final String title;
  const GroupAddressPage({super.key,required this.title});

  @override
  State<StatefulWidget> createState() => GroupAddressPageState();
}

class GroupAddressPageState extends BasePageState<GroupAddressPage> {

  late DanhSachTinhTpBloc danhSachTinhTpBloc;
  late DanhSachQuanHuyenBloc danhSachQuanHuyenBloc;
  final TextEditingController detailController = TextEditingController();
  DanhSachTinhTpEvent danhSachTinhTpEvent = DanhSachTinhTpEvent(request: DanhSachTinhTpRequest(obj: DanhSachTinhTpDataRequest()));
  DanhSachQuanHuyenEvent danhSachQuanHuyenEvent = DanhSachQuanHuyenEvent(request: DanhSachQuanHuyenRequest(obj: DanhSachQuanHuyenDataRequest()));

  final _keyDanhSachQuanHuyen = GlobalKey<DefaultSelectItemDataResponseState<DanhSachQuanHuyenDataResponse>>();
  DefaultModelSelectItemDataResponse<int>? fromLocation;
  DanhSachTinhTpDataResponse? danhSachTinhTpDataResponse;
  DanhSachQuanHuyenDataResponse? danhSachQuanHuyenDataResponse;
  @override
  void initDataLoading() {
    callApi();
  }

  @override
  void callApi() {
    // TODO: implement callApi
    danhSachTinhTpBloc.add(danhSachTinhTpEvent);
  }
  void callApiQuanHuyen(){
    danhSachQuanHuyenBloc.add(danhSachQuanHuyenEvent);
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    danhSachTinhTpBloc.close();
    danhSachQuanHuyenBloc.close();
  }

  @override
  void getMoreData() {
    // TODO: implement getMoreData
  }

  @override
  void initBloc() {
    // TODO: implement initBloc
    danhSachTinhTpBloc = DanhSachTinhTpBloc();
    danhSachQuanHuyenBloc = DanhSachQuanHuyenBloc();
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
            widget.title,
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
              Container(
                margin: const EdgeInsets.only(bottom: 5, top: 5),
                color: Colors.white,
                child: BlocProvider(
                    create: (_) => danhSachTinhTpBloc,
                    child: BlocListener<DanhSachTinhTpBloc,
                        DataMultiState<DanhSachTinhTpDataResponse>>(
                      listener: (BuildContext context,
                          DataMultiState<DanhSachTinhTpDataResponse>
                          state) {},
                      child: BlocBuilder<DanhSachTinhTpBloc,
                          DataMultiState<DanhSachTinhTpDataResponse>>(
                        builder: (BuildContext context,
                            DataMultiState<DanhSachTinhTpDataResponse>
                            state) =>
                            _buildViewSearchDanhSachTinhTp(
                                context, state.data),
                      ),
                    )),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 5, top: 5),
                color: Colors.white,
                child: BlocProvider(
                    create: (_) => danhSachQuanHuyenBloc,
                    child: BlocListener<DanhSachQuanHuyenBloc,
                        DataMultiState<DanhSachQuanHuyenDataResponse>>(
                      listener: (BuildContext context,
                          DataMultiState<DanhSachQuanHuyenDataResponse>
                          state) {},
                      child: BlocBuilder<DanhSachQuanHuyenBloc,
                          DataMultiState<DanhSachQuanHuyenDataResponse>>(
                        builder: (BuildContext context,
                            DataMultiState<DanhSachQuanHuyenDataResponse>
                            state) =>
                            _buildViewSearchDanhSachQuanHuyen(
                                context, state.data),
                      ),
                    )),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 5, top: 5),
                color: Colors.white,
                child: DefaultTextFormField(
                  icon: FontAwesomeIcons.addressBook,
                  controller: detailController,
                  hintText: "Thôn, tổ, đường phố, số nhà",
                  labelText: "Thôn, tổ, đường phố, số nhà",
                  helperText: "Ví dụ: Thôn 1, tổ 2, đường A, số nhà B",
                  required: true,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: DefaultButton(
                  onPressed: () => submitForm(),
                  text: 'Xác nhận',
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
  Widget _buildViewSearchDanhSachTinhTp(BuildContext context, List<DanhSachTinhTpDataResponse> list)
  {
    return DefaultSelectItemDataResponse<DanhSachTinhTpDataResponse>(
        icon: FontAwesomeIcons.city,
        selectedItem: danhSachTinhTpDataResponse,
        list: list,
        itemAsString: (DanhSachTinhTpDataResponse u) =>
            u.regionalName.supportHtml(),
        onChanged: (DanhSachTinhTpDataResponse? data) {
          if (danhSachTinhTpDataResponse != data) {
            danhSachTinhTpDataResponse = data;
            _keyDanhSachQuanHuyen.currentState?.clear();
            danhSachQuanHuyenEvent.request.obj.tinhTp = danhSachTinhTpDataResponse?.regionalID;
            callApiQuanHuyen();
          }
        },
        labelText: "Tỉnh/Thành phố",
        hintText: "Tỉnh/Thành phố",
        title: "Tỉnh/Thành phố");
  }

  Widget _buildViewSearchDanhSachQuanHuyen(BuildContext context, List<DanhSachQuanHuyenDataResponse> list)
  {
    return DefaultSelectItemDataResponse<DanhSachQuanHuyenDataResponse>(
        key: _keyDanhSachQuanHuyen,
        icon: FontAwesomeIcons.streetView,
        selectedItem: danhSachQuanHuyenDataResponse,
        list: list,
        itemAsString: (DanhSachQuanHuyenDataResponse u) =>
            u.regionalName.supportHtml(),
        onChanged: (DanhSachQuanHuyenDataResponse? data) {
          if (danhSachQuanHuyenDataResponse != data) {
            danhSachQuanHuyenDataResponse = data;
          }
        },
        labelText: "Quận/Huyện",
        hintText: "Quận/Huyện",
        title: "Quận/Huyện");
  }



  void submitForm() {
    backPage();
  }

}