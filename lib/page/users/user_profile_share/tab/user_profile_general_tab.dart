//
// Created by BlackRose on 05/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//

import 'package:eportal/bloc/common_new/danh_sach_chuc_vu_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_gioi_tinh_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_kinh_nghiem_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_muc_luong_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_nhu_cau_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_trinh_do_bloc.dart';
import 'package:eportal/event/common_new/danh_sach_kinh_nghiem_event.dart';
import 'package:eportal/event/common_new/danh_sach_muc_luong_event.dart';
import 'package:eportal/event/common_new/danh_sach_nhu_cau_event.dart';
import 'package:eportal/event/common_new/danh_sach_trinh_do_event.dart';
import 'package:eportal/model/api/request/admin/data/job_user_refer_add_data_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_chuc_vu_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_kinh_nghiem_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_nhu_cau_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_chuc_vu_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_kinh_nghiem_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_nhu_cau_data_request.dart';
import 'package:eportal/model/api/response/admin/data/job_user_list_by_user_name_data_response.dart';
import 'package:eportal/page/base/page_state/base_page_keep_state.dart';
import 'package:eportal/page/base/page_widget/base_page_widget.dart';
import 'package:eportal/page/widget/default_card_item.dart';
import 'package:eportal/page/widget/default_text_form_field.dart';
import 'package:eportal/style/app_size_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../event/common_new/danh_sach_chuc_vu_event.dart';
import '../../../../extension/string_extension.dart';
import '../../../../model/api/request/common_new/danh_sach_muc_luong_request.dart';
import '../../../../model/api/request/common_new/danh_sach_trinh_do_request.dart';
import '../../../../model/api/request/common_new/data/danh_sach_muc_luong_data_request.dart';
import '../../../../model/api/request/common_new/data/danh_sach_trinh_do_data_request.dart';

class UserProfileGeneralTab extends BasePageWidget{

  final JobUserListByUserNameDataResponse? data;

  const UserProfileGeneralTab({super.key,this.data});


  @override
  State<StatefulWidget> createState() => UserProfileGeneralTabState();
}

class UserProfileGeneralTabState extends BasePageKeepState<UserProfileGeneralTab>{

  late DanhSachMucLuongBloc danhSachMucLuongBloc;
  late DanhSachKinhNghiemBloc danhSachKinhNghiemBloc;
  late DanhSachGioiTinhBloc danhSachGioiTinhBloc;
  late DanhSachTrinhDoBloc danhSachTrinhDoBloc;
  late DanhSachChucVuBloc danhSachChucVuBloc;
  late DanhSachNhuCauBloc danhSachNhuCauBloc;

  DanhSachChucVuEvent danhSachChucVuEvent = DanhSachChucVuEvent(request: DanhSachChucVuRequest(obj: DanhSachChucVuDataRequest()));
  DanhSachTrinhDoEvent danhSachTrinhDoEvent = DanhSachTrinhDoEvent(request: DanhSachTrinhDoRequest(obj: DanhSachTrinhDoDataRequest()));
  DanhSachMucLuongEvent danhSachMucLuongEvent = DanhSachMucLuongEvent(request: DanhSachMucLuongRequest(obj: DanhSachMucLuongDataRequest()));
  DanhSachKinhNghiemEvent danhSachKinhNghiemEvent = DanhSachKinhNghiemEvent(request: DanhSachKinhNghiemRequest(obj: DanhSachKinhNghiemDataRequest()));
  DanhSachNhuCauEvent danhSachNhuCauEvent = DanhSachNhuCauEvent(request: DanhSachNhuCauRequest(obj: DanhSachNhuCauDataRequest()));

  @override
  void callApi() {
    // TODO: implement callApi
    danhSachChucVuBloc.add(danhSachChucVuEvent);
    danhSachTrinhDoBloc
        .add(DanhSachTrinhDoEvent(request: danhSachTrinhDoRequest));
    danhSachMucLuongBloc
        .add(DanhSachMucLuongEvent(request: danhSachMucLuongRequest));
    danhSachKinhNghiemBloc
        .add(DanhSachKinhNghiemEvent(request: danhSachKinhNghiemRequest));
    danhSachNhuCauBloc.add(DanhSachNhuCauEvent(request: danhSachNhuCauRequest));
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    danhSachChucVuBloc.close();
    danhSachMucLuongBloc.close();
    danhSachKinhNghiemBloc.close();
    danhSachGioiTinhBloc.close();
    danhSachTrinhDoBloc.close();
    danhSachNhuCauBloc.close();
  }

  @override
  void getMoreData() {
    // TODO: implement getMoreData
  }

  @override
  void initBloc() {
    // TODO: implement initBloc
    danhSachChucVuBloc = DanhSachChucVuBloc();
    danhSachMucLuongBloc = DanhSachMucLuongBloc();
    danhSachKinhNghiemBloc = DanhSachKinhNghiemBloc();
    danhSachGioiTinhBloc = DanhSachGioiTinhBloc();
    danhSachTrinhDoBloc = DanhSachTrinhDoBloc();
    danhSachNhuCauBloc = DanhSachNhuCauBloc();
  }

  @override
  void initDataLoading() {
    // TODO: implement initDataLoading
  }

  @override
  Widget pageUI(BuildContext context) => Container(
    margin: const EdgeInsets.symmetric(horizontal:  10,vertical: 5),
    child: Row(
      children: [
        Expanded(
          child: Column(
            children: [
              DefaultTextFormField(
                icon: FontAwesomeIcons.tags,
                controller: titleController,
                hintText: "Tiêu đề",
                labelText: "Tiêu đề",
                helperText: "Ví dụ: Cần tìm việc",
                required: true,
                validator: (value){
                  return null;
                },
              ),
              DefaultDateTextFormField(
                controller: fromDateController,
                hintText: "Ngày đăng",
                labelText: "Ngày đăng",
                helperText: "Ví dụ: 01/01/2024",
                required: true,
                validator: (value){
                  return null;
                },
              ),
              DefaultDateTextFormField(
                controller: toDateController,
                hintText: "Ngày hết hạn",
                labelText: "Ngày hết hạn",
                helperText: "Ví dụ: 01/01/2024",
                required: true,
                validator: (value){
                  return null;
                },
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: BlocProvider(
                    create: (_) => danhSachNganhNgheBloc,
                    child: BlocListener<DanhSachNganhNgheBloc,
                        DataMultiState<DanhSachNganhNgheDataResponse>>(
                      listener: (BuildContext context,
                          DataMultiState<DanhSachNganhNgheDataResponse> state) {},
                      child: BlocBuilder<DanhSachNganhNgheBloc,
                          DataMultiState<DanhSachNganhNgheDataResponse>>(
                        builder: (BuildContext context,
                            DataMultiState<DanhSachNganhNgheDataResponse>
                            state) =>
                            _buildViewSearchDanhSachNganhNghe(context, state.data),
                      ),
                    )),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: BlocProvider(
                    create: (_) => danhSachTinhTpBloc,
                    child: BlocListener<DanhSachTinhTpBloc,
                        DataMultiState<DanhSachTinhTpDataResponse>>(
                      listener: (BuildContext context,
                          DataMultiState<DanhSachTinhTpDataResponse> state) {},
                      child: BlocBuilder<DanhSachTinhTpBloc,
                          DataMultiState<DanhSachTinhTpDataResponse>>(
                        builder: (BuildContext context,
                            DataMultiState<DanhSachTinhTpDataResponse>
                            state) =>
                            _buildViewSearchDanhSachTinhTp(context, state.data),
                      ),
                    )),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: BlocProvider(
                    create: (_) => danhSachQuanHuyenBloc,
                    child: BlocListener<DanhSachQuanHuyenBloc,
                        DataMultiState<DanhSachQuanHuyenDataResponse>>(
                      listener: (BuildContext context,
                          DataMultiState<DanhSachQuanHuyenDataResponse> state) {},
                      child: BlocBuilder<DanhSachQuanHuyenBloc,
                          DataMultiState<DanhSachQuanHuyenDataResponse>>(
                        builder: (BuildContext context,
                            DataMultiState<DanhSachQuanHuyenDataResponse>
                            state) =>
                            _buildViewSearchDanhSachQuanHuyen(context, state.data),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}