import 'dart:math';

import 'package:eportal/bloc/base/base_bloc.dart';
import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/model/base/base_eportal_data_response.dart';
import 'package:eportal/model/base/base_eportal_request.dart';
import 'package:eportal/model/base/base_eportal_xml.dart';
import 'package:eportal/repository/base/base_repository.dart';

import '../../extension/map_json_extension.dart';
import '../../model/base/base_eportal_response.dart';

//
// Created by BlackRose on 05/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DataExampleTestBloc extends BaseMultiBloc<DataExampleTestDataResponse,
    DataExampleTestRepository, DataExampleTestEvent, DataExampleTestResponse> {
  DataExampleTestBloc() : super();

  @override
  Future<DataExampleTestResponse> callApiResult(
          DataExampleTestRepository apiRepository,
          DataExampleTestEvent event) =>
      Future.delayed(
          const Duration(seconds: 2),
          () => DataExampleTestResponse(
              data: List.generate(Random().nextInt(10),
                  (index) => DataExampleTestDataResponse()),
              status: 2,
              message: 'ok'));

  @override
  String? getFailMessage(DataExampleTestResponse response) => null;

  @override
  DataExampleTestRepository getRepository() => DataExampleTestRepository();
}

class DataExampleTestDataResponse extends BaseEportalDataResponse {
  DataExampleTestDataResponse();

  DataExampleTestDataResponse.fromJson(Map<String, dynamic> json) {}
}

class DataExampleTestResponse
    extends BaseMultiEportalResponse<DataExampleTestDataResponse> {
  DataExampleTestResponse(
      {required super.data, required super.status, required super.message});

  factory DataExampleTestResponse.fromJson(Map<String, dynamic> json) {
    return DataExampleTestResponse(
        data: json.toListObjectJson(
            mapJson: (v) => DataExampleTestDataResponse.fromJson(v)),
        status: json["status"],
        message: json["message"]);
  }
}

class DataExampleTestRepository
    extends BaseRepository<DataExampleTestRequest, DataExampleTestResponse> {
  @override
  DataExampleTestResponse mapJsonToObject(Map<String, dynamic> value) =>
      DataExampleTestResponse.fromJson(value);
}

class DataExampleTestEvent extends BaseMultiEvent<DataExampleTestRequest> {
  const DataExampleTestEvent({required super.request});
}

class DataExampleTestRequest
    extends BaseEportalRequest<DataExampleTestDataRequest> {
  DataExampleTestRequest({required super.obj});
}

class DataExampleTestDataRequest extends BaseEportalXml {}
