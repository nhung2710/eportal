import 'package:eportal/model/api/request/common_new/danh_sach_nganh_nghe_request.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_nganh_nghe_data_request.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/input/field_input.dart';
import 'package:eportal/widget/select/select_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../bloc/common_new/danh_sach_nganh_nghe_bloc.dart';
import '../../../../event/common_new/danh_sach_nganh_nghe_event.dart';
import '../../../../extension/string_extension.dart';
import '../../../../model/api/response/common_new/data/danh_sach_nganh_nghe_data_response.dart';

//
// Created by BlackRose on 04/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class ChangeBusinessInfoAboutTab extends BasePage {
  ChangeBusinessInfoAboutTab({super.key});

  DanhSachNganhNgheDataResponse? danhSachNganhNgheDataResponse;

  @override
  State<StatefulWidget> createState() => ChangeBusinessInfoAboutTabState();
}

class ChangeBusinessInfoAboutTabState
    extends BaseScreenStateActive<ChangeBusinessInfoAboutTab> {
  TextEditingController scaleOfUnitsController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  late DanhSachNganhNgheBloc danhSachNganhNgheBloc;

  @override
  void initBloc() {
    danhSachNganhNgheBloc = DanhSachNganhNgheBloc();
  }

  @override
  void initDataLoading() {
    callApi();
  }


  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    danhSachNganhNgheBloc.close();
  }

  @override
  void getMoreData() {
    // TODO: implement getMoreData
  }

  @override
  void callApi() {
    danhSachNganhNgheBloc.add(DanhSachNganhNgheEvent(
        request:
            DanhSachNganhNgheRequest(obj: DanhSachNganhNgheDataRequest())));
  }

  @override
  Widget pageUI(BuildContext context) => ListView(
        children: <Widget>[
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
              controller: scaleOfUnitsController,
              maxLength: 14,
              textInputAction: TextInputAction.next,
              hintText: 'Quy mô đơn vị',
              icon: FontAwesomeIcons.solidCreditCard,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: FieldInput(
              controller: aboutController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.multiline,
              maxLength: 2000,
              minLines: 20,
              maxLines: 50,
              icon: Icons.description,
              hintText: "Giới thiệu về doanh nghiệp",
            ),
          ),
        ],
      );

  Widget _buildViewSearchDanhSachNganhNghe(
      BuildContext context, List<DanhSachNganhNgheDataResponse> list) {
    return SelectItem<DanhSachNganhNgheDataResponse>(
      icon: FontAwesomeIcons.tags,
      selectedItem: widget.danhSachNganhNgheDataResponse,
      list: list,
      itemAsString: (DanhSachNganhNgheDataResponse u) =>
          u.careerName.supportHtml(),
      onChanged: (DanhSachNganhNgheDataResponse? data) {
        if (widget.danhSachNganhNgheDataResponse != data) {
          widget.danhSachNganhNgheDataResponse = data;
        }
      },
      title: 'Ngành nghề kinh doanh',
    );
  }
}
