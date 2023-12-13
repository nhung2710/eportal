import 'package:eportal/api/constant/application_api_constant.dart';
import 'package:eportal/model/api/request/admin/data/work_search_by_user_name_data_request.dart';
import 'package:eportal/model/base/base_eportal_request.dart';

//
// Created by BlackRose on 01/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class WorkSearchByUserNameRequest
    extends BaseEportalRequest<WorkSearchByUserNameDataRequest> {
  WorkSearchByUserNameRequest({required super.obj});

  @override
  String getQuery() =>
      ApplicationApiConstant.kAPI_ADMIN_OP_WORK_SEARCH_BY_USER_NAME;

  @override
  bool isAuthentication() => true;

  @override
  String getBaseUri() => ApplicationApiConstant.kAPI_ADMIN_OP;
}
