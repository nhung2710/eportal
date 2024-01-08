//
// Created by BlackRose on 05/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//

import 'package:eportal/bloc/common_new/danh_sach_chuc_vu_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_gioi_tinh_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_kinh_nghiem_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_muc_luong_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_nganh_nghe_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_nhu_cau_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_tinh_chat_cong_viec_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_trinh_do_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_vi_tri_tuyen_dung_bloc.dart';
import 'package:eportal/event/common_new/danh_sach_chuc_vu_event.dart';
import 'package:eportal/event/common_new/danh_sach_gioi_tinh_event.dart';
import 'package:eportal/event/common_new/danh_sach_kinh_nghiem_event.dart';
import 'package:eportal/event/common_new/danh_sach_muc_luong_event.dart';
import 'package:eportal/event/common_new/danh_sach_nhu_cau_event.dart';
import 'package:eportal/event/common_new/danh_sach_tinh_chat_cong_viec_event.dart';
import 'package:eportal/event/common_new/danh_sach_trinh_do_event.dart';
import 'package:eportal/event/common_new/danh_sach_vi_tri_tuyen_dung_event.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_chuc_vu_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_gioi_tinh_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_kinh_nghiem_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_muc_luong_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_nhu_cau_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_tinh_chat_cong_viec_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_trinh_do_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_vi_tri_tuyen_dung_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_chuc_vu_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_gioi_tinh_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_kinh_nghiem_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_muc_luong_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_nhu_cau_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_tinh_chat_cong_viec_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_trinh_do_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_vi_tri_tuyen_dung_data_request.dart';
import 'package:eportal/model/api/response/admin/data/work_search_by_user_name_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_chuc_vu_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_gioi_tinh_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_kinh_nghiem_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_muc_luong_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_nganh_nghe_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_nhu_cau_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_tinh_chat_cong_viec_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_trinh_do_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_vi_tri_tuyen_dung_data_response.dart';
import 'package:eportal/page/base/page_widget/base_page_widget.dart';
import 'package:eportal/page/widget/default_text_form_field.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../event/common_new/danh_sach_nganh_nghe_event.dart';
import '../../../../extension/string_extension.dart';
import '../../../../model/api/request/common_new/danh_sach_nganh_nghe_request.dart';
import '../../../../model/api/request/common_new/data/danh_sach_nganh_nghe_data_request.dart';
import '../../../base/page_state/base_page_keep_state.dart';
import '../../../widget/default_select_item_data_response.dart';

class BusinessJobGeneralTab extends BasePageWidget {
  final WorkSearchByUserNameDataResponse? data;

  const BusinessJobGeneralTab({super.key, this.data});

  @override
  State<StatefulWidget> createState() => BusinessJobGeneralTabState();
}

class BusinessJobGeneralTabState
    extends BasePageKeepState<BusinessJobGeneralTab> {
  TextEditingController titleController = TextEditingController();
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController objectiveController = TextEditingController();
  TextEditingController skillController = TextEditingController();
  TextEditingController thoiGianLVController = TextEditingController();
  TextEditingController soLuongController = TextEditingController();
  TextEditingController doTuoiController = TextEditingController();

  DanhSachGioiTinhEvent danhSachGioiTinhEvent = DanhSachGioiTinhEvent(
      request: DanhSachGioiTinhRequest(obj: DanhSachGioiTinhDataRequest()));
  DanhSachChucVuEvent danhSachChucVuEvent = DanhSachChucVuEvent(
      request: DanhSachChucVuRequest(obj: DanhSachChucVuDataRequest()));
  DanhSachTrinhDoEvent danhSachTrinhDoEvent = DanhSachTrinhDoEvent(
      request: DanhSachTrinhDoRequest(obj: DanhSachTrinhDoDataRequest()));
  DanhSachMucLuongEvent danhSachMucLuongEvent = DanhSachMucLuongEvent(
      request: DanhSachMucLuongRequest(obj: DanhSachMucLuongDataRequest()));
  DanhSachKinhNghiemEvent danhSachKinhNghiemEvent = DanhSachKinhNghiemEvent(
      request: DanhSachKinhNghiemRequest(obj: DanhSachKinhNghiemDataRequest()));
  DanhSachNhuCauEvent danhSachNhuCauEvent = DanhSachNhuCauEvent(
      request: DanhSachNhuCauRequest(obj: DanhSachNhuCauDataRequest()));
  DanhSachViTriTuyenDungEvent danhSachViTriTuyenDungEvent =
      DanhSachViTriTuyenDungEvent(
          request: DanhSachViTriTuyenDungRequest(
              obj: DanhSachViTriTuyenDungDataRequest()));
  DanhSachTinhChatCongViecEvent danhSachTinhChatCongViecEvent =
      DanhSachTinhChatCongViecEvent(
          request: DanhSachTinhChatCongViecRequest(
              obj: DanhSachTinhChatCongViecDataRequest()));
  DanhSachNganhNgheEvent danhSachNganhNgheEvent = DanhSachNganhNgheEvent(
      request: DanhSachNganhNgheRequest(obj: DanhSachNganhNgheDataRequest()));

  late DanhSachMucLuongBloc danhSachMucLuongBloc;
  late DanhSachKinhNghiemBloc danhSachKinhNghiemBloc;
  late DanhSachGioiTinhBloc danhSachGioiTinhBloc;
  late DanhSachTrinhDoBloc danhSachTrinhDoBloc;
  late DanhSachChucVuBloc danhSachChucVuBloc;
  late DanhSachNhuCauBloc danhSachNhuCauBloc;
  late DanhSachViTriTuyenDungBloc danhSachViTriTuyenDungBloc;
  late DanhSachNganhNgheBloc danhSachNganhNgheBloc;
  late DanhSachTinhChatCongViecBloc danhSachTinhChatCongViecBloc;

  DanhSachKinhNghiemDataResponse? danhSachKinhNghiemDataResponse;
  DanhSachMucLuongDataResponse? danhSachMucLuongDataResponse;
  DanhSachChucVuDataResponse? danhSachChucVuDataResponse;
  DanhSachTrinhDoDataResponse? danhSachTrinhDoDataResponse;
  DanhSachNhuCauDataResponse? danhSachNhuCauDataResponse;
  DanhSachTinhChatCongViecDataResponse? danhSachTinhChatCongViecDataResponse;
  DanhSachViTriTuyenDungDataResponse? danhSachViTriTuyenDungDataResponse;
  DanhSachNganhNgheDataResponse? danhSachNganhNgheDataResponse;
  DanhSachGioiTinhDataResponse? danhSachGioiTinhDataResponse;

  @override
  void callApi() {
    // TODO: implement callApi
    danhSachGioiTinhBloc.add(danhSachGioiTinhEvent);
    danhSachChucVuBloc.add(danhSachChucVuEvent);
    danhSachTrinhDoBloc.add(danhSachTrinhDoEvent);
    danhSachMucLuongBloc.add(danhSachMucLuongEvent);
    danhSachKinhNghiemBloc.add(danhSachKinhNghiemEvent);
    danhSachNhuCauBloc.add(danhSachNhuCauEvent);
    danhSachViTriTuyenDungBloc.add(danhSachViTriTuyenDungEvent);
    danhSachTinhChatCongViecBloc.add(danhSachTinhChatCongViecEvent);
    danhSachNganhNgheBloc.add(danhSachNganhNgheEvent);
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
    danhSachViTriTuyenDungBloc.close();
    danhSachNganhNgheBloc.close();
    danhSachTinhChatCongViecBloc.close();
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
    danhSachViTriTuyenDungBloc = DanhSachViTriTuyenDungBloc();
    danhSachNganhNgheBloc = DanhSachNganhNgheBloc();
    danhSachTinhChatCongViecBloc = DanhSachTinhChatCongViecBloc();
    thoiGianLVController.text = "Từ 8h đến 17h hàng ngày";
    soLuongController.text = "1";
    doTuoiController.text = "Từ 18 đến 35";
  }

  @override
  void initDataLoading() {
    // TODO: implement initDataLoading
    callApi();
  }

  @override
  Widget pageUI(BuildContext context) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
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
            DefaultTextFormField(
              icon: FontAwesomeIcons.listOl,
              controller: soLuongController,
              hintText: "Số lượng tuyển",
              labelText: "Số lượng tuyển",
              helperText: "Ví dụ: 1",
              required: true,
              validator: (value) {
                var resultParse = int.tryParse(value!);
                if (resultParse == null || resultParse <= 0) {
                  return 'Số lượng tuyển làm việc sai định dạng hoặc nhỏ hơn 1';
                }
                return null;
              },
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: BlocProvider(
                  create: (_) => danhSachGioiTinhBloc,
                  child: BlocListener<DanhSachGioiTinhBloc,
                      DataMultiState<DanhSachGioiTinhDataResponse>>(
                    listener: (BuildContext context,
                        DataMultiState<DanhSachGioiTinhDataResponse>
                            state) {},
                    child: BlocBuilder<DanhSachGioiTinhBloc,
                        DataMultiState<DanhSachGioiTinhDataResponse>>(
                      builder: (BuildContext context,
                              DataMultiState<DanhSachGioiTinhDataResponse>
                                  state) =>
                          _buildViewSearchDanhSachGioiTinh(
                              context, state.data),
                    ),
                  )),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
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
                              DataMultiState<
                                      DanhSachKinhNghiemDataResponse>
                                  state) =>
                          _buildViewSearchDanhSachKinhNghiem(
                              context, state.data),
                    ),
                  )),
            ),
            DefaultTextFormField(
              icon: FontAwesomeIcons.child,
              controller: doTuoiController,
              hintText: "Độ tuổi tuyển",
              labelText: "Độ tuổi tuyển",
              helperText: "Ví dụ: 1",
              required: true,
              validator: (value) {
                return null;
              },
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: BlocProvider(
                  create: (_) => danhSachChucVuBloc,
                  child: BlocListener<DanhSachChucVuBloc,
                      DataMultiState<DanhSachChucVuDataResponse>>(
                    listener: (BuildContext context,
                        DataMultiState<DanhSachChucVuDataResponse>
                            state) {},
                    child: BlocBuilder<DanhSachChucVuBloc,
                        DataMultiState<DanhSachChucVuDataResponse>>(
                      builder: (BuildContext context,
                              DataMultiState<DanhSachChucVuDataResponse>
                                  state) =>
                          _buildViewSearchDanhSachChucVu(
                              context, state.data),
                    ),
                  )),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: BlocProvider(
                  create: (_) => danhSachTrinhDoBloc,
                  child: BlocListener<DanhSachTrinhDoBloc,
                      DataMultiState<DanhSachTrinhDoDataResponse>>(
                    listener: (BuildContext context,
                        DataMultiState<DanhSachTrinhDoDataResponse>
                            state) {},
                    child: BlocBuilder<DanhSachTrinhDoBloc,
                        DataMultiState<DanhSachTrinhDoDataResponse>>(
                      builder: (BuildContext context,
                              DataMultiState<DanhSachTrinhDoDataResponse>
                                  state) =>
                          _buildViewSearchDanhSachTrinhDo(
                              context, state.data),
                    ),
                  )),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: BlocProvider(
                  create: (_) => danhSachTinhChatCongViecBloc,
                  child: BlocListener<DanhSachTinhChatCongViecBloc,
                      DataMultiState<DanhSachTinhChatCongViecDataResponse>>(
                    listener: (BuildContext context,
                        DataMultiState<DanhSachTinhChatCongViecDataResponse>
                            state) {},
                    child: BlocBuilder<DanhSachTinhChatCongViecBloc,
                        DataMultiState<DanhSachTinhChatCongViecDataResponse>>(
                      builder: (BuildContext context,
                              DataMultiState<DanhSachTinhChatCongViecDataResponse>
                                  state) =>
                          _buildViewSearchDanhSachTinhChatCongViec(
                              context, state.data),
                    ),
                  )),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: BlocProvider(
                  create: (_) => danhSachViTriTuyenDungBloc,
                  child: BlocListener<DanhSachViTriTuyenDungBloc,
                      DataMultiState<DanhSachViTriTuyenDungDataResponse>>(
                    listener: (BuildContext context,
                        DataMultiState<DanhSachViTriTuyenDungDataResponse>
                        state) {},
                    child: BlocBuilder<DanhSachViTriTuyenDungBloc,
                        DataMultiState<DanhSachViTriTuyenDungDataResponse>>(
                      builder: (BuildContext context,
                          DataMultiState<DanhSachViTriTuyenDungDataResponse>
                          state) =>
                          _buildViewSearchDanhSachViTriTuyenDung(
                              context, state.data),
                    ),
                  )),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: BlocProvider(
                  create: (_) => danhSachNganhNgheBloc,
                  child: BlocListener<DanhSachNganhNgheBloc,
                      DataMultiState<DanhSachNganhNgheDataResponse>>(
                    listener: (BuildContext context,
                        DataMultiState<DanhSachNganhNgheDataResponse>
                        state) {},
                    child: BlocBuilder<DanhSachNganhNgheBloc,
                        DataMultiState<DanhSachNganhNgheDataResponse>>(
                      builder: (BuildContext context,
                          DataMultiState<DanhSachNganhNgheDataResponse>
                          state) =>
                          _buildViewSearchDanhSachNganhNghe(
                              context, state.data),
                    ),
                  )),
            ),
            DefaultTextFormField(
              icon: FontAwesomeIcons.child,
              controller: thoiGianLVController,
              hintText: "Thời gian làm việc",
              labelText: "Thời gian làm việc",
              helperText: "Ví dụ: 08h00-17h00",
              required: true,
            ),
          ],
        ),
      );

  Widget _buildViewSearchDanhSachMucLuong(
      BuildContext context, List<DanhSachMucLuongDataResponse> list) {
    if (widget.data != null && danhSachMucLuongDataResponse == null) {
      danhSachMucLuongDataResponse = list
          .where((element) => element.salaryID == widget.data!.careerID)
          .firstOrNull;
    }
    return DefaultSelectItemDataResponse<DanhSachMucLuongDataResponse>(
        icon: FontAwesomeIcons.moneyBill,
        selectedItem: danhSachMucLuongDataResponse,
        list: list,
        itemAsString: (DanhSachMucLuongDataResponse u) =>
            u.salaryName.supportHtml(),
        onChanged: (DanhSachMucLuongDataResponse? data) {
          if (danhSachMucLuongDataResponse != data) {
            danhSachMucLuongDataResponse = data;
          }
        },
        labelText: "Mức lương",
        hintText: "Mức lương",
        title: "Mức lương");
  }

  Widget _buildViewSearchDanhSachGioiTinh(
      BuildContext context, List<DanhSachGioiTinhDataResponse> list) {
    if (widget.data != null && danhSachGioiTinhDataResponse == null) {
      danhSachGioiTinhDataResponse = list
          .where((element) => element.id == widget.data!.careerID)
          .firstOrNull;
    }
    return DefaultSelectItemDataResponse<DanhSachGioiTinhDataResponse>(
        icon: FontAwesomeIcons.venusDouble,
        selectedItem: danhSachGioiTinhDataResponse,
        list: list,
        itemAsString: (DanhSachGioiTinhDataResponse u) => u.name.supportHtml(),
        onChanged: (DanhSachGioiTinhDataResponse? data) {
          if (danhSachGioiTinhDataResponse != data) {
            danhSachGioiTinhDataResponse = data;
          }
        },
        labelText: "Giới tính",
        hintText: "Giới tính",
        title: "Giới tính");
  }

  Widget _buildViewSearchDanhSachKinhNghiem(
      BuildContext context, List<DanhSachKinhNghiemDataResponse> list) {
    if (widget.data != null && danhSachKinhNghiemDataResponse == null) {
      danhSachKinhNghiemDataResponse = list
          .where((element) => element.experienceID == widget.data!.experienceID)
          .firstOrNull;
    }
    return DefaultSelectItemDataResponse<DanhSachKinhNghiemDataResponse>(
        icon: FontAwesomeIcons.graduationCap,
        selectedItem: danhSachKinhNghiemDataResponse,
        list: list,
        itemAsString: (DanhSachKinhNghiemDataResponse u) =>
            u.experienceName.supportHtml(),
        onChanged: (DanhSachKinhNghiemDataResponse? data) {
          if (danhSachKinhNghiemDataResponse != data) {
            danhSachKinhNghiemDataResponse = data;
          }
        },
        labelText: "Kinh nghiệm",
        hintText: "Kinh nghiệm",
        title: "Kinh nghiệm");
  }

  Widget _buildViewSearchDanhSachChucVu(
      BuildContext context, List<DanhSachChucVuDataResponse> list) {
    if (widget.data != null && danhSachChucVuDataResponse == null) {
      danhSachChucVuDataResponse = list
          .where((element) => element.positionID == widget.data!.portalID)
          .firstOrNull;
    }
    return DefaultSelectItemDataResponse<DanhSachChucVuDataResponse>(
        icon: FontAwesomeIcons.userTie,
        selectedItem: danhSachChucVuDataResponse,
        list: list,
        itemAsString: (DanhSachChucVuDataResponse u) =>
            u.positionName.supportHtml(),
        onChanged: (DanhSachChucVuDataResponse? data) {
          if (danhSachChucVuDataResponse != data) {
            danhSachChucVuDataResponse = data;
          }
        },
        labelText: "Chức vụ",
        hintText: "Chức vụ",
        title: "Chức vụ");
  }

  Widget _buildViewSearchDanhSachTrinhDo(
      BuildContext context, List<DanhSachTrinhDoDataResponse> list) {
    if (widget.data != null && danhSachTrinhDoDataResponse == null) {
      /*danhSachTrinhDoDataResponse = list
          .where((element) => element.educationID == widget.data!.e)
          .firstOrNull;*/
    }
    return DefaultSelectItemDataResponse<DanhSachTrinhDoDataResponse>(
        icon: FontAwesomeIcons.graduationCap,
        selectedItem: danhSachTrinhDoDataResponse,
        list: list,
        itemAsString: (DanhSachTrinhDoDataResponse u) =>
            u.educationName.supportHtml(),
        onChanged: (DanhSachTrinhDoDataResponse? data) {
          if (danhSachTrinhDoDataResponse != data) {
            danhSachTrinhDoDataResponse = data;
          }
        },
        labelText: "Trình độ",
        hintText: "Trình độ",
        title: "Trình độ");
  }

  Widget _buildViewSearchDanhSachTinhChatCongViec(
      BuildContext context, List<DanhSachTinhChatCongViecDataResponse> list) {
    if (widget.data != null && DanhSachTinhChatCongViecDataResponse == null) {
      /*danhSachTinhChatCongViecDataResponse = list
          .where((element) => element.salaryID == widget.data!.careerID)
          .firstOrNull;*/
    }
    return DefaultSelectItemDataResponse<DanhSachTinhChatCongViecDataResponse>(
        icon: FontAwesomeIcons.briefcase,
        selectedItem: danhSachTinhChatCongViecDataResponse,
        list: list,
        itemAsString: (DanhSachTinhChatCongViecDataResponse u) =>
            u.typeOfName.supportHtml(),
        onChanged: (DanhSachTinhChatCongViecDataResponse? data) {
          if (danhSachTinhChatCongViecDataResponse != data) {
            danhSachTinhChatCongViecDataResponse = data;
          }
        },
        labelText: "Tính chất công việcg",
        hintText: "Tính chất công việc",
        title: "Tính chất công việc");
  }

  Widget _buildViewSearchDanhSachNganhNghe(
      BuildContext context, List<DanhSachNganhNgheDataResponse> list) {
    if (widget.data != null && danhSachNganhNgheDataResponse == null) {
      danhSachNganhNgheDataResponse = list
          .where((element) => element.careerID == widget.data!.careerID)
          .firstOrNull;
    }
    return DefaultSelectItemDataResponse<DanhSachNganhNgheDataResponse>(
        icon: FontAwesomeIcons.listUl,
        selectedItem: danhSachNganhNgheDataResponse,
        list: list,
        itemAsString: (DanhSachNganhNgheDataResponse u) =>
            u.careerName.supportHtml(),
        onChanged: (DanhSachNganhNgheDataResponse? data) {
          if (danhSachNganhNgheDataResponse != data) {
            danhSachNganhNgheDataResponse = data;
          }
        },
        labelText: "Ngành nghề",
        hintText: "Ngành nghề",
        title: "Ngành nghề");
  }

  Widget _buildViewSearchDanhSachViTriTuyenDung(
      BuildContext context, List<DanhSachViTriTuyenDungDataResponse> list) {
    if (widget.data != null && danhSachViTriTuyenDungDataResponse == null) {
      /*danhSachViTriTuyenDungDataResponse = list
          .where((element) => element.salaryID == widget.data!.p)
          .firstOrNull;*/
    }
    return DefaultSelectItemDataResponse<DanhSachViTriTuyenDungDataResponse>(
        icon: FontAwesomeIcons.locationCrosshairs,
        selectedItem: danhSachViTriTuyenDungDataResponse,
        list: list,
        itemAsString: (DanhSachViTriTuyenDungDataResponse u) =>
            u.jobPlaceName.supportHtml(),
        onChanged: (DanhSachViTriTuyenDungDataResponse? data) {
          if (danhSachViTriTuyenDungDataResponse != data) {
            danhSachViTriTuyenDungDataResponse = data;
          }
        },
        labelText: "Vị trí tuyển dụng",
        hintText: "Vị trí tuyển dụng",
        title: "Vị trí tuyển dụng");
  }
}
