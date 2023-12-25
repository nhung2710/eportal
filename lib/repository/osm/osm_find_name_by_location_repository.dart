//
// Created by BlackRose on 25/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/api/adapter/base/base_adapter_api.dart';
import 'package:eportal/model/api/request/osm/osm_find_name_by_location_request.dart';
import 'package:eportal/model/api/response/osm/osm_find_name_by_location_response.dart';

class OsmFindNameByLocationRepository {
  Future<OsmFindNameByLocationResponse> get(OsmFindNameByLocationRequest request) {
    return BaseAdapterApi()
        .callApiOSMAsync(request)
        .then((value){
      return OsmFindNameByLocationResponse.fromJson(value);
    });
  }
}
