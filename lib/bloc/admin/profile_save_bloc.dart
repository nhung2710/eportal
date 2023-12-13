import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/event/admin/profile_save_event.dart';
import 'package:eportal/model/api/response/admin/data/profile_save_data_response.dart';
import 'package:eportal/model/api/response/admin/profile_save_response.dart';
import 'package:eportal/repository/admin/profile_save_repository.dart';

//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class ProfileSaveBloc extends BaseSingleBloc<ProfileSaveDataResponse,
    ProfileSaveRepository, ProfileSaveEvent, ProfileSaveResponse> {
  @override
  Future<ProfileSaveResponse> callApiResult(
          ProfileSaveRepository apiRepository, ProfileSaveEvent event) =>
      apiRepository.get(event.request);

  @override
  String? getFailMessage(ProfileSaveResponse response) => null;

  @override
  ProfileSaveRepository getRepository() => ProfileSaveRepository();
}
