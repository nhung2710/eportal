//
// Created by BlackRose on 05/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//

import 'package:eportal/bloc/common_new/danh_sach_nganh_nghe_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_quan_huyen_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_tinh_tp_bloc.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_tinh_tp_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_tinh_tp_data_request.dart';
import 'package:eportal/model/api/response/admin/data/job_user_list_by_user_name_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_nganh_nghe_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_quan_huyen_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_tinh_tp_data_response.dart';
import 'package:eportal/page/base/page_widget/base_page_widget.dart';
import 'package:eportal/page/widget/default_text_form_field.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../event/common_new/danh_sach_nganh_nghe_event.dart';
import '../../../../event/common_new/danh_sach_quan_huyen_event.dart';
import '../../../../event/common_new/danh_sach_tinh_tp_event.dart';
import '../../../../extension/string_extension.dart';
import '../../../../model/api/request/common_new/danh_sach_nganh_nghe_request.dart';
import '../../../../model/api/request/common_new/danh_sach_quan_huyen_request.dart';
import '../../../../model/api/request/common_new/data/danh_sach_nganh_nghe_data_request.dart';
import '../../../../model/api/request/common_new/data/danh_sach_quan_huyen_data_request.dart';
import '../../../base/page_state/base_page_keep_state.dart';
import '../../../widget/default_date_text_form_field.dart';
import '../../../widget/default_select_item_data_response.dart';

class UserProfileBasicTab extends BasePageWidget {
  final JobUserListByUserNameDataResponse? data;

  const UserProfileBasicTab({super.key, this.data});

  @override
  State<StatefulWidget> createState() => UserProfileBasicTabState();
}

class UserProfileBasicTabState extends BasePageKeepState<UserProfileBasicTab> {
  TextEditingController titleController = TextEditingController();
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  DanhSachTinhTpEvent danhSachTinhTpEvent = DanhSachTinhTpEvent(
      request: DanhSachTinhTpRequest(obj: DanhSachTinhTpDataRequest()));
  DanhSachQuanHuyenEvent danhSachQuanHuyenEvent = DanhSachQuanHuyenEvent(
      request: DanhSachQuanHuyenRequest(obj: DanhSachQuanHuyenDataRequest()));
  DanhSachNganhNgheEvent danhSachNganhNgheEvent = DanhSachNganhNgheEvent(
      request: DanhSachNganhNgheRequest(obj: DanhSachNganhNgheDataRequest()));

  late DanhSachNganhNgheBloc danhSachNganhNgheBloc;
  late DanhSachTinhTpBloc danhSachTinhTpBloc;
  late DanhSachQuanHuyenBloc danhSachQuanHuyenBloc;

  DanhSachTinhTpDataResponse? danhSachTinhTpDataResponse;
  DanhSachQuanHuyenDataResponse? danhSachQuanHuyenDataResponse;
  DanhSachNganhNgheDataResponse? danhSachNganhNgheDataResponse;
  GlobalKey<DefaultSelectItemDataResponseState> keyQuanHuyen =
      GlobalKey<DefaultSelectItemDataResponseState>();

  @override
  void callApi() {
    // TODO: implement callApi
    danhSachTinhTpBloc.add(danhSachTinhTpEvent);
    danhSachNganhNgheBloc.add(danhSachNganhNgheEvent);
    if (widget.data != null) {
      danhSachQuanHuyenEvent.request.obj.tinhTp = widget.data!.tinhTP;
      danhSachQuanHuyenBloc.add(danhSachQuanHuyenEvent);
    }
  }

  void callApiQuanHuyen() {
    danhSachQuanHuyenBloc.add(danhSachQuanHuyenEvent);
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    danhSachTinhTpBloc.close();
    danhSachQuanHuyenBloc.close();
    danhSachNganhNgheBloc.close();
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
    danhSachNganhNgheBloc = DanhSachNganhNgheBloc();
    if (widget.data != null) {
      titleController.text = widget.data!.title.replaceWhenNullOrWhiteSpace();
      fromDateController.text = widget.data!.startDate.formatDateTimeApi();
      toDateController.text = widget.data!.endDate.formatDateTimeApi();
    }
  }

  @override
  void initDataLoading() {
    // TODO: implement initDataLoading
    callApi();
  }

  @override
  Widget pageUI(BuildContext context) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                    validator: (value) {
                      return null;
                    },
                  ),
                  DefaultDateTextFormField(
                    controller: fromDateController,
                    hintText: "Ngày đăng",
                    labelText: "Ngày đăng",
                    helperText: "Ví dụ: 01/01/2024",
                    required: true,
                    validator: (value) {
                      return null;
                    },
                  ),
                  DefaultDateTextFormField(
                    controller: toDateController,
                    hintText: "Ngày hết hạn",
                    labelText: "Ngày hết hạn",
                    helperText: "Ví dụ: 01/01/2024",
                    required: true,
                    validator: (value) {
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
                              DataMultiState<DanhSachNganhNgheDataResponse>
                                  state) {},
                          child: BlocBuilder<DanhSachNganhNgheBloc,
                              DataMultiState<DanhSachNganhNgheDataResponse>>(
                            builder: (BuildContext context,
                                    DataMultiState<
                                            DanhSachNganhNgheDataResponse>
                                        state) =>
                                _buildViewSearchDanhSachNganhNghe(
                                    context, state.data),
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
                    margin: const EdgeInsets.only(top: 10),
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
                                    DataMultiState<
                                            DanhSachQuanHuyenDataResponse>
                                        state) =>
                                _buildViewSearchDanhSachQuanHuyen(
                                    context, state.data),
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget _buildViewSearchDanhSachNganhNghe(
      BuildContext context, List<DanhSachNganhNgheDataResponse> list) {
    if (widget.data != null && danhSachNganhNgheDataResponse == null) {
      danhSachNganhNgheDataResponse = list
          .where((element) => element.careerID == widget.data!.careerID)
          .firstOrNull;
    }
    return DefaultSelectItemDataResponse<DanhSachNganhNgheDataResponse>(
        icon: FontAwesomeIcons.tag,
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

  Widget _buildViewSearchDanhSachTinhTp(
      BuildContext context, List<DanhSachTinhTpDataResponse> list) {
    if (widget.data != null && danhSachTinhTpDataResponse == null) {
      danhSachTinhTpDataResponse = list
          .where((element) => element.regionalID == widget.data!.tinhTP)
          .firstOrNull;
    }
    return DefaultSelectItemDataResponse<DanhSachTinhTpDataResponse>(
        icon: FontAwesomeIcons.city,
        selectedItem: danhSachTinhTpDataResponse,
        list: list,
        itemAsString: (DanhSachTinhTpDataResponse u) =>
            u.regionalName.supportHtml(),
        onChanged: (DanhSachTinhTpDataResponse? data) {
          if (danhSachTinhTpDataResponse != data) {
            danhSachTinhTpDataResponse = data;
            keyQuanHuyen.currentState?.clear();
            danhSachQuanHuyenEvent.request.obj.tinhTp = data?.regionalID;
            callApiQuanHuyen();
          }
        },
        labelText: "Tỉnh/Thành phố",
        hintText: "Tỉnh/Thành phố",
        title: "Tỉnh/Thành phố");
  }

  Widget _buildViewSearchDanhSachQuanHuyen(
      BuildContext context, List<DanhSachQuanHuyenDataResponse> list) {
    if (widget.data != null && danhSachQuanHuyenDataResponse == null) {
      danhSachQuanHuyenDataResponse = list
          .where((element) => element.regionalID == widget.data!.quanHuyen)
          .firstOrNull;
    }
    return DefaultSelectItemDataResponse<DanhSachQuanHuyenDataResponse>(
        key: keyQuanHuyen,
        icon: FontAwesomeIcons.locationArrow,
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
}
