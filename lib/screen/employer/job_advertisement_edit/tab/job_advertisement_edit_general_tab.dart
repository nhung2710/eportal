import 'package:eportal/bloc/common_new/danh_sach_chuc_vu_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_gioi_tinh_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_kinh_nghiem_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_muc_luong_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_nganh_nghe_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_nhu_cau_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_quan_huyen_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_tinh_tp_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_trinh_do_bloc.dart';
import 'package:eportal/event/common_new/danh_sach_chuc_vu_event.dart';
import 'package:eportal/event/common_new/danh_sach_gioi_tinh_event.dart';
import 'package:eportal/event/common_new/danh_sach_kinh_nghiem_event.dart';
import 'package:eportal/event/common_new/danh_sach_muc_luong_event.dart';
import 'package:eportal/event/common_new/danh_sach_nganh_nghe_event.dart';
import 'package:eportal/event/common_new/danh_sach_nhu_cau_event.dart';
import 'package:eportal/event/common_new/danh_sach_quan_huyen_event.dart';
import 'package:eportal/event/common_new/danh_sach_tinh_chat_cong_viec_event.dart';
import 'package:eportal/event/common_new/danh_sach_tinh_tp_event.dart';
import 'package:eportal/event/common_new/danh_sach_trinh_do_event.dart';
import 'package:eportal/event/common_new/danh_sach_vi_tri_tuyen_dung_event.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_chuc_vu_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_gioi_tinh_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_kinh_nghiem_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_muc_luong_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_nganh_nghe_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_nhu_cau_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_quan_huyen_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_tinh_chat_cong_viec_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_tinh_tp_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_trinh_do_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_vi_tri_tuyen_dung_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_chuc_vu_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_gioi_tinh_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_kinh_nghiem_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_muc_luong_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_nganh_nghe_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_nhu_cau_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_quan_huyen_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_tinh_chat_cong_viec_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_tinh_tp_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_trinh_do_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_vi_tri_tuyen_dung_data_request.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_chuc_vu_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_gioi_tinh_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_kinh_nghiem_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_muc_luong_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_nganh_nghe_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_nhu_cau_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_quan_huyen_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_tinh_chat_cong_viec_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_tinh_tp_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_trinh_do_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_vi_tri_tuyen_dung_data_response.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/input/date_input.dart';
import 'package:eportal/widget/input/field_input.dart';
import 'package:eportal/widget/select/select_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../bloc/common_new/danh_sach_tinh_chat_cong_viec_bloc.dart';
import '../../../../bloc/common_new/danh_sach_vi_tri_tuyen_dung_bloc.dart';
import '../../../../extension/string_extension.dart';

//
// Created by BlackRose on 19/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class JobAdvertisementEditGeneralTab extends BasePage {
  JobAdvertisementEditGeneralTab({super.key});

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
  State<StatefulWidget> createState() => JobAdvertisementEditGeneralTabState();
}

class JobAdvertisementEditGeneralTabState
    extends BaseScreenStateActive<JobAdvertisementEditGeneralTab> {
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

  final _danhSachQuanHuyenKey = GlobalKey<SelectItemNormalState>();

  late DanhSachMucLuongBloc danhSachMucLuongBloc;
  late DanhSachKinhNghiemBloc danhSachKinhNghiemBloc;
  late DanhSachGioiTinhBloc danhSachGioiTinhBloc;
  late DanhSachTrinhDoBloc danhSachTrinhDoBloc;
  late DanhSachChucVuBloc danhSachChucVuBloc;
  late DanhSachNhuCauBloc danhSachNhuCauBloc;
  late DanhSachViTriTuyenDungBloc danhSachViTriTuyenDungBloc;
  late DanhSachNganhNgheBloc danhSachNganhNgheBloc;
  late DanhSachTinhChatCongViecBloc danhSachTinhChatCongViecBloc;

  @override
  void initBloc() {
    danhSachChucVuBloc = DanhSachChucVuBloc();
    danhSachMucLuongBloc = DanhSachMucLuongBloc();
    danhSachKinhNghiemBloc = DanhSachKinhNghiemBloc();
    danhSachGioiTinhBloc = DanhSachGioiTinhBloc();
    danhSachTrinhDoBloc = DanhSachTrinhDoBloc();
    danhSachNhuCauBloc = DanhSachNhuCauBloc();
    danhSachViTriTuyenDungBloc = DanhSachViTriTuyenDungBloc();
    danhSachNganhNgheBloc = DanhSachNganhNgheBloc();
    danhSachTinhChatCongViecBloc = DanhSachTinhChatCongViecBloc();
  }

  @override
  void initDataLoading() {
    thoiGianLVController.text = "Từ 8h đến 17h hàng ngày";
    soLuongController.text = "1";
    doTuoiController.text = "Từ 18 đến 35";
    callApi();
    // TODO: implement initDataLoading
    super.initDataLoading();
  }

  @override
  void callApi() {
    danhSachGioiTinhBloc.add(DanhSachGioiTinhEvent(
        request: DanhSachGioiTinhRequest(obj: DanhSachGioiTinhDataRequest())));
    danhSachChucVuBloc.add(DanhSachChucVuEvent(
        request: DanhSachChucVuRequest(obj: DanhSachChucVuDataRequest())));
    danhSachTrinhDoBloc.add(DanhSachTrinhDoEvent(
        request: DanhSachTrinhDoRequest(obj: DanhSachTrinhDoDataRequest())));
    danhSachMucLuongBloc.add(DanhSachMucLuongEvent(
        request: DanhSachMucLuongRequest(obj: DanhSachMucLuongDataRequest())));
    danhSachKinhNghiemBloc.add(DanhSachKinhNghiemEvent(
        request:
            DanhSachKinhNghiemRequest(obj: DanhSachKinhNghiemDataRequest())));
    danhSachNhuCauBloc.add(DanhSachNhuCauEvent(
        request: DanhSachNhuCauRequest(obj: DanhSachNhuCauDataRequest())));
    danhSachViTriTuyenDungBloc.add(DanhSachViTriTuyenDungEvent(
        request: DanhSachViTriTuyenDungRequest(
            obj: DanhSachViTriTuyenDungDataRequest())));
    danhSachTinhChatCongViecBloc.add(DanhSachTinhChatCongViecEvent(
        request: DanhSachTinhChatCongViecRequest(
            obj: DanhSachTinhChatCongViecDataRequest())));
    danhSachNganhNgheBloc.add(DanhSachNganhNgheEvent(
        request:
            DanhSachNganhNgheRequest(obj: DanhSachNganhNgheDataRequest())));

    super.callApi();
  }

  @override
  Color currentBackgroundColor(BuildContext context) => Colors.white;

  @override
  Widget pageUI(BuildContext context) => ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: BlocProvider(
                create: (_) => danhSachMucLuongBloc,
                child: BlocListener<DanhSachMucLuongBloc,
                    DataMultiState<DanhSachMucLuongDataResponse>>(
                  listener: (BuildContext context,
                      DataMultiState<DanhSachMucLuongDataResponse> state) {},
                  child: BlocBuilder<DanhSachMucLuongBloc,
                      DataMultiState<DanhSachMucLuongDataResponse>>(
                    builder: (BuildContext context,
                        DataMultiState<DanhSachMucLuongDataResponse>
                        state) =>
                        _buildViewSearchDanhSachMucLuong(context, state.data),
                  ),
                )),
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
            child: BlocProvider(
              create: (_) => danhSachGioiTinhBloc,
              child: BlocListener<DanhSachGioiTinhBloc,
                  DataMultiState<DanhSachGioiTinhDataResponse>>(
                listener: (BuildContext context,
                    DataMultiState<DanhSachGioiTinhDataResponse> state) {},
                child: BlocBuilder<DanhSachGioiTinhBloc,
                    DataMultiState<DanhSachGioiTinhDataResponse>>(
                    builder: (BuildContext context,
                        DataMultiState<DanhSachGioiTinhDataResponse>
                        state) =>
                        _buildViewSearchDanhSachGioiTinh(
                            context, state.data)),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: BlocProvider(
              create: (_) => danhSachKinhNghiemBloc,
              child: BlocListener<DanhSachKinhNghiemBloc,
                  DataMultiState<DanhSachKinhNghiemDataResponse>>(
                listener: (BuildContext context,
                    DataMultiState<DanhSachKinhNghiemDataResponse> state) {},
                child: BlocBuilder<DanhSachKinhNghiemBloc,
                    DataMultiState<DanhSachKinhNghiemDataResponse>>(
                    builder: (BuildContext context,
                        DataMultiState<DanhSachKinhNghiemDataResponse>
                        state) =>
                        _buildViewSearchDanhSachKinhNghiem(
                            context, state.data)),
              ),
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
                return null;
              },
              hintText: 'Độ tuổi',
              icon: FontAwesomeIcons.child,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: BlocProvider(
                create: (_) => danhSachChucVuBloc,
                child: BlocListener<DanhSachChucVuBloc,
                    DataMultiState<DanhSachChucVuDataResponse>>(
                  listener: (BuildContext context,
                      DataMultiState<DanhSachChucVuDataResponse> state) {},
                  child: BlocBuilder<DanhSachChucVuBloc,
                      DataMultiState<DanhSachChucVuDataResponse>>(
                    builder: (BuildContext context,
                            DataMultiState<DanhSachChucVuDataResponse> state) =>
                        _buildViewSearchDanhSachChucVu(context, state.data),
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
                      DataMultiState<DanhSachTrinhDoDataResponse> state) {},
                  child: BlocBuilder<DanhSachTrinhDoBloc,
                      DataMultiState<DanhSachTrinhDoDataResponse>>(
                    builder: (BuildContext context,
                            DataMultiState<DanhSachTrinhDoDataResponse>
                                state) =>
                        _buildViewSearchDanhSachTrinhDo(context, state.data),
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
        ],
      );

  Widget _buildViewSearchDanhSachChucVu(
      BuildContext context, List<DanhSachChucVuDataResponse> list) {
    return SelectItemNormal<DanhSachChucVuDataResponse>(
      icon: FontAwesomeIcons.userTie,
      selectedItem: widget.danhSachChucVuDataResponse,
      list: list,
      itemAsString: (DanhSachChucVuDataResponse u) =>
          u.positionName.supportHtml(),
      onChanged: (DanhSachChucVuDataResponse? data) {
        if (widget.danhSachChucVuDataResponse != data) {
          widget.danhSachChucVuDataResponse = data;
        }
      },
      title: "Chức vụ",
    );
  }

  Widget _buildViewSearchDanhSachKinhNghiem(
      BuildContext context, List<DanhSachKinhNghiemDataResponse> list) {
    return SelectItem<DanhSachKinhNghiemDataResponse>(
      icon: FontAwesomeIcons.timeline,
      selectedItem: widget.danhSachKinhNghiemDataResponse,
      list: list,
      itemAsString: (DanhSachKinhNghiemDataResponse u) =>
          u.experienceName.supportHtml(),
      onChanged: (DanhSachKinhNghiemDataResponse? data) {
        if (widget.danhSachKinhNghiemDataResponse != data) {
          widget.danhSachKinhNghiemDataResponse = data;
        }
      },
      title: "Kinh nghiệm",
    );
  }

  Widget _buildViewSearchDanhSachMucLuong(
      BuildContext context, List<DanhSachMucLuongDataResponse> list) {
    return SelectItem<DanhSachMucLuongDataResponse>(
      icon: FontAwesomeIcons.moneyBill,
      selectedItem: widget.danhSachMucLuongDataResponse,
      list: list,
      itemAsString: (DanhSachMucLuongDataResponse u) =>
          u.salaryName.supportHtml(),
      onChanged: (DanhSachMucLuongDataResponse? data) {
        if (widget.danhSachMucLuongDataResponse != data) {
          widget.danhSachMucLuongDataResponse = data;
        }
      },
      title: "Mức lương",
    );
  }

  Widget _buildViewSearchDanhSachTrinhDo(
      BuildContext context, List<DanhSachTrinhDoDataResponse> list) {
    return SelectItem<DanhSachTrinhDoDataResponse>(
      icon: FontAwesomeIcons.graduationCap,
      selectedItem: widget.danhSachTrinhDoDataResponse,
      list: list,
      itemAsString: (DanhSachTrinhDoDataResponse u) =>
          u.educationName.supportHtml(),
      onChanged: (DanhSachTrinhDoDataResponse? data) {
        if (widget.danhSachMucLuongDataResponse != data) {
          widget.danhSachTrinhDoDataResponse = data;
        }
      },
      title: "Trình độ",
    );
  }

  Widget _buildViewSearchDanhSachTinhChatCongViec(
      BuildContext context, List<DanhSachTinhChatCongViecDataResponse> list) {
    return SelectItem<DanhSachTinhChatCongViecDataResponse>(
      icon: FontAwesomeIcons.briefcase,
      selectedItem: widget.danhSachTinhChatCongViecDataResponse,
      list: list,
      itemAsString: (DanhSachTinhChatCongViecDataResponse u) =>
          u.typeOfName.supportHtml(),
      onChanged: (DanhSachTinhChatCongViecDataResponse? data) {
        if (widget.danhSachTinhChatCongViecDataResponse != data) {
          widget.danhSachTinhChatCongViecDataResponse = data;
        }
      },
      title: "Tính chất công việc",
    );
  }

  Widget _buildViewSearchDanhSachNganhNghe(
      BuildContext context, List<DanhSachNganhNgheDataResponse> list) {
    return SelectItem<DanhSachNganhNgheDataResponse>(
      icon: FontAwesomeIcons.listUl,
      selectedItem: widget.danhSachNganhNgheDataResponse,
      list: list,
      itemAsString: (DanhSachNganhNgheDataResponse u) =>
          u.careerName.supportHtml(),
      onChanged: (DanhSachNganhNgheDataResponse? data) {
        if (widget.danhSachNganhNgheDataResponse != data) {
          widget.danhSachNganhNgheDataResponse = data;
        }
      },
      title: "Ngành nghề",
    );
  }

  Widget _buildViewSearchDanhSachViTriTuyenDung(
      BuildContext context, List<DanhSachViTriTuyenDungDataResponse> list) {
    return SelectItem<DanhSachViTriTuyenDungDataResponse>(
      icon: FontAwesomeIcons.locationCrosshairs,
      selectedItem: widget.danhSachViTriTuyenDungDataResponse,
      list: list,
      itemAsString: (DanhSachViTriTuyenDungDataResponse u) =>
          u.jobPlaceName.supportHtml(),
      onChanged: (DanhSachViTriTuyenDungDataResponse? data) {
        if (widget.danhSachViTriTuyenDungDataResponse != data) {
          widget.danhSachViTriTuyenDungDataResponse = data;
        }
      },
      title: "Vị trí tuyển dụng",
    );
  }

  Widget _buildViewSearchDanhSachGioiTinh(
      BuildContext context, List<DanhSachGioiTinhDataResponse> list) {
    return SelectItem<DanhSachGioiTinhDataResponse>(
      icon: FontAwesomeIcons.timeline,
      selectedItem: widget.danhSachGioiTinhDataResponse,
      list: list,
      itemAsString: (DanhSachGioiTinhDataResponse u) =>
          u.name.supportHtml(),
      onChanged: (DanhSachGioiTinhDataResponse? data) {
        if (widget.danhSachGioiTinhDataResponse != data) {
          widget.danhSachGioiTinhDataResponse = data;
        }
      },
      title: "Giới tính",
    );
  }

}
