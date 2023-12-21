import 'package:eportal/bloc/common_new/danh_sach_quan_huyen_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_tinh_tp_bloc.dart';
import 'package:eportal/event/common_new/danh_sach_quan_huyen_event.dart';
import 'package:eportal/event/common_new/danh_sach_tinh_tp_event.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_quan_huyen_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_tinh_tp_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_quan_huyen_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_tinh_tp_data_request.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_quan_huyen_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_tinh_tp_data_response.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/widget/select/select_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../bloc/common_new/danh_sach_nganh_nghe_bloc.dart';
import '../../../../event/common_new/danh_sach_nganh_nghe_event.dart';
import '../../../../extension/string_extension.dart';
import '../../../../model/api/request/common_new/danh_sach_nganh_nghe_request.dart';
import '../../../../model/api/request/common_new/data/danh_sach_nganh_nghe_data_request.dart';
import '../../../../model/api/response/common_new/data/danh_sach_nganh_nghe_data_response.dart';
import '../../../../widget/base/base_page.dart';
import '../../../../widget/input/date_input.dart';
import '../../../../widget/input/field_input.dart';

//
// Created by BlackRose on 29/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class ProfileAddBasicTab extends BasePage {
  ProfileAddBasicTab({super.key});

  DanhSachTinhTpDataResponse? danhSachTinhTpDataResponse;
  DanhSachQuanHuyenDataResponse? danhSachQuanHuyenDataResponse;
  DanhSachNganhNgheDataResponse? danhSachNganhNgheDataResponse;

  @override
  State<StatefulWidget> createState() => ProfileAddBasicTabState();
}

class ProfileAddBasicTabState
    extends BaseScreenStateActive<ProfileAddBasicTab> {
  TextEditingController titleController = TextEditingController();
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController objectiveController = TextEditingController();
  TextEditingController skillController = TextEditingController();
  DanhSachTinhTpRequest danhSachTinhTpRequest = DanhSachTinhTpRequest(obj: DanhSachTinhTpDataRequest());
  DanhSachQuanHuyenRequest danhSachQuanHuyenRequest = DanhSachQuanHuyenRequest(obj: DanhSachQuanHuyenDataRequest());
  DanhSachNganhNgheRequest danhSachNganhNgheRequest = DanhSachNganhNgheRequest(obj: DanhSachNganhNgheDataRequest());
  final _danhSachQuanHuyenKey = GlobalKey<SelectItemNormalState>();
  late DanhSachNganhNgheBloc danhSachNganhNgheBloc;
  late DanhSachTinhTpBloc danhSachTinhTpBloc;
  late DanhSachQuanHuyenBloc danhSachQuanHuyenBloc;

  @override
  void initBloc() {
    danhSachTinhTpBloc = DanhSachTinhTpBloc();
    danhSachQuanHuyenBloc = DanhSachQuanHuyenBloc();
    danhSachNganhNgheBloc = DanhSachNganhNgheBloc();
  }

  @override
  void initDataLoading() {
    callApi();
    // TODO: implement initDataLoading
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
  void callApi() {
    danhSachTinhTpBloc.add(DanhSachTinhTpEvent(
        request: danhSachTinhTpRequest));
    if (widget.danhSachTinhTpDataResponse != null) {
      danhSachQuanHuyenRequest.obj.tinhTp = widget.danhSachTinhTpDataResponse?.regionalID;
      danhSachQuanHuyenBloc.add(DanhSachQuanHuyenEvent(
          request: danhSachQuanHuyenRequest));
    }
    danhSachNganhNgheBloc.add(DanhSachNganhNgheEvent(
        request:danhSachNganhNgheRequest));
  }

  @override
  String getPageTitle(BuildContext context) => "Tạo hồ sơ";

  @override
  Color currentBackgroundColor(BuildContext context) => Colors.white;

  @override
  Widget pageUI(BuildContext context) => ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: FieldInput(
              controller: titleController,
              maxLength: 100,
              textInputAction: TextInputAction.next,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Tiêu đề không được để trống';
                }
                return null;
              },
              hintText: 'Tiêu đề',
              icon: FontAwesomeIcons.tags,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: DateInput(
              controller: fromDateController,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Ngày đăng không được để trống';
                }
                return null;
              },
              hintText: 'Ngày đăng',
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: DateInput(
              controller: toDateController,
              textInputAction: TextInputAction.next,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Ngày hết hạn không được để trống';
                }
                return null;
              },
              hintText: 'Ngày hết hạn',
            ),
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
                            DataMultiState<DanhSachTinhTpDataResponse> state) =>
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
      );

  Widget _buildViewSearchDanhSachTinhTp(
      BuildContext context, List<DanhSachTinhTpDataResponse> list) {
    return SelectItem<DanhSachTinhTpDataResponse>(
      icon: FontAwesomeIcons.city,
      selectedItem: widget.danhSachTinhTpDataResponse,
      list: list,
      itemAsString: (DanhSachTinhTpDataResponse u) =>
          u.regionalName.replaceWhenNullOrWhiteSpace(),
      onChanged: (DanhSachTinhTpDataResponse? data) {
        if (widget.danhSachTinhTpDataResponse != data) {
          widget.danhSachTinhTpDataResponse = data;
          widget.danhSachQuanHuyenDataResponse = null;
          _danhSachQuanHuyenKey.currentState?.clear();
          danhSachQuanHuyenBloc.add(DanhSachQuanHuyenEvent(
              request: DanhSachQuanHuyenRequest(
                  obj:
                      DanhSachQuanHuyenDataRequest(tinhTp: data?.regionalID))));
        }
      },
      title: 'Tình thành phố',
    );
  }

  Widget _buildViewSearchDanhSachQuanHuyen(
      BuildContext context, List<DanhSachQuanHuyenDataResponse> list) {
    return SelectItem<DanhSachQuanHuyenDataResponse>(
      icon: FontAwesomeIcons.locationArrow,
      key: _danhSachQuanHuyenKey,
      selectedItem: widget.danhSachQuanHuyenDataResponse,
      list: list,
      itemAsString: (DanhSachQuanHuyenDataResponse u) =>
          u.regionalName.supportHtml(),
      onChanged: (DanhSachQuanHuyenDataResponse? data) {
        if (widget.danhSachQuanHuyenDataResponse != data) {
          widget.danhSachQuanHuyenDataResponse = data;
        }
      },
      title: 'Quận huyện',
    );
  }

  Widget _buildViewSearchDanhSachNganhNghe(
      BuildContext context, List<DanhSachNganhNgheDataResponse> list) {
    return SelectItem<DanhSachNganhNgheDataResponse>(
      icon: FontAwesomeIcons.tag,
      selectedItem: widget.danhSachNganhNgheDataResponse,
      list: list,
      itemAsString: (DanhSachNganhNgheDataResponse u) =>
          u.careerName.supportHtml(),
      onChanged: (DanhSachNganhNgheDataResponse? data) {
        if (widget.danhSachNganhNgheDataResponse != data) {
          widget.danhSachNganhNgheDataResponse = data;
        }
      },
      title: 'Ngành nghề',
    );
  }

}
