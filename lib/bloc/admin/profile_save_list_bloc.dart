import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/event/admin/profile_save_list_event.dart';
import 'package:eportal/model/api/response/admin/data/profile_save_list_data_response.dart';
import 'package:eportal/model/api/response/admin/profile_save_list_response.dart';
import 'package:eportal/repository/admin/profile_save_list_repository.dart';

//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class ProfileSaveListBloc extends BasePageBloc<ProfileSaveListDataResponse,
    ProfileSaveListRepository, ProfileSaveListEvent, ProfileSaveListResponse> {
  @override
  Future<ProfileSaveListResponse> callApiResult(
          ProfileSaveListRepository apiRepository,
          ProfileSaveListEvent event) =>
      apiRepository.get(event.request);

  @override
  String? getFailMessage(ProfileSaveListResponse response) => null;

  @override
  ProfileSaveListRepository getRepository() => ProfileSaveListRepository();
}
