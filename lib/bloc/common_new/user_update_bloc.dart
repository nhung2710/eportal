import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/event/common_new/user_update_event.dart';
import 'package:eportal/model/api/response/common_new/data/user_update_data_response.dart';
import 'package:eportal/model/api/response/common_new/user_update_response.dart';
import 'package:eportal/repository/common_new/user_update_repository.dart';

//
// Created by BlackRose on 01/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class UserUpdateBloc extends BaseSingleBloc<UserUpdateDataResponse,
    UserUpdateRepository, UserUpdateEvent, UserUpdateResponse> {
  @override
  Future<UserUpdateResponse> callApiResult(
          UserUpdateRepository apiRepository, UserUpdateEvent event) =>
      apiRepository.get(event.request);

  @override
  String? getFailMessage(UserUpdateResponse response) => null;

  @override
  UserUpdateRepository getRepository() => UserUpdateRepository();
}
