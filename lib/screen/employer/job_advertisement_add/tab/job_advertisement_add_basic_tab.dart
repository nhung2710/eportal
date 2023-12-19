//
// Created by BlackRose on 19/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:eportal/bloc/common_new/danh_sach_nganh_nghe_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_quan_huyen_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_tinh_tp_bloc.dart';
import 'package:eportal/event/common_new/danh_sach_nganh_nghe_event.dart';
import 'package:eportal/event/common_new/danh_sach_quan_huyen_event.dart';
import 'package:eportal/event/common_new/danh_sach_tinh_tp_event.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_nganh_nghe_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_quan_huyen_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_tinh_tp_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_nganh_nghe_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_quan_huyen_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_tinh_tp_data_request.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_nganh_nghe_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_quan_huyen_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_tinh_tp_data_response.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/input/date_input.dart';
import 'package:eportal/widget/input/field_input.dart';
import 'package:eportal/widget/select/select_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../extension/string_extension.dart';

class JobAdvertisementAddBasicTab extends BasePage {
  JobAdvertisementAddBasicTab({super.key});

  DanhSachTinhTpDataResponse? danhSachTinhTpDataResponse;
  DanhSachQuanHuyenDataResponse? danhSachQuanHuyenDataResponse;
  DanhSachNganhNgheDataResponse? danhSachNganhNgheDataResponse;

  @override
  State<StatefulWidget> createState() => JobAdvertisementAddBasicTabState();
}

class JobAdvertisementAddBasicTabState
    extends BaseScreenStateActive<JobAdvertisementAddBasicTab> {
  TextEditingController tieuDeController = TextEditingController();
  TextEditingController soLuongController = TextEditingController();
  TextEditingController doTuoiController = TextEditingController();
  TextEditingController thoiGianLVController = TextEditingController();
  TextEditingController hanNopHoSoController = TextEditingController();
  TextEditingController hinhThucNopController = TextEditingController();
  TextEditingController dangTuNgayController = TextEditingController();
  TextEditingController dangDenNgayController = TextEditingController();

  @override
  void initBloc() {}

  @override
  void initDataLoading() {
    callApi();
    // TODO: implement initDataLoading
    super.initDataLoading();
  }

  @override
  void callApi() {
    super.callApi();
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
              controller: tieuDeController,
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
            child: FieldInput(
              controller: doTuoiController,
              maxLength: 100,
              textInputAction: TextInputAction.next,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Độ tuổi làm việc không được để trống';
                }
                var resultParse = int.tryParse(text);
                if (resultParse == null || resultParse <= 0) {
                  return 'Độ tuổi làm việc sai định dạng hoặc nhỏ hơn 1';
                }
                return null;
              },
              hintText: 'Độ tuổi',
              icon: FontAwesomeIcons.child,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: FieldInput(
              controller: soLuongController,
              maxLength: 100,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Số lượng tuyển làm việc không được để trống';
                }
                var resultParse = int.tryParse(text);
                if (resultParse == null || resultParse <= 0) {
                  return 'Số lượng tuyển làm việc sai định dạng hoặc nhỏ hơn 1';
                }
                return null;
              },
              hintText: 'Số lượng tuyển',
              icon: FontAwesomeIcons.listOl,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: FieldInput(
              controller: thoiGianLVController,
              maxLength: 100,
              textInputAction: TextInputAction.next,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Thời gian làm việc không được để trống';
                }
                return null;
              },
              hintText: 'Thời gian làm việc',
              icon: FontAwesomeIcons.clock,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: DateInput(
              controller: hanNopHoSoController,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Hạn nộp không được để trống';
                }
                return null;
              },
              hintText: 'Hạn nộp',
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: DateInput(
              controller: dangTuNgayController,
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
              controller: dangDenNgayController,
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
        ],
      );
}
