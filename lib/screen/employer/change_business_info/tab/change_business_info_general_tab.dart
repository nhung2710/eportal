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
import 'package:eportal/style/taxcode_formatter.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/input/field_input.dart';
import 'package:eportal/widget/select/select_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../extension/string_extension.dart';

//
// Created by BlackRose on 04/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class ChangeBusinessInfoGeneralTab extends BasePage {
  ChangeBusinessInfoGeneralTab({super.key});

  DanhSachTinhTpDataResponse? danhSachTinhTpDataResponse;
  DanhSachQuanHuyenDataResponse? danhSachQuanHuyenDataResponse;

  @override
  State<StatefulWidget> createState() => ChangeBusinessInfoGeneralTabState();
}

class ChangeBusinessInfoGeneralTabState
    extends BaseScreenStateActive<ChangeBusinessInfoGeneralTab> {
  TextEditingController taxCodeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController faxController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController educationController = TextEditingController();

  final _danhSachQuanHuyenKey = GlobalKey<SelectItemNormalState>();
  late DanhSachTinhTpBloc danhSachTinhTpBloc;
  late DanhSachQuanHuyenBloc danhSachQuanHuyenBloc;

  @override
  void initBloc() {
    danhSachTinhTpBloc = DanhSachTinhTpBloc();
    danhSachQuanHuyenBloc = DanhSachQuanHuyenBloc();
  }

  @override
  void disposeBloc() {
    danhSachTinhTpBloc.close();
    danhSachQuanHuyenBloc.close();
  }

  @override
  void getMoreData() {
    // TODO: implement getMoreData
  }

  @override
  void initDataLoading() {
    callApi();
  }

  @override
  void callApi() {
    danhSachTinhTpBloc.add(DanhSachTinhTpEvent(
        request: DanhSachTinhTpRequest(obj: DanhSachTinhTpDataRequest())));
    if (widget.danhSachTinhTpDataResponse != null) {
      danhSachQuanHuyenBloc.add(DanhSachQuanHuyenEvent(
          request: DanhSachQuanHuyenRequest(
              obj: DanhSachQuanHuyenDataRequest(
                  tinhTp: widget.danhSachTinhTpDataResponse!.regionalID))));
    }
  }

  @override
  Widget pageUI(BuildContext context) => ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: FieldInput(
              controller: taxCodeController,
              maxLength: 14,
              textInputAction: TextInputAction.next,
              inputFormatters: [
                TaxCodeFormatter(),
              ],
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Mã số thuế không được để trống';
                }
                return null;
              },
              hintText: 'Mã số thuế',
              icon: FontAwesomeIcons.solidCreditCard,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: FieldInput(
              controller: nameController,
              maxLength: 100,
              textInputAction: TextInputAction.next,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Tên doanh nghiệp không được để trống';
                }
                return null;
              },
              hintText: 'Tên doanh nghiệp',
              icon: FontAwesomeIcons.buildingUser,
            ),
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
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: FieldInput(
              controller: addressController,
              maxLength: 200,
              textInputAction: TextInputAction.next,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Địa chỉ liên hệ không được để trống';
                }
                return null;
              },
              hintText: 'Địa chỉ liên hệ',
              icon: FontAwesomeIcons.locationDot,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: FieldInput(
              controller: nameController,
              maxLength: 100,
              textInputAction: TextInputAction.next,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Điện thoại không được để trống';
                }
                return null;
              },
              hintText: 'Điện thoại',
              icon: FontAwesomeIcons.phone,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: FieldInput(
              controller: nameController,
              maxLength: 100,
              textInputAction: TextInputAction.next,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Số Fax không được để trống';
                }
                return null;
              },
              hintText: 'Số Fax',
              icon: FontAwesomeIcons.fax,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: FieldInput(
              controller: nameController,
              maxLength: 100,
              textInputAction: TextInputAction.next,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Website không được để trống';
                }
                return null;
              },
              hintText: 'Website',
              icon: FontAwesomeIcons.internetExplorer,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: FieldInput(
              controller: nameController,
              maxLength: 100,
              textInputAction: TextInputAction.next,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Email không được để trống';
                }
                return null;
              },
              hintText: 'Email',
              icon: FontAwesomeIcons.envelopesBulk,
            ),
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
}
