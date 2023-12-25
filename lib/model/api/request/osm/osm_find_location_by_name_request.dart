//
// Created by BlackRose on 25/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/api/constant/application_api_osm_constant.dart';
import 'package:eportal/model/base/base_osm_request.dart';

class OsmFindLocationByNameRequest extends BaseOsmRequest{
  OsmFindLocationByNameRequest({required String search}){
    url = "${ApplicationApiOsmConstant.kBaseUriOSMSearch}search?format=json&q=$search";
  }
}