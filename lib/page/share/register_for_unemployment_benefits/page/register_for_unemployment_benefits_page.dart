
//
// Created by BlackRose on 08/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//

import 'package:eportal/bloc/common_new/dang_nhap_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_gioi_tinh_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_quan_huyen_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_tinh_tp_bloc.dart';
import 'package:eportal/event/common_new/dang_nhap_event.dart';
import 'package:eportal/event/common_new/danh_sach_gioi_tinh_event.dart';
import 'package:eportal/event/common_new/danh_sach_quan_huyen_event.dart';
import 'package:eportal/event/common_new/danh_sach_tinh_tp_event.dart';
import 'package:eportal/model/api/request/common_new/dang_nhap_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_gioi_tinh_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_quan_huyen_request.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_tinh_tp_request.dart';
import 'package:eportal/model/api/request/common_new/data/dang_nhap_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_gioi_tinh_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_quan_huyen_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_tinh_tp_data_request.dart';
import 'package:eportal/model/api/response/common_new/data/dang_nhap_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_gioi_tinh_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_quan_huyen_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_tinh_tp_data_response.dart';
import 'package:eportal/model/share/default_model_select_item_data_response.dart';
import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/base/page_widget/base_page_widget.dart';
import 'package:eportal/page/share/group_address/widget/group_address_item.dart';
import 'package:eportal/page/widget/default_button.dart';
import 'package:eportal/page/widget/default_capcha_text_form_field.dart';
import 'package:eportal/page/widget/default_date_text_form_field.dart';
import 'package:eportal/page/widget/default_select_item_data_response.dart';
import 'package:eportal/page/widget/default_text_form_field.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../extension/string_extension.dart';

class RegisterForUnemploymentBenefitsPage extends BasePageWidget {

  const RegisterForUnemploymentBenefitsPage({super.key});

  @override
  State<StatefulWidget> createState() => RegisterForUnemploymentBenefitsPageState();
}

class RegisterForUnemploymentBenefitsPageState extends BasePageState<RegisterForUnemploymentBenefitsPage> {

  late DanhSachTinhTpBloc danhSachTinhTpBloc;
  late DanhSachQuanHuyenBloc danhSachQuanHuyenBloc;
  late DangNhapBloc dangNhapBloc;
  late DanhSachGioiTinhBloc danhSachGioiTinhBloc;
  DangNhapEvent dangNhapEvent =
  DangNhapEvent(request: DangNhapRequest(obj: DangNhapDataRequest()));
  DanhSachGioiTinhEvent danhSachGioiTinhEvent = DanhSachGioiTinhEvent(
      request: DanhSachGioiTinhRequest(obj: DanhSachGioiTinhDataRequest()));

  DanhSachTinhTpEvent danhSachTinhTpEvent = DanhSachTinhTpEvent(request: DanhSachTinhTpRequest(obj: DanhSachTinhTpDataRequest()));
  DanhSachQuanHuyenEvent danhSachQuanHuyenEvent = DanhSachQuanHuyenEvent(request: DanhSachQuanHuyenRequest(obj: DanhSachQuanHuyenDataRequest()));

  final List<DefaultModelSelectItemDataResponse<int>> fromLocations = [
    DefaultModelSelectItemDataResponse(item: 1, text: "Trung tâm dịch vụ việc làm Thành phố Hà Nội 1"),
    DefaultModelSelectItemDataResponse(item: 2, text: "Trung tâm dịch vụ việc làm Thành phố Hà Nội 2"),
    DefaultModelSelectItemDataResponse(item: 3, text: "Trung tâm dịch vụ việc làm Thành phố Hà Nội 3"),
    DefaultModelSelectItemDataResponse(item: 4, text: "Trung tâm dịch vụ việc làm Thành phố Hà Nội 4"),
    DefaultModelSelectItemDataResponse(item: 5, text: "Trung tâm dịch vụ việc làm Thành phố Hà Nội 5"),
    DefaultModelSelectItemDataResponse(item: 6, text: "Trung tâm dịch vụ việc làm Thành phố Hà Nội 6"),
    DefaultModelSelectItemDataResponse(item: 7, text: "Trung tâm dịch vụ việc làm Thành phố Hà Nội 7"),
    DefaultModelSelectItemDataResponse(item: 8, text: "Trung tâm dịch vụ việc làm Thành phố Hà Nội 8"),
    DefaultModelSelectItemDataResponse(item: 9, text: "Trung tâm dịch vụ việc làm Thành phố Hà Nội 9"),
    DefaultModelSelectItemDataResponse(item: 10, text: "Trung tâm dịch vụ việc làm Thành phố Hà Nội 10"),
    DefaultModelSelectItemDataResponse(item: 11, text: "Trung tâm dịch vụ việc làm Thành phố Hà Nội 11"),
    DefaultModelSelectItemDataResponse(item: 12, text: "Trung tâm dịch vụ việc làm Thành phố Hà Nội 12"),
    DefaultModelSelectItemDataResponse(item: 13, text: "Trung tâm dịch vụ việc làm Thành phố Hà Nội 13"),
    DefaultModelSelectItemDataResponse(item: 14, text: "Trung tâm dịch vụ việc làm Thành phố Hà Nội 14"),
    DefaultModelSelectItemDataResponse(item: 15, text: "Trung tâm dịch vụ việc làm Thành phố Hà Nội 15"),
    DefaultModelSelectItemDataResponse(item: 16, text: "Trung tâm dịch vụ việc làm Thành phố Hà Nội 16"),
    DefaultModelSelectItemDataResponse(item: 17, text: "Trung tâm dịch vụ việc làm Thành phố Hà Nội 17"),
    DefaultModelSelectItemDataResponse(item: 18, text: "Trung tâm dịch vụ việc làm Thành phố Hà Nội 18")
  ];
  DanhSachGioiTinhDataResponse? danhSachGioiTinhDataResponse;
  DefaultModelSelectItemDataResponse<int>? fromLocation;
  @override
  void initDataLoading() {
    callApi();
  }

  @override
  void callApi() {
    // TODO: implement callApi
    danhSachGioiTinhBloc.add(danhSachGioiTinhEvent);
    danhSachTinhTpBloc.add(danhSachTinhTpEvent);
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    dangNhapBloc.close();
    danhSachGioiTinhBloc.close();
    danhSachTinhTpBloc.close();
    danhSachQuanHuyenBloc.close();
  }

  @override
  void getMoreData() {
    // TODO: implement getMoreData
  }

  @override
  void initBloc() {
    // TODO: implement initBloc
    dangNhapBloc = DangNhapBloc();
    danhSachGioiTinhBloc = DanhSachGioiTinhBloc();
    danhSachTinhTpBloc = DanhSachTinhTpBloc();
    danhSachQuanHuyenBloc = DanhSachQuanHuyenBloc();
  }

  @override
  PreferredSizeWidget? getAppBar(BuildContext context) => defaultTabBar();
  @override
  Widget pageUI(BuildContext context) => BlocProvider(
    create: (_) => dangNhapBloc,
    child:
    BlocListener<DangNhapBloc, DataSingleState<DangNhapDataResponse>>(
      listener: (BuildContext context, state) {
        handlerActionDataSingleState<DangNhapDataResponse>(state,
                (obj) async {
              showCenterMessage("Bạn đã thay đổi mật khẩu thành công")
                  .then((value) => backPage());
            });
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Text(
                "Đăng ký trợ cấp thất nghiệp",
                style: AppTextStyle.titlePage.copyWith(
                    overflow: TextOverflow.visible,
                    fontSize: 18,
                    color: AppColor.colorOfIconActive),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 5),
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                      height: 200,
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Image.asset(
                          'assets/images/app.png',
                          alignment: Alignment.center,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  DefaultSelectItemDataResponse<
                      DefaultModelSelectItemDataResponse<int>>(
                    icon: FontAwesomeIcons.crosshairs,
                    selectedItem: fromLocation,
                    hintText: "Nơi nhận",
                    labelText: "Nơi nhận",
                    helperText: "Ví dụ: ${fromLocation?.text}",
                    list: fromLocations,
                    itemAsString:
                        (DefaultModelSelectItemDataResponse<int> u) =>
                        u.text.supportHtml(),
                    onChanged:
                        (DefaultModelSelectItemDataResponse<int>? data) {
                      if (fromLocation != data) {
                        fromLocation = data;
                      }
                    },
                    title: 'Nơi nhận',
                  ),
                  DefaultTextFormField(
                    icon: FontAwesomeIcons.user,
                    hintText: "Họ và tên",
                    labelText: "Họ và tên",
                    helperText: "Ví dụ: Nguyễn Văn A",
                    required: true,
                  ),
                  DefaultDateTextFormField(
                    hintText: "Ngày tháng năm sinh",
                    labelText: "Ngày tháng năm sinh",
                    helperText: "Ví dụ: 01/01/2024",
                    required: true,
                  ),
                  GroupAddressItem(

                  ),
                  BlocProvider(
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
                  DefaultTextFormField(
                    icon: FontAwesomeIcons.idCard,
                    hintText: "Số CMND/CCCD",
                    labelText: "Số CMND/CCCD",
                    helperText: "Ví dụ: 000000000",
                    required: true,
                  ),
                  DefaultTextFormField(
                    icon: FontAwesomeIcons.user,
                    hintText: "Email",
                    labelText: "Email",
                    helperText: "Ví dụ: abc@gmail.com",
                    required: true,
                  ),
                  DefaultCapchaTextFormField(
                    helperText: "Ví dụ: AAAAAA",
                    onFieldSubmitted: (v) => submitForm(),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: DefaultButton(
                      onPressed: () => submitForm(),
                      text: 'Lấy số',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );

  Widget _buildViewSearchDanhSachGioiTinh(
      BuildContext context, List<DanhSachGioiTinhDataResponse> list) {
    danhSachGioiTinhDataResponse ??= list.firstOrNull;
    return DefaultSelectItemDataResponse<DanhSachGioiTinhDataResponse>(
      icon: FontAwesomeIcons.venusMars,
      selectedItem: danhSachGioiTinhDataResponse,
      hintText: "Giới tính",
      labelText: "Giới tính",
      helperText: "Ví dụ: Nam",
      list: list,
      itemAsString: (DanhSachGioiTinhDataResponse u) => u.name.supportHtml(),
      onChanged: (DanhSachGioiTinhDataResponse? data) {
        if (danhSachGioiTinhDataResponse != data) {
          danhSachGioiTinhDataResponse = data;
        }
      },
      title: 'Giới tính',
    );
  }



  void submitForm() {

  }

}