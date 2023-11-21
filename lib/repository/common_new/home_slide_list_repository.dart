import '../../api/adapter/base/base_adapter_api.dart';
import '../../model/api/request/common_new/home_slide_list_request.dart';
import '../../model/api/response/common_new/home_slide_list_response.dart';

//
// Created by BlackRose on 14/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class HomeSlideListRepository {
  Future<HomeSlideListResponse> getHomeSlideList(HomeSlideListRequest request) {
    return BaseAdapterApi()
        .callApiAsync(request)
        .then((value) => HomeSlideListResponse.fromJson(value));
  }
}
