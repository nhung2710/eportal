import 'package:dropdown_search/dropdown_search.dart';
import 'package:eportal/bloc/common_new/danh_sach_gioi_tinh_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_kinh_nghiem_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_muc_luong_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_quan_huyen_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_tinh_tp_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_trinh_do_bloc.dart';
import 'package:eportal/event/common_new/danh_sach_kinh_nghiem_event.dart';
import 'package:eportal/event/common_new/danh_sach_muc_luong_event.dart';
import 'package:eportal/event/common_new/danh_sach_quan_huyen_event.dart';
import 'package:eportal/event/common_new/danh_sach_tinh_tp_event.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_kinh_nghiem_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_muc_luong_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_quan_huyen_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_tinh_tp_request.dart';
import 'package:eportal/model/api/request/common_new/data/common_new_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_quan_huyen_data_request.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_kinh_nghiem_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_muc_luong_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_quan_huyen_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_tinh_tp_data_response.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/widget/select/select_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../extension/dateTime_extension.dart';
import '../../../../extension/string_extension.dart';
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
  DanhSachKinhNghiemDataResponse? danhSachKinhNghiemDataResponse;
  DanhSachMucLuongDataResponse? danhSachMucLuongDataResponse;

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

  final _danhSachQuanHuyenKey = GlobalKey<DropdownSearchState>();

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
                        _buildViewSearchIndustry(context, industrys),
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
                        _buildViewSearchDanhSachTinhTp(
                            context, state.data ?? []),
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
                        _buildViewSearchDanhSachQuanHuyen(
                            context, state.data ?? []),
                  ),
                )),
          ),
        ],
      );

  Widget _buildViewSearchDanhSachTinhTp(
      BuildContext context, List<DanhSachTinhTpDataResponse> list) {
    return SelectItem<DanhSachTinhTpDataResponse>(
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

  Widget _buildViewSearchIndustry(BuildContext context, List<String> list) {
    return SelectItemNormal<String>(
      selectedItem: industry,
      onChanged: (String? data) {
        if (widget.danhSachMucLuongDataResponse != data) {
          industry = data;
        }
      },
      list: list,
      title: 'Ngành nghề',
    );
  }
}
