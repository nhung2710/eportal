//
// Created by BlackRose on 25/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/api/adapter/base/base_adapter_api.dart';

import '../../extension/map_json_extension.dart';
import '../../model/api/request/osm/osm_find_location_by_name_request.dart';
import '../../model/api/response/osm/data/osm_find_location_by_name_data_response.dart';
import '../../model/api/response/osm/osm_find_location_by_name_response.dart';

class OsmFindLocationByNameRepository {
  Future<OsmFindLocationByNameResponse> get(OsmFindLocationByNameRequest request) {
    return BaseAdapterApi()
        .callApiOSMAsync(request)
        .then((value){
      return OsmFindLocationByNameResponse(data: value.entries.map((e) => OsmFindLocationByNameDataResponse.fromJson(e.value)).toList());
    });
  }
}
