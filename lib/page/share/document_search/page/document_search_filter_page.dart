//
// Created by BlackRose on 02/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//

import 'package:eportal/bloc/common_new/danh_sach_chuyen_muc_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_co_quan_ban_hanh_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_linh_vuc_van_ban_bloc.dart';
import 'package:eportal/bloc/common_new/danh_sach_loai_van_ban_bloc.dart';
import 'package:eportal/event/common_new/danh_sach_chuyen_muc_event.dart';
import 'package:eportal/event/common_new/danh_sach_co_quan_ban_hanh_event.dart';
import 'package:eportal/event/common_new/danh_sach_loai_van_ban_event.dart';
import 'package:eportal/event/common_new/document_list_event.dart';
import 'package:eportal/model/api/request/common_new/danh_sach_chuyen_muc_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_chuyen_muc_data_request.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_chuyen_muc_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_co_quan_ban_hanh_data_response.dart';
import 'package:eportal/model/share/default_model_select_item_data_response.dart';
import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/base/page_widget/base_page_widget.dart';
import 'package:eportal/page/widget/default_select_item.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/default_button/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../event/common_new/danh_sach_linh_vuc_van_ban_event.dart';
import '../../../../extension/string_extension.dart';
import '../../../../model/api/request/common_new/danh_sach_co_quan_ban_hanh_request.dart';
import '../../../../model/api/request/common_new/danh_sach_linh_vuc_van_ban_request.dart';
import '../../../../model/api/request/common_new/danh_sach_loai_van_ban_request.dart';
import '../../../../model/api/request/common_new/data/danh_sach_co_quan_ban_hanh_data_request.dart';
import '../../../../model/api/request/common_new/data/danh_sach_linh_vuc_van_ban_data_request.dart';
import '../../../../model/api/request/common_new/data/danh_sach_loai_van_ban_data_request.dart';
import '../../../widget/default_select_item_data_response.dart';

class DocumentSearchFilterPage extends BasePageWidget {
  final DocumentListEvent data;
  const DocumentSearchFilterPage({super.key,required this.data});

  @override
  State<StatefulWidget> createState() => DocumentSearchFilterPageState();
}

class DocumentSearchFilterPageState extends BasePageState<DocumentSearchFilterPage> {

  late DanhSachLinhVucVanBanBloc danhSachLinhVucVanBanBloc;
  late DanhSachLoaiVanBanBloc danhSachLoaiVanBanBloc;
  late DanhSachCoQuanBanHanhBloc danhSachCoQuanBanHanhBloc ;

  final List<DefaultModelSelectItemDataResponse<String>> groupTypeDocuments = [
    DefaultModelSelectItemDataResponse(item: "1", text: "Văn bản của Đảng"),
    DefaultModelSelectItemDataResponse(item: "0", text: "NVăn bản quy phạm pháp luật")
  ];
  DanhSachLinhVucVanBanEvent danhSachLinhVucVanBanEvent = DanhSachLinhVucVanBanEvent(request: DanhSachLinhVucVanBanRequest(obj: DanhSachLinhVucVanBanDataRequest()));
  DanhSachLoaiVanBanEvent danhSachLoaiVanBanEvent = DanhSachLoaiVanBanEvent(request: DanhSachLoaiVanBanRequest(obj: DanhSachLoaiVanBanDataRequest()));
  DanhSachCoQuanBanHanhEvent danhSachCoQuanBanHanhEvent = DanhSachCoQuanBanHanhEvent(request: DanhSachCoQuanBanHanhRequest(obj: DanhSachCoQuanBanHanhDataRequest()));


  @override
  void initBloc() {
    danhSachLinhVucVanBanBloc = DanhSachLinhVucVanBanBloc();
    danhSachLoaiVanBanBloc = DanhSachLoaiVanBanBloc();
    danhSachCoQuanBanHanhBloc = DanhSachCoQuanBanHanhBloc();
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    danhSachLinhVucVanBanBloc.close();
    danhSachLoaiVanBanBloc.close();
    danhSachCoQuanBanHanhBloc.close();
  }

  @override
  void initDataLoading() {
    callApi();
  }

  @override
  void getMoreData() {
  }

  @override
  void callApi() {
    danhSachLinhVucVanBanBloc.add(danhSachLinhVucVanBanEvent);
    danhSachLoaiVanBanBloc.add(danhSachLoaiVanBanEvent);
    danhSachCoQuanBanHanhBloc.add(danhSachCoQuanBanHanhEvent);
  }

  @override
  PreferredSizeWidget? getAppBar(BuildContext context) => defaultTabBar();



  @override
  Widget pageUI(BuildContext context) => Container(
    margin: const EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text(
            "Chọn tiêu chí tìm kiếm",
            style: AppTextStyle.titlePage.copyWith(
                overflow: TextOverflow.visible,
                fontSize: 18,
                color: AppColor.colorOfIconActive),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 5, top: 5),
                        color: Colors.white,
                        child: BlocProvider(
                            create: (_) => danhSachCoQuanBanHanhBloc,
                            child: BlocListener<DanhSachCoQuanBanHanhBloc,
                                DataMultiState<DanhSachCoQuanBanHanhDataResponse>>(
                              listener: (BuildContext context,
                                  DataMultiState<DanhSachCoQuanBanHanhDataResponse>
                                  state) {},
                              child: BlocBuilder<DanhSachCoQuanBanHanhBloc,
                                  DataMultiState<DanhSachCoQuanBanHanhDataResponse>>(
                                builder: (BuildContext context,
                                    DataMultiState<DanhSachCoQuanBanHanhDataResponse>
                                    state) =>
                                    _buildViewSearchDanhSachCoQuanBanHanh(
                                        context, state.data),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: DefaultButton(
                  onPressed: () => submitForm(),
                  text: 'Tìm kiếm',
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget _buildViewSearchDanhSachCoQuanBanHanh(
      BuildContext context, List<DanhSachCoQuanBanHanhDataResponse> list) {
    var selectedItem = list.where((element) => element.docUnitID == widget.data.request.obj.coQuanBanHanh).firstOrNull;
    return DefaultSelectItemDataResponse<DanhSachCoQuanBanHanhDataResponse>(
        icon: FontAwesomeIcons.tag,
        selectedItem: selectedItem,
        list: list,
        itemAsString: (DanhSachCoQuanBanHanhDataResponse u) =>
            u.docUnitName.supportHtml(),
        onChanged: (DanhSachCoQuanBanHanhDataResponse? data) {
          if (selectedItem != data) {
            selectedItem = data;
            widget.data.request.obj.coQuanBanHanh = data?.docUnitID;
          }
        },
        labelText: "Cơ quan ban hành",
        hintText: "Cơ quan ban hành",
        title: "Cơ quan ban hành");
  }

  void submitForm() {
    backPage(widget.data);
  }


}