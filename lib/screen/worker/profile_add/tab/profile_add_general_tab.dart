import 'package:eportal/bloc/common_new/danh_sach_gioi_tinh_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_kinh_nghiem_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_muc_luong_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_quan_huyen_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_tinh_tp_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_trinh_do_bloc.dart';
import 'package:eportal/event/common_new/danh_sach_kinh_nghiem_event.dart';
import 'package:eportal/event/common_new/danh_sach_muc_luong_event.dart';
import 'package:eportal/event/common_new/danh_sach_tinh_tp_event.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_kinh_nghiem_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_muc_luong_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_tinh_tp_request.dart';
import 'package:eportal/model/api/request/common_new/data/common_new_data_request.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_kinh_nghiem_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_muc_luong_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_quan_huyen_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_tinh_tp_data_response.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/widget/select/select_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../extension/dateTime_extension.dart';
import '../../../../extension/string_extension.dart';
import '../../../../widget/base/base_page.dart';

//
// Created by BlackRose on 29/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class ProfileAddGeneralTab extends BasePage {
  ProfileAddGeneralTab({super.key});

  DanhSachTinhTpDataResponse? danhSachTinhTpDataResponse;
  DanhSachQuanHuyenDataResponse? danhSachQuanHuyenDataResponse;
  DanhSachKinhNghiemDataResponse? danhSachKinhNghiemDataResponse;
  DanhSachMucLuongDataResponse? danhSachMucLuongDataResponse;

  @override
  State<StatefulWidget> createState() => ProfileAddGeneralTabState();
}

class ProfileAddGeneralTabState
    extends BaseScreenStateActive<ProfileAddGeneralTab> {
  TextEditingController titleController = TextEditingController();
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController objectiveController = TextEditingController();
  TextEditingController skillController = TextEditingController();

  final _danhSachQuanHuyenKey = GlobalKey<SelectItemState>();

  late DanhSachTinhTpBloc danhSachTinhTpBloc;
  late DanhSachQuanHuyenBloc danhSachQuanHuyenBloc;
  late DanhSachMucLuongBloc danhSachMucLuongBloc;
  late DanhSachKinhNghiemBloc danhSachKinhNghiemBloc;
  late DanhSachGioiTinhBloc danhSachGioiTinhBloc;
  late DanhSachTrinhDoBloc danhSachTrinhDoBloc;
  String? industry;
  String? positionCurrent;
  String? positionFuture;
  String? education;
  String? need;
  List<String> industrys = [
    "Bán hàng",
    "Bán hàng kỹ thuật",
    "Bán lẻ/Bán sỉ",
    "Bảo hiểm",
    "Bất động sản",
    "Biên phiên dịch",
    "Chứng khoán",
    "Cơ khí",
    "Công nghệ cao",
    "Dầu khí",
    "Dệt may/Da giày",
    "Dịch vụ khách hàng",
    "Dược phẩm/Công nghệ sinh học",
    "Giáo dục/Đào tạo",
    "Hàng cao cấp",
    "Hàng không/Du lịch/Khách sạn",
    "Hành chính/Thư ký",
    "Hóa học/Hóa sinh",
    "Hoạch định/Dự án",
    "Internet/Media online",
    "IT- Phần mềm",
    "IT- Phần cứng/Mạng",
    "Kế toán",
    "Kho vận",
    "Kiểm toán",
    "Kiến trúc/Thiết kế nội thất",
    "Marketing",
    "Môi trường/Xử lý chất thải",
    "Mỹ thuật/Thiết kế",
    "Ngân hàng",
    "Nhân sự",
    "Nông nghiệp/Lâm nghiệp",
    "Ô tô",
    "Oversea job",
    "Pháp lý",
    "Phi chính phủ/Phi lợi nhuận",
    "QC/QA",
    "Quảng cáo/Khuyến mại",
    "Sản phẩm công nghiệp",
    "Sản xuất",
    "Tài chính/Đầu tư",
    "Thời trang",
    "Thời vụ/Hợp đồng ngắn hạn",
    "Thực phẩm &amp; Đồ uống",
    "Truyền hình/Truyền thông/Báo trí",
    "Tư vấn",
    "Vận chuyển/Giao nhận",
    "Vật tư/Cung vận",
    "Viễn thông",
    "Xây dựng",
    "Xuất nhập khẩu",
    "Y tế/Chăm sóc sức khỏe",
    "Điện/Điện tử",
    "Khác"
  ];
  List<String> needs = [
    "Chưa có nhu cầu tìm việc",
    "Đang có việc làm",
    "Muốn tìm việc mới",
    "Đang tìm việc và sẵn sàng cho công việc mới",
  ];
  List<String> positions = [
    "Chuyên viên",
    "Trưởng phòng",
    "Trưởng nhóm",
    "Công nhân",
    "Nhân viên",
    "Hiệu trưởng",
    "Phó hiệu trưởng",
    "Trưởng khoa",
    "Phó trưởng khoa",
    "Giáo viên",
  ];
  List<String> educations = [
    "Tiến sĩ",
    "Thạc sĩ",
    "Đại học",
    "Cao đẳng",
    "Trung cấp",
    "Sơ cấp",
    "Phổ thông",
  ];

  @override
  void initDataLoading() {
    danhSachTinhTpBloc = DanhSachTinhTpBloc();
    danhSachQuanHuyenBloc = DanhSachQuanHuyenBloc();
    danhSachMucLuongBloc = DanhSachMucLuongBloc();
    danhSachKinhNghiemBloc = DanhSachKinhNghiemBloc();
    danhSachGioiTinhBloc = DanhSachGioiTinhBloc();
    danhSachTrinhDoBloc = DanhSachTrinhDoBloc();
    callApi();
    // TODO: implement initDataLoading
    super.initDataLoading();
  }

  @override
  void callApi() {
    danhSachTinhTpBloc.add(DanhSachTinhTpEvent(
        request: DanhSachTinhTpRequest(obj: CommonNewDataRequest())));

    danhSachMucLuongBloc.add(DanhSachMucLuongEvent(
        request: DanhSachMucLuongRequest(obj: CommonNewDataRequest())));
    danhSachKinhNghiemBloc.add(DanhSachKinhNghiemEvent(
        request: DanhSachKinhNghiemRequest(obj: CommonNewDataRequest())));
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
                        _buildViewSearchPositionFuture(context, positions),
                  ),
                )),
          ),
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
                        _buildViewSearchPositionCurrent(context, positions),
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
                        _buildViewSearchEducation(context, educations),
                  ),
                )),
          ),
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
        ],
      );

  Widget _buildViewSearchDanhSachKinhNghiem(
      BuildContext context, List<DanhSachKinhNghiemDataResponse> list) {
    return SelectItem<DanhSachKinhNghiemDataResponse>(
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

  Widget _buildViewSearchPositionFuture(
      BuildContext context, List<String> list) {
    return SelectItemNormal<String>(
      selectedItem: positionFuture,
      list: list,
      onChanged: (String? data) {
        if (widget.danhSachMucLuongDataResponse != data) {
          industry = data;
        }
      },
      title: 'Chức vụ mong muốn',
    );
  }

  Widget _buildViewSearchPositionCurrent(
      BuildContext context, List<String> list) {
    return SelectItemNormal<String>(
      selectedItem: positionCurrent,
      list: list,
      onChanged: (String? data) {
        if (widget.danhSachMucLuongDataResponse != data) {
          industry = data;
        }
      },
      title: "Chức vụ hiện tại",
    );
  }

  Widget _buildViewSearchEducation(BuildContext context, List<String> list) {
    return SelectItemNormal<String>(
      selectedItem: education,
      list: list,
      onChanged: (String? data) {
        if (widget.danhSachMucLuongDataResponse != data) {
          industry = data;
        }
      },
      title: "Trình độ",
    );
  }
}
