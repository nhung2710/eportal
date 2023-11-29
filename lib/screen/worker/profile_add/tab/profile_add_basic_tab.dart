import 'package:dropdown_search/dropdown_search.dart';
import 'package:eportal/bloc/common_new/danh_sach_doanh_nghiep_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_gioi_tinh_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_kinh_nghiem_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_muc_luong_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_quan_huyen_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_tinh_tp_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_trinh_do_bloc.dart';
import 'package:eportal/event/common_new/danh_sach_doanh_nghiep_event.dart';
import 'package:eportal/event/common_new/danh_sach_kinh_nghiem_event.dart';
import 'package:eportal/event/common_new/danh_sach_muc_luong_event.dart';
import 'package:eportal/event/common_new/danh_sach_quan_huyen_event.dart';
import 'package:eportal/event/common_new/danh_sach_tinh_tp_event.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_doanh_nghiep_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_kinh_nghiem_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_muc_luong_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_quan_huyen_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_tinh_tp_request.dart';
import 'package:eportal/model/api/request/common_new/data/common_new_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_doanh_nghiep_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_quan_huyen_data_request.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_doanh_nghiep_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_kinh_nghiem_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_muc_luong_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_quan_huyen_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_tinh_tp_data_response.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/default_button/default_button.dart';
import 'package:eportal/widget/input/capcha_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../../../extension/dateTime_extension.dart';
import '../../../../extension/string_extension.dart';
import '../../../../widget/base/base_page.dart';
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
  State<StatefulWidget> createState() => _ProfileAddBasicTabState();
}

class _ProfileAddBasicTabState
    extends BaseScreenStateActive<ProfileAddBasicTab> {
  TextEditingController titleController = TextEditingController();
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController objectiveController = TextEditingController();
  TextEditingController skillController = TextEditingController();
  var fromDateFocusNode = FocusNode();
  var toDateFocusNode = FocusNode();
  DateTime fromDate = DateTime.now();
  DateTime toDate = DateTime.now();

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
    fromDateFocusNode.addListener(() {
      if (fromDateFocusNode.hasFocus) {
        fromDateFocusNode.unfocus();
        openFromDateDateTimePicker();
      }
    });
    toDateFocusNode.addListener(() {
      if (toDateFocusNode.hasFocus) {
        toDateFocusNode.unfocus();
        openToDateDateTimePicker();
      }
    });
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
            child: FieldInput(
              controller: fromDateController,
              focusNode: fromDateFocusNode,
              maxLength: 100,
              textInputAction: TextInputAction.next,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Ngày đăng không được để trống';
                }
                return null;
              },
              hintText: 'Ngày đăng',
              icon: FontAwesomeIcons.calendar,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: FieldInput(
              controller: toDateController,
              focusNode: toDateFocusNode,
              maxLength: 100,
              textInputAction: TextInputAction.next,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Ngày hết hạn không được để trống';
                }
                return null;
              },
              hintText: 'Ngày hết hạn',
              icon: FontAwesomeIcons.calendar,
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

  PopupProps<T> _buildPopupProps<T>(BuildContext context) => PopupProps.dialog(
      showSearchBox: true,
      emptyBuilder: (context, searchEntry) => const Center(
          child: Text('Không có dữ liệu',
              style: TextStyle(color: AppColor.colorOfIcon))),
      searchFieldProps: const TextFieldProps(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.all(10),
          hintText: "Tìm kiếm...",
        ),
      ));

  DropDownDecoratorProps _buildDropDownDecoratorProps(
          BuildContext context, String title) =>
      DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
            //labelText: title,
            hintText: "Vui lòng chọn ${title.toLowerCase()}",
            labelStyle: AppTextStyle.title,
            hintStyle: AppTextStyle.titleHintPage),
        baseStyle: AppTextStyle.title,
      );

  ClearButtonProps _buildClearButtonProps() => const ClearButtonProps(
      isVisible: true,
      padding: EdgeInsets.zero,
      color: AppColor.colorOfHintText);

  Future<DateTime?> openDateTimePicker(DateTime initialDate) async {
    return showDatePicker(
        context: context,
        initialDate: initialDate,
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.dark(useMaterial3: false),
            child: child!,
          );
        },
        confirmText: "Chọn ngày",
        cancelText: "Hủy",
        keyboardType: TextInputType.datetime,
        firstDate: DateTime(1900),
        lastDate: DateTime.now());
  }

  Future<void> openFromDateDateTimePicker() async {
    var pickDate = await openDateTimePicker(fromDate);
    if (pickDate != null) {
      fromDate = pickDate;
      fromDateController.text = fromDate.toFormatDateTime(format: 'dd/MM/yyyy');
    }
  }

  Future<void> openToDateDateTimePicker() async {
    var pickDate = await openDateTimePicker(toDate);
    if (pickDate != null) {
      toDate = pickDate;
      toDateController.text = toDate.toFormatDateTime(format: 'dd/MM/yyyy');
    }
  }

  Widget _buildViewSearchDanhSachTinhTp(
      BuildContext context, List<DanhSachTinhTpDataResponse> list) {
    return DropdownSearch<DanhSachTinhTpDataResponse>(
      popupProps: _buildPopupProps(context),
      selectedItem: widget.danhSachTinhTpDataResponse,
      clearButtonProps: _buildClearButtonProps(),
      filterFn: (data, filter) => data.filter(filter),
      asyncItems: (String filter) => Future.value(list),
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
      dropdownDecoratorProps:
          _buildDropDownDecoratorProps(context, "Tình thành phố"),
    );
  }

  Widget _buildViewSearchDanhSachQuanHuyen(
      BuildContext context, List<DanhSachQuanHuyenDataResponse> list) {
    return DropdownSearch<DanhSachQuanHuyenDataResponse>(
      popupProps: _buildPopupProps(context),
      key: _danhSachQuanHuyenKey,
      clearButtonProps: _buildClearButtonProps(),
      filterFn: (data, filter) => data.filter(filter),
      selectedItem: widget.danhSachQuanHuyenDataResponse,
      asyncItems: (String filter) => Future.value(list),
      itemAsString: (DanhSachQuanHuyenDataResponse u) =>
          u.regionalName.supportHtml(),
      onChanged: (DanhSachQuanHuyenDataResponse? data) {
        if (widget.danhSachQuanHuyenDataResponse != data) {
          widget.danhSachQuanHuyenDataResponse = data;
        }
      },
      dropdownDecoratorProps:
          _buildDropDownDecoratorProps(context, "Quận huyện"),
    );
  }

  Widget _buildViewSearchIndustry(BuildContext context, List<String> list) {
    return DropdownSearch<String>(
      popupProps: _buildPopupProps(context),
      clearButtonProps: _buildClearButtonProps(),
      selectedItem: industry,
      asyncItems: (String filter) => Future.value(list),
      onChanged: (String? data) {
        if (widget.danhSachMucLuongDataResponse != data) {
          industry = data;
        }
      },
      dropdownDecoratorProps:
          _buildDropDownDecoratorProps(context, "Ngành nghề"),
    );
  }
}
