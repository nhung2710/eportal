import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/event/common_new/danh_sach_tinh_chat_cong_viec_event.dart';
import 'package:eportal/model/api/response/common_new/danh_sach_tinh_chat_cong_viec_response.dart';
import 'package:eportal/model/api/response/common_new/data/danh_sach_tinh_chat_cong_viec_data_response.dart';
import 'package:eportal/repository/common_new/danh_sach_tinh_chat_cong_viec_repository.dart';

//
// Created by BlackRose on 14/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DanhSachTinhChatCongViecBloc extends BaseMultiBloc<
    DanhSachTinhChatCongViecDataResponse,
    DanhSachTinhChatCongViecRepository,
    DanhSachTinhChatCongViecEvent,
    DanhSachTinhChatCongViecResponse> {
  @override
  Future<DanhSachTinhChatCongViecResponse> callApiResult(
          DanhSachTinhChatCongViecRepository apiRepository,
          DanhSachTinhChatCongViecEvent event) =>
      apiRepository.get(event.request);

  @override
  String? getFailMessage(DanhSachTinhChatCongViecResponse response) => null;

  @override
  DanhSachTinhChatCongViecRepository getRepository() =>
      DanhSachTinhChatCongViecRepository();
}
