//
// Created by BlackRose on 25/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/api/constant/application_api_osm_constant.dart';
import 'package:eportal/model/base/base_osm_request.dart';
import 'package:latlong2/latlong.dart';

class OsmFindNameByLocationRequest extends BaseOsmRequest{
  OsmFindNameByLocationRequest({required LatLng latLng}){
    url = "${ApplicationApiOsmConstant.kBaseUriOSMSearch}/reverse?format=json&lat=${latLng.latitude}&lon=${latLng.longitude}";
  }
}