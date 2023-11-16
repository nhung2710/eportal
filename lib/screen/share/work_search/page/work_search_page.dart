import 'dart:math';
import 'dart:convert' show utf8;
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../../../bloc/common_new/danh_sach_doanh_nghiep_bloc.dart';
import '../../../../bloc/common_new/danh_sach_gioi_tinh_bloc.dart';
import '../../../../bloc/common_new/danh_sach_kinh_nghiem_bloc.dart';
import '../../../../bloc/common_new/danh_sach_muc_luong_bloc.dart';
import '../../../../bloc/common_new/danh_sach_quan_huyen_bloc.dart';
import '../../../../bloc/common_new/danh_sach_tinh_tp_bloc.dart';
import '../../../../bloc/common_new/danh_sach_trinh_do_bloc.dart';
import '../../../../bloc/common_new/ten_tinh_tp_bloc.dart';
import '../../../../bloc/common_new/work_search_bloc.dart';
import '../../../../event/common_new/danh_sach_doanh_nghiep_event.dart';
import '../../../../event/common_new/danh_sach_kinh_nghiem_event.dart';
import '../../../../event/common_new/danh_sach_muc_luong_event.dart';
import '../../../../event/common_new/danh_sach_quan_huyen_event.dart';
import '../../../../event/common_new/danh_sach_tinh_tp_event.dart';
import '../../../../event/common_new/danh_sach_trinh_do_event.dart';
import '../../../../event/common_new/work_search_event.dart';
import '../../../../extension/string_extension.dart';
import '../../../../model/api/request/common_new/danh_sach_doanh_nghiep_request.dart';
import '../../../../model/api/request/common_new/danh_sach_kinh_nghiem_request.dart';
import '../../../../model/api/request/common_new/danh_sach_muc_luong_request.dart';
import '../../../../model/api/request/common_new/danh_sach_quan_huyen_request.dart';
import '../../../../model/api/request/common_new/danh_sach_tinh_tp_request.dart';
import '../../../../model/api/request/common_new/danh_sach_trinh_do_request.dart';
import '../../../../model/api/request/common_new/data/common_new_data_request.dart';
import '../../../../model/api/request/common_new/data/danh_sach_doanh_nghiep_data_request.dart';
import '../../../../model/api/request/common_new/data/danh_sach_quan_huyen_data_request.dart';
import '../../../../model/api/request/common_new/data/work_search_data_request.dart';
import '../../../../model/api/request/common_new/work_search_request.dart';
import '../../../../model/api/response/common_new/danh_sach_doanh_nghiep_response.dart';
import '../../../../model/api/response/common_new/danh_sach_kinh_nghiem_response.dart';
import '../../../../model/api/response/common_new/danh_sach_muc_luong_response.dart';
import '../../../../model/api/response/common_new/danh_sach_quan_huyen_response.dart';
import '../../../../model/api/response/common_new/danh_sach_tinh_tp_response.dart';
import '../../../../model/api/response/common_new/data/danh_sach_doanh_nghiep_data_response.dart';
import '../../../../model/api/response/common_new/data/danh_sach_kinh_nghiem_data_response.dart';
import '../../../../model/api/response/common_new/data/danh_sach_muc_luong_data_response.dart';
import '../../../../model/api/response/common_new/data/danh_sach_quan_huyen_data_response.dart';
import '../../../../model/api/response/common_new/data/danh_sach_tinh_tp_data_response.dart';
import '../../../../model/api/response/common_new/work_search_response.dart';
import '../../../../model/share/chat_bot/chat_bot_message.dart';
import '../../../../state/base/base_state.dart';
import '../../../../style/app_text_style.dart';
import '../../../../widget/base/base_page.dart';
import '../../../../widget/drawer/filter_drawer.dart';
import '../../../../widget/expandable_fab/expandable_fab.dart';
import '../../empty_example/page/empty_example_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//
// Created by BlackRose on 13/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class WorkSearchPage extends BasePage {
  const WorkSearchPage({super.key});

  @override
  State<StatefulWidget> createState() => _WorkSearchPageState();
}

class _WorkSearchPageState extends BasePageState<WorkSearchPage> {
  WorkSearchBloc workSearchBloc = WorkSearchBloc();
  WorkSearchRequest request = WorkSearchRequest(obj: WorkSearchDataRequest());

  DanhSachTinhTpBloc danhSachTinhTpBloc = DanhSachTinhTpBloc();
  DanhSachQuanHuyenBloc danhSachQuanHuyenBloc = DanhSachQuanHuyenBloc();
  DanhSachDoanhNghiepBloc danhSachDoanhNghiepBloc = DanhSachDoanhNghiepBloc();
  DanhSachMucLuongBloc danhSachMucLuongBloc = DanhSachMucLuongBloc();
  DanhSachKinhNghiemBloc danhSachKinhNghiemBloc = DanhSachKinhNghiemBloc();
  DanhSachGioiTinhBloc danhSachGioiTinhBloc = DanhSachGioiTinhBloc();
  DanhSachTrinhDoBloc danhSachTrinhDoBloc = DanhSachTrinhDoBloc();
  DanhSachTinhTpDataResponse? danhSachTinhTpDataResponse;
  DanhSachQuanHuyenDataResponse? danhSachQuanHuyenDataResponse;
  DanhSachDoanhNghiepDataResponse? danhSachDoanhNghiepDataResponse;
  DanhSachKinhNghiemDataResponse? danhSachKinhNghiemDataResponse;
  DanhSachMucLuongDataResponse? danhSachMucLuongDataResponse;

  TextEditingController textEditingController = TextEditingController();

  @override
  void initDataLoading() {
    workSearchBloc.add(WorkSearchEvent(request: request));

    danhSachTinhTpBloc.add(DanhSachTinhTpEvent(
        request: DanhSachTinhTpRequest(obj: CommonNewDataRequest())));
    danhSachMucLuongBloc.add(DanhSachMucLuongEvent(
        request: DanhSachMucLuongRequest(obj: CommonNewDataRequest())));
    danhSachKinhNghiemBloc.add(DanhSachKinhNghiemEvent(
        request: DanhSachKinhNghiemRequest(obj: CommonNewDataRequest())));
    super.initDataLoading();
  }

  @override
  Widget? getEndDrawer(BuildContext context) => Container(
        color: Colors.white,
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(children: [
          Expanded(
              child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Text("Tiêu chí tìm kiếm thêm"),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: BlocProvider(
                    create: (_) => danhSachTinhTpBloc,
                    child: BlocListener<DanhSachTinhTpBloc, BaseState>(
                      listener: (BuildContext context, BaseState state) {},
                      child: BlocBuilder<DanhSachTinhTpBloc, BaseState>(
                        builder: (BuildContext context, BaseState state) =>
                            handlerBaseState<DanhSachTinhTpResponse>(
                                state,
                                (context, state) =>
                                    _buildViewSearchDanhSachTinhTp(
                                        context, state.data ?? []),
                                initWidget: _buildViewSearchDanhSachTinhTp(
                                    context, [])),
                      ),
                    )),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: BlocProvider(
                    create: (_) => danhSachQuanHuyenBloc,
                    child: BlocListener<DanhSachQuanHuyenBloc, BaseState>(
                      listener: (BuildContext context, BaseState state) {},
                      child: BlocBuilder<DanhSachQuanHuyenBloc, BaseState>(
                        builder: (BuildContext context, BaseState state) =>
                            handlerBaseState<DanhSachQuanHuyenResponse>(
                                state,
                                (context, state) =>
                                    _buildViewSearchDanhSachQuanHuyen(
                                        context, state.data ?? []),
                                initWidget: _buildViewSearchDanhSachQuanHuyen(
                                    context, [])),
                      ),
                    )),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: BlocProvider(
                    create: (_) => danhSachDoanhNghiepBloc,
                    child: BlocListener<DanhSachDoanhNghiepBloc, BaseState>(
                      listener: (BuildContext context, BaseState state) {},
                      child: BlocBuilder<DanhSachDoanhNghiepBloc, BaseState>(
                        builder: (BuildContext context, BaseState state) =>
                            handlerBaseState<DanhSachDoanhNghiepResponse>(
                                state,
                                (context, state) =>
                                    _buildViewSearchDanhSachDoanhNghiep(
                                        context, state.data ?? []),
                                initWidget: _buildViewSearchDanhSachDoanhNghiep(
                                    context, [])),
                      ),
                    )),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: BlocProvider(
                    create: (_) => danhSachMucLuongBloc,
                    child: BlocListener<DanhSachMucLuongBloc, BaseState>(
                      listener: (BuildContext context, BaseState state) {},
                      child: BlocBuilder<DanhSachMucLuongBloc, BaseState>(
                        builder: (BuildContext context, BaseState state) =>
                            handlerBaseState<DanhSachMucLuongResponse>(
                                state,
                                (context, state) =>
                                    _buildViewSearchDanhSachMucLuong(
                                        context, state.data ?? []),
                                initWidget: _buildViewSearchDanhSachMucLuong(
                                    context, [])),
                      ),
                    )),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: BlocProvider(
                    create: (_) => danhSachKinhNghiemBloc,
                    child: BlocListener<DanhSachKinhNghiemBloc, BaseState>(
                      listener: (BuildContext context, BaseState state) {},
                      child: BlocBuilder<DanhSachKinhNghiemBloc, BaseState>(
                        builder: (BuildContext context, BaseState state) =>
                            handlerBaseState<DanhSachKinhNghiemResponse>(
                                state,
                                (context, state) =>
                                    _buildViewSearchDanhSachKinhNghiem(
                                        context, state.data ?? []),
                                initWidget: _buildViewSearchDanhSachKinhNghiem(
                                    context, [])),
                      ),
                    )),
              ),
            ],
          )),
        ]),
      );

  @override
  Widget pageUI(BuildContext context) => Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 5, top: 5),
            color: Colors.white,
            child: TextFormField(
              controller: textEditingController,
              maxLength: 50,
              textInputAction: TextInputAction.send,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Vui lòng nhập nội dung muốn gửi';
                }
                return null;
              },
              onFieldSubmitted: (value) => _findNews(context),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.send,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    _findNews(context);
                  },
                ),
                labelText: 'Nội dung',
                counterText: "",
              ),
            ),
          ),
          Expanded(
            child: BlocProvider(
                create: (_) => workSearchBloc,
                child: BlocListener<WorkSearchBloc, BaseState>(
                  listener: (BuildContext context, BaseState state) {},
                  child: BlocBuilder<WorkSearchBloc, BaseState>(
                    builder: (BuildContext context, BaseState state) =>
                        handlerBaseState<WorkSearchResponse>(
                      state,
                      (context, state) => Column(
                        children: [
                          Container(
                            child: Text(state.toString()),
                          ),
                          Expanded(
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: state.data?.length ?? 0,
                                itemBuilder: (context, i) => GestureDetector(
                                      onTap: () => nextPage(
                                          (context) => EmptyExamplePage(
                                                isHasAppBar: true,
                                              )),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.white,
                                        ),
                                        padding: const EdgeInsets.all(10),
                                        margin: const EdgeInsets.only(top: 5),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Text(
                                                "1",
                                                style: AppTextStyle.title
                                                    .copyWith(
                                                        color: Colors.blue,
                                                        overflow: TextOverflow
                                                            .visible,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
          ),
        ],
      );

  @override
  getBottomNavigationBar(BuildContext context) => null;

  @override
  String getPageTitle(BuildContext context) => "Tìm kiếm";

  void _findNews(BuildContext context) {
    if (isValid()) {
      request.obj.tuKhoa = textEditingController.text;
      workSearchBloc.add(WorkSearchEvent(request: request));
    }
  }

  Widget _buildViewSearchDanhSachTinhTp(
      BuildContext context, List<DanhSachTinhTpDataResponse> list) {
    return DropdownSearch<DanhSachTinhTpDataResponse>(
      popupProps: _buildPopupProps(context),
      selectedItem: danhSachTinhTpDataResponse,
      clearButtonProps: _buildClearButtonProps(),
      filterFn: (data, filter) => data.filter(filter),
      asyncItems: (String filter) => Future.value(list),
      itemAsString: (DanhSachTinhTpDataResponse u) =>
          u.regionalName.replaceWhenNullOrWhiteSpace(),
      onChanged: (DanhSachTinhTpDataResponse? data) {
        if (danhSachTinhTpDataResponse != data) {
          danhSachTinhTpDataResponse = data;
          request.obj.tinhTp = data?.regionalID;
          request.obj.quanHuyen = null;
          request.obj.doanhNghiep = null;
          danhSachQuanHuyenDataResponse = null;
          danhSachDoanhNghiepDataResponse = null;
          danhSachQuanHuyenBloc.add(DanhSachQuanHuyenEvent(
              request: DanhSachQuanHuyenRequest(
                  obj: DanhSachQuanHuyenDataRequest(
                      tinhTp: request.obj.tinhTp))));

          danhSachDoanhNghiepBloc.add(DanhSachDoanhNghiepEvent(
              request: DanhSachDoanhNghiepRequest(
                  obj: DanhSachDoanhNghiepDataRequest(
                      tinhTp: request.obj.tinhTp,
                      quanHuyen: request.obj.quanHuyen))));
        }
      },
      dropdownDecoratorProps:
          _buildDropDownDecoratorProps(context, "Tình thành phố"),
    );
  }

  Widget _buildViewSearchDanhSachQuanHuyen(
      BuildContext context, List<DanhSachQuanHuyenDataResponse> list) {
    return DropdownSearch<DanhSachQuanHuyenDataResponse>(
      popupProps: _buildPopupProps(context),
      clearButtonProps: _buildClearButtonProps(),
      filterFn: (data, filter) => data.filter(filter),
      asyncItems: (String filter) => Future.value(list),
      itemAsString: (DanhSachQuanHuyenDataResponse u) =>
          u.regionalName.replaceWhenNullOrWhiteSpace(),
      onChanged: (DanhSachQuanHuyenDataResponse? data) {
        if (danhSachQuanHuyenDataResponse != data) {
          danhSachQuanHuyenDataResponse = data;
          request.obj.quanHuyen = data?.regionalID;
          request.obj.doanhNghiep = null;
          danhSachDoanhNghiepDataResponse = null;
          danhSachDoanhNghiepBloc.add(DanhSachDoanhNghiepEvent(
              request: DanhSachDoanhNghiepRequest(
                  obj: DanhSachDoanhNghiepDataRequest(
                      tinhTp: request.obj.tinhTp,
                      quanHuyen: request.obj.quanHuyen))));
        }
      },
      dropdownDecoratorProps:
          _buildDropDownDecoratorProps(context, "Quận huyện"),
    );
  }

  Widget _buildViewSearchDanhSachDoanhNghiep(
      BuildContext context, List<DanhSachDoanhNghiepDataResponse> list) {
    return DropdownSearch<DanhSachDoanhNghiepDataResponse>(
      popupProps: _buildPopupProps(context),
      clearButtonProps: _buildClearButtonProps(),
      filterFn: (data, filter) => data.filter(filter),
      selectedItem: danhSachDoanhNghiepDataResponse,
      asyncItems: (String filter) => Future.value(list),
      itemAsString: (DanhSachDoanhNghiepDataResponse u) =>
          u.businessVn.replaceWhenNullOrWhiteSpace(),
      onChanged: (DanhSachDoanhNghiepDataResponse? data) {
        if (danhSachDoanhNghiepDataResponse != data) {
          danhSachDoanhNghiepDataResponse = data;
          request.obj.doanhNghiep = data?.doanhNghiepID;
        }
      },
      dropdownDecoratorProps: _buildDropDownDecoratorProps(context, "Công ty"),
    );
  }

  Widget _buildViewSearchDanhSachKinhNghiem(
      BuildContext context, List<DanhSachKinhNghiemDataResponse> list) {
    return DropdownSearch<DanhSachKinhNghiemDataResponse>(
      popupProps: _buildPopupProps(context),
      clearButtonProps: _buildClearButtonProps(),
      filterFn: (data, filter) => data.filter(filter),
      selectedItem: danhSachKinhNghiemDataResponse,
      asyncItems: (String filter) => Future.value(list),
      itemAsString: (DanhSachKinhNghiemDataResponse u) =>
          u.experienceName.replaceWhenNullOrWhiteSpace(),
      onChanged: (DanhSachKinhNghiemDataResponse? data) {
        if (danhSachKinhNghiemDataResponse != data) {
          danhSachKinhNghiemDataResponse = data;
          request.obj.kinhNghiem = data?.experienceID;
        }
      },
      dropdownDecoratorProps:
          _buildDropDownDecoratorProps(context, "Kinh nghiệm"),
    );
  }

  Widget _buildViewSearchDanhSachMucLuong(
      BuildContext context, List<DanhSachMucLuongDataResponse> list) {
    return DropdownSearch<DanhSachMucLuongDataResponse>(
      popupProps: _buildPopupProps(context),
      clearButtonProps: _buildClearButtonProps(),
      filterFn: (data, filter) => data.filter(filter),
      selectedItem: danhSachMucLuongDataResponse,
      asyncItems: (String filter) => Future.value(list),
      itemAsString: (DanhSachMucLuongDataResponse u) =>
          u.salaryName.replaceWhenNullOrWhiteSpace(),
      onChanged: (DanhSachMucLuongDataResponse? data) {
        if (danhSachMucLuongDataResponse != data) {
          danhSachMucLuongDataResponse = data;
        }
      },
      dropdownDecoratorProps:
          _buildDropDownDecoratorProps(context, "Mức lương"),
    );
  }

  PopupProps<T> _buildPopupProps<T>(BuildContext context) => PopupProps.dialog(
      showSearchBox: true,
      emptyBuilder: (context, searchEntry) => const Center(
          child:
              Text('Không có dữ liệu', style: TextStyle(color: Colors.blue))),
      searchFieldProps: const TextFieldProps(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
          hintText: "Tìm kiếm...",
        ),
      ));

  DropDownDecoratorProps _buildDropDownDecoratorProps(
          BuildContext context, String title) =>
      DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
            labelText: title, hintText: "Vui lòng chọn ${title.toLowerCase()}"),
      );

  ClearButtonProps _buildClearButtonProps() => const ClearButtonProps(
      isVisible: true, padding: EdgeInsets.zero, color: Colors.black);
}
