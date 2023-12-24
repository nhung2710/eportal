//
// Created by BlackRose on 12/24/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class ApplicationApiOsmConstant {
  static const kBaseUriOSM = "https://www.openstreetmap.org/";
  static const kBaseUriOSRM = "https://routing.openstreetmap.de/";
  static const kBaseUriOSMSearch = "https://nominatim.openstreetmap.org/";
  static const kApiSearchLocation =
      "https://nominatim.openstreetmap.org/search?format=json&q=";
  static const kApiPolylineRoutedFootParamsDefault =
      "?overview=false&geometries=polyline&steps=true";
  static const kApiPolylineRoutedFootDefault = "route/v1/driving/";
  static const kApiPolylineRoutedFoot =
      "${kBaseUriOSRM}routed-foot/$kApiPolylineRoutedFootDefault/105.8277547,21.0063414;105.8506526,20.9854758$kApiPolylineRoutedFootParamsDefault";
  static const kApiPolylineRoutedBike =
      "${kBaseUriOSRM}routed-bike/$kApiPolylineRoutedFootDefault/105.8277547,21.0063414;105.8506526,20.9854758$kApiPolylineRoutedFootParamsDefault";
  static const kApiPolylineRoutedCar =
      "${kBaseUriOSRM}routed-car/$kApiPolylineRoutedFootDefault/105.8277547,21.0063414;105.8506526,20.9854758$kApiPolylineRoutedFootParamsDefault";
  static const kApiSearchLocationToName =
      "$kBaseUriOSMSearch/reverse?format=json&lat=21.006341&lon=105.827755";
}
