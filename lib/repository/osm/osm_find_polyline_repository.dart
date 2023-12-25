//
// Created by BlackRose on 25/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/api/adapter/base/base_adapter_api.dart';
import 'package:eportal/model/api/request/osm/osm_find_polyline_request.dart';
import 'package:eportal/model/api/response/osm/osm_find_polyline_response.dart';

class OsmFindPolylineRepository {
  Future<OsmFindPolylineResponse> get(OsmFindPolylineRequest request) {
    return BaseAdapterApi()
        .callApiOSMAsync(request)
        .then((value){
      return OsmFindPolylineResponse.fromJson(value);
    });
  }
}