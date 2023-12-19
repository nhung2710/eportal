import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/event/admin/profile_send_list_event.dart';
import 'package:eportal/model/api/response/admin/data/profile_send_list_data_response.dart';
import 'package:eportal/model/api/response/admin/profile_send_list_response.dart';
import 'package:eportal/repository/admin/profile_send_list_repository.dart';

//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class ProfileSendListBloc extends BasePageBloc<ProfileSendListDataResponse,
    ProfileSendListRepository, ProfileSendListEvent, ProfileSendListResponse> {
  @override
  Future<ProfileSendListResponse> callApiResult(
          ProfileSendListRepository apiRepository,
          ProfileSendListEvent event) =>
      apiRepository.get(event.request);

  @override
  String? getFailMessage(ProfileSendListResponse response) => null;

  @override
  ProfileSendListRepository getRepository() => ProfileSendListRepository();
}
