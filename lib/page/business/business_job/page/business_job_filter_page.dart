//
// Created by BlackRose on 08/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//

import 'package:eportal/bloc/common_new/danh_sach_doanh_nghiep_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_gioi_tinh_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_kinh_nghiem_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_muc_luong_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_quan_huyen_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_tinh_tp_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_trinh_do_bloc.dart';
import 'package:eportal/event/admin/work_search_by_user_name_event.dart';
import 'package:eportal/event/common_new/danh_sach_doanh_nghiep_event.dart';
import 'package:eportal/event/common_new/danh_sach_gioi_tinh_event.dart';
import 'package:eportal/event/common_new/danh_sach_kinh_nghiem_event.dart';
import 'package:eportal/event/common_new/danh_sach_muc_luong_event.dart';
import 'package:eportal/event/common_new/danh_sach_quan_huyen_event.dart';
import 'package:eportal/event/common_new/danh_sach_tinh_tp_event.dart';
import 'package:eportal/event/common_new/danh_sach_trinh_do_event.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_doanh_nghiep_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_gioi_tinh_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_kinh_nghiem_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_muc_luong_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_quan_huyen_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_tinh_tp_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_trinh_do_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_doanh_nghiep_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_gioi_tinh_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_kinh_nghiem_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_muc_luong_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_quan_huyen_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_tinh_tp_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_trinh_do_data_request.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_doanh_nghiep_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_kinh_nghiem_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_muc_luong_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_quan_huyen_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_tinh_tp_data_response.dart';
import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/base/page_widget/base_page_widget.dart';
import 'package:eportal/page/widget/default_button.dart';
import 'package:eportal/page/widget/default_select_item_data_response.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../extension/string_extension.dart';

class BusinessJobFilterPage extends BasePageWidget {
  final WorkSearchByUserNameEvent data;
  const BusinessJobFilterPage({super.key,required this.data});

  @override
  State<StatefulWidget> createState() => BusinessJobFilterPageState();
}

class BusinessJobFilterPageState extends BasePageState<BusinessJobFilterPage> {
  late DanhSachTinhTpBloc danhSachTinhTpBloc;
  late DanhSachQuanHuyenBloc danhSachQuanHuyenBloc;
  late DanhSachMucLuongBloc danhSachMucLuongBloc;
  late DanhSachKinhNghiemBloc danhSachKinhNghiemBloc;
  late DanhSachGioiTinhBloc danhSachGioiTinhBloc;
  late DanhSachTrinhDoBloc danhSachTrinhDoBloc;
  DanhSachTinhTpEvent danhSachTinhTpEvent = DanhSachTinhTpEvent(request: DanhSachTinhTpRequest(obj: DanhSachTinhTpDataRequest()));
  DanhSachQuanHuyenEvent danhSachQuanHuyenEvent = DanhSachQuanHuyenEvent(request: DanhSachQuanHuyenRequest(obj: DanhSachQuanHuyenDataRequest()));
  DanhSachMucLuongEvent danhSachMucLuongEvent = DanhSachMucLuongEvent(request: DanhSachMucLuongRequest(obj: DanhSachMucLuongDataRequest()));
  DanhSachKinhNghiemEvent danhSachKinhNghiemEvent = DanhSachKinhNghiemEvent(request: DanhSachKinhNghiemRequest(obj: DanhSachKinhNghiemDataRequest()));
  DanhSachGioiTinhEvent danhSachGioiTinhEvent = DanhSachGioiTinhEvent(request: DanhSachGioiTinhRequest(obj: DanhSachGioiTinhDataRequest()));
  DanhSachTrinhDoEvent danhSachTrinhDoEvent = DanhSachTrinhDoEvent(request: DanhSachTrinhDoRequest(obj: DanhSachTrinhDoDataRequest()));

  final _keyDanhSachQuanHuyen = GlobalKey<DefaultSelectItemDataResponseState<DanhSachQuanHuyenDataResponse>>();
  final _keyDanhSachDoanhNghiep = GlobalKey<DefaultSelectItemDataResponseState<DanhSachDoanhNghiepDataResponse>>();
  @override
  void initBloc() {
    danhSachTinhTpBloc = DanhSachTinhTpBloc();
    danhSachQuanHuyenBloc = DanhSachQuanHuyenBloc();
    danhSachMucLuongBloc = DanhSachMucLuongBloc();
    danhSachKinhNghiemBloc = DanhSachKinhNghiemBloc();
    danhSachGioiTinhBloc = DanhSachGioiTinhBloc();
    danhSachTrinhDoBloc = DanhSachTrinhDoBloc();
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    danhSachTinhTpBloc.close();
    danhSachQuanHuyenBloc.close();
    danhSachMucLuongBloc.close();
    danhSachKinhNghiemBloc.close();
    danhSachGioiTinhBloc.close();
    danhSachTrinhDoBloc.close();
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

    danhSachTinhTpBloc.add(danhSachTinhTpEvent);
    if (!widget.data.request.obj.tinhTp.isNullOrWhiteSpace()) {
      danhSachQuanHuyenEvent.request.obj.tinhTp =widget.data.request.obj.tinhTp;
      callApiQuanHuyen();
    }
    danhSachMucLuongBloc.add(danhSachMucLuongEvent);
    danhSachKinhNghiemBloc.add(danhSachKinhNghiemEvent);
  }

  void callApiQuanHuyen(){
    danhSachQuanHuyenBloc.add(danhSachQuanHuyenEvent);
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
                      child: BlocProvider(
                          create: (_) => danhSachKinhNghiemBloc,
                          child: BlocListener<DanhSachKinhNghiemBloc,
                              DataMultiState<DanhSachKinhNghiemDataResponse>>(
                            listener: (BuildContext context,
                                DataMultiState<DanhSachKinhNghiemDataResponse>
                                state) {},
                            child: BlocBuilder<DanhSachKinhNghiemBloc,
                                DataMultiState<DanhSachKinhNghiemDataResponse>>(
                              builder: (BuildContext context,
                                  DataMultiState<DanhSachKinhNghiemDataResponse>
                                  state) =>
                                  _buildViewSearchDanhSachKinhNghiem(
                                      context, state.data),
                            ),
                          )),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 5, top: 5),
                      color: Colors.white,
                      child: BlocProvider(
                          create: (_) => danhSachMucLuongBloc,
                          child: BlocListener<DanhSachMucLuongBloc,
                              DataMultiState<DanhSachMucLuongDataResponse>>(
                            listener: (BuildContext context,
                                DataMultiState<DanhSachMucLuongDataResponse>
                                state) {},
                            child: BlocBuilder<DanhSachMucLuongBloc,
                                DataMultiState<DanhSachMucLuongDataResponse>>(
                              builder: (BuildContext context,
                                  DataMultiState<DanhSachMucLuongDataResponse>
                                  state) =>
                                  _buildViewSearchDanhSachMucLuong(
                                      context, state.data),
                            ),
                          )),
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

  Widget _buildViewSearchDanhSachTinhTp(BuildContext context, List<DanhSachTinhTpDataResponse> list)
  {
    var selectedItem = list.where((element) => element.regionalID == widget.data.request.obj.tinhTp).firstOrNull;
    return DefaultSelectItemDataResponse<DanhSachTinhTpDataResponse>(
        icon: FontAwesomeIcons.city,
        selectedItem: selectedItem,
        list: list,
        itemAsString: (DanhSachTinhTpDataResponse u) =>
            u.regionalName.supportHtml(),
        onChanged: (DanhSachTinhTpDataResponse? data) {
          if (selectedItem != data) {
            selectedItem = data;
            widget.data.request.obj.tinhTp = data?.regionalID;
            widget.data.request.obj.quanHuyen = null;
            _keyDanhSachQuanHuyen.currentState?.clear();
            _keyDanhSachDoanhNghiep.currentState?.clear();
            danhSachQuanHuyenEvent.request.obj.tinhTp = widget.data.request.obj.tinhTp;
            callApiQuanHuyen();
          }
        },
        labelText: "Tỉnh/Thành phố",
        hintText: "Tỉnh/Thành phố",
        title: "Tỉnh/Thành phố");
  }

  Widget _buildViewSearchDanhSachQuanHuyen(BuildContext context, List<DanhSachQuanHuyenDataResponse> list)
  {
    var selectedItem = list.where((element) => element.regionalID == widget.data.request.obj.quanHuyen).firstOrNull;
    return DefaultSelectItemDataResponse<DanhSachQuanHuyenDataResponse>(
        key: _keyDanhSachQuanHuyen,
        icon: FontAwesomeIcons.streetView,
        selectedItem: selectedItem,
        list: list,
        itemAsString: (DanhSachQuanHuyenDataResponse u) =>
            u.regionalName.supportHtml(),
        onChanged: (DanhSachQuanHuyenDataResponse? data) {
          if (selectedItem != data) {
            selectedItem = data;
            widget.data.request.obj.quanHuyen = data?.regionalID;
          }
        },
        labelText: "Quận/Huyện",
        hintText: "Quận/Huyện",
        title: "Quận/Huyện");
  }
  Widget _buildViewSearchDanhSachKinhNghiem(BuildContext context, List<DanhSachKinhNghiemDataResponse> list)
  {
    var selectedItem = list.where((element) => element.experienceID == widget.data.request.obj.kinhNghiem).firstOrNull;
    return DefaultSelectItemDataResponse<DanhSachKinhNghiemDataResponse>(
        icon: FontAwesomeIcons.timeline,
        selectedItem: selectedItem,
        list: list,
        itemAsString: (DanhSachKinhNghiemDataResponse u) =>
            u.experienceName.supportHtml(),
        onChanged: (DanhSachKinhNghiemDataResponse? data) {
          if (selectedItem != data) {
            selectedItem = data;
            widget.data.request.obj.kinhNghiem = data?.experienceID;
          }
        },
        labelText: "Kinh nghiệm",
        hintText: "Kinh nghiệm",
        title: "Kinh nghiệm");
  }
  Widget _buildViewSearchDanhSachMucLuong(BuildContext context, List<DanhSachMucLuongDataResponse> list)
  {
    var selectedItem = list.where((element) => element.salaryID == widget.data.request.obj.mucLuong).firstOrNull;
    return DefaultSelectItemDataResponse<DanhSachMucLuongDataResponse>(
        icon: FontAwesomeIcons.moneyBill,
        selectedItem: selectedItem,
        list: list,
        itemAsString: (DanhSachMucLuongDataResponse u) =>
            u.salaryName.supportHtml(),
        onChanged: (DanhSachMucLuongDataResponse? data) {
          if (selectedItem != data) {
            selectedItem = data;
            widget.data.request.obj.mucLuong = data?.salaryID;
          }
        },
        labelText: "Mức lương",
        hintText: "Mức lương",
        title: "Mức lương");
  }

  void submitForm() {
    backPage(widget.data);
  }



}