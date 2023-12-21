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
import 'package:eportal/widget/checkbox/custom_checkbox.dart';
import 'package:eportal/widget/input/date_input.dart';
import 'package:eportal/widget/input/field_input.dart';
import 'package:eportal/widget/select/select_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../extension/string_extension.dart';

class JobAdvertisementEditBasicTab extends BasePage {
  JobAdvertisementEditBasicTab({super.key});
  bool? tinNoiBat = false;
  bool? dauThongTinDN= false;
  bool? dangGap= false;
  DanhSachTinhTpDataResponse? danhSachTinhTpDataResponse;

  @override
  State<StatefulWidget> createState() => JobAdvertisementEditBasicTabState();
}

class JobAdvertisementEditBasicTabState
    extends BaseScreenStateActive<JobAdvertisementEditBasicTab> {
  TextEditingController tieuDeController = TextEditingController();
  TextEditingController hanNopHoSoController = TextEditingController();
  TextEditingController hinhThucNopController = TextEditingController();
  TextEditingController dangTuNgayController = TextEditingController();
  TextEditingController dangDenNgayController = TextEditingController();

  late DanhSachTinhTpBloc danhSachTinhTpBloc;

  @override
  void initBloc() {
    danhSachTinhTpBloc = DanhSachTinhTpBloc();
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    danhSachTinhTpBloc.close();
  }

  @override
  void getMoreData() {
    // TODO: implement getMoreData
  }
  @override
  void initDataLoading() {
  }

  @override
  void callApi() {

    danhSachTinhTpBloc.add(DanhSachTinhTpEvent(
        request: DanhSachTinhTpRequest(obj: DanhSachTinhTpDataRequest())));
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
            child: CustomCheckbox(
              title: "Tin nổi bật",
              onChanged: (value) => widget.tinNoiBat = value,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: CustomCheckbox(
              title: "Đầu thông tin doanh nghiệp",
              onChanged: (value) => widget.dauThongTinDN = value,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: CustomCheckbox(
              title: "Đăng gấp",
              onChanged: (value) => widget.dangGap = value,
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

        ],
      );
  Widget _buildViewSearchDanhSachTinhTp(
      BuildContext context, List<DanhSachTinhTpDataResponse> list) {
    return SelectItem<DanhSachTinhTpDataResponse>(
      icon: FontAwesomeIcons.locationDot,
      selectedItem: widget.danhSachTinhTpDataResponse,
      list: list,
      itemAsString: (DanhSachTinhTpDataResponse u) =>
          u.regionalName.supportHtml(),
      onChanged: (DanhSachTinhTpDataResponse? data) {
        if (widget.danhSachTinhTpDataResponse != data) {
          widget.danhSachTinhTpDataResponse = data;
        }
      },
      title: "Tình thành phố",
    );
  }

}
