import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/event/admin/profile_view_list_event.dart';
import 'package:eportal/model/api/response/admin/data/profile_view_list_data_response.dart';
import 'package:eportal/model/api/response/admin/profile_view_list_response.dart';
import 'package:eportal/repository/admin/profile_view_list_repository.dart';

//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class ProfileViewListBloc extends BaseSingleBloc<ProfileViewListDataResponse,
    ProfileViewListRepository, ProfileViewListEvent, ProfileViewListResponse> {
  @override
  Future<ProfileViewListResponse> callApiResult(
          ProfileViewListRepository apiRepository,
          ProfileViewListEvent event) =>
      apiRepository.get(event.request);

  @override
  String? getFailMessage(ProfileViewListResponse response) => null;

  @override
  ProfileViewListRepository getRepository() => ProfileViewListRepository();
}
