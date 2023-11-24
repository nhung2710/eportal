import 'package:eportal/model/api/response/common_new/data/home_advertise_list_data_response.dart';
import 'package:eportal/model/base/base_eportal_response.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 23/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class HomeAdvertiseListResponse
    extends BaseMultiEportalResponse<HomeAdvertiseListDataResponse> {
  HomeAdvertiseListResponse(
      {required super.data, required super.status, required super.message});

  factory HomeAdvertiseListResponse.fromJson(Map<String, dynamic> json) {
    List<HomeAdvertiseListDataResponse> data =
        <HomeAdvertiseListDataResponse>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(HomeAdvertiseListDataResponse.fromJson(v));
      });
    }
    return HomeAdvertiseListResponse(
        data: data, status: json["status"], message: json["message"]);
  }
}
