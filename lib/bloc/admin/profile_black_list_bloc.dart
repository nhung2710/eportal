import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/event/admin/profile_black_list_event.dart';
import 'package:eportal/model/api/response/admin/data/profile_black_list_data_response.dart';
import 'package:eportal/model/api/response/admin/profile_black_list_response.dart';
import 'package:eportal/repository/admin/profile_black_list_repository.dart';

//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class ProfileBlackListBloc extends BasePageBloc<
    ProfileBlackListDataResponse,
    ProfileBlackListRepository,
    ProfileBlackListEvent,
    ProfileBlackListResponse> {
  @override
  Future<ProfileBlackListResponse> callApiResult(
          ProfileBlackListRepository apiRepository,
          ProfileBlackListEvent event) =>
      apiRepository.get(event.request);

  @override
  String? getFailMessage(ProfileBlackListResponse response) => null;

  @override
  ProfileBlackListRepository getRepository() => ProfileBlackListRepository();
}
