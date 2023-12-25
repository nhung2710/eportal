//
// Created by BlackRose on 25/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/api/constant/application_api_osm_constant.dart';
import 'package:eportal/model/base/base_osm_request.dart';
import 'package:latlong2/latlong.dart';
enum OsmFindPolylineType
{
  routedFoot,
  routedBike,
  routedCar,
}
class OsmFindPolylineRequest extends BaseOsmRequest{
  OsmFindPolylineRequest({required OsmFindPolylineType type,required LatLng from,required LatLng to}){
    var osmFindPolylineTypeName = getOsmFindPolylineType(type);
    url = "${ApplicationApiOsmConstant.kBaseUriOSRM}$osmFindPolylineTypeName${ApplicationApiOsmConstant.kApiPolylineRoutedFootDefault}${from.longitude},${from.latitude};${to.longitude},${to.latitude}${ApplicationApiOsmConstant.kApiPolylineRoutedFootParamsDefault}";
  }

  getOsmFindPolylineType(OsmFindPolylineType type) {
    switch(type){

      case OsmFindPolylineType.routedFoot:
        return "routed-foot/";
        // TODO: Handle this case.
      case OsmFindPolylineType.routedBike:
        return "routed-bike/";
        // TODO: Handle this case.
      case OsmFindPolylineType.routedCar:
        return "routed-car/";
        // TODO: Handle this case.
    }
  }
}