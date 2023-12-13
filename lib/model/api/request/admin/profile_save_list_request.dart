import 'package:eportal/api/constant/application_api_constant.dart';
import 'package:eportal/model/api/request/admin/data/profile_save_list_data_request.dart';
import 'package:eportal/model/base/base_eportal_request.dart';

//
// Created by BlackRose on 01/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class ProfileSaveListRequest
    extends BaseEportalRequest<ProfileSaveListDataRequest> {
  ProfileSaveListRequest({required super.obj});

  @override
  String getQuery() => ApplicationApiConstant.kAPI_ADMIN_OP_PROFILE_SAVE_LIST;

  @override
  bool isAuthentication() => true;

  @override
  String getBaseUri() => ApplicationApiConstant.kAPI_ADMIN_OP;
}
