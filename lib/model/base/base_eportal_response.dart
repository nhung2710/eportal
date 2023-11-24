import 'package:eportal/model/base/base_eportal_data_response.dart';

class BaseEportalResponse {
  int status = 0;
  String message = "Có lỗi xảy ra vui lòng thử lại sau";

  BaseEportalResponse({required this.status, required this.message});

  factory BaseEportalResponse.fromJson(Map<String, dynamic> json) {
    return BaseEportalResponse(
        status: json["status"], message: json["message"]);
  }
}

class BaseSingleEportalResponse<T> extends BaseEportalResponse {
  T? data;

  BaseSingleEportalResponse(
      {required this.data, required super.status, required super.message});

  factory BaseSingleEportalResponse.fromJson(Map<String, dynamic> json) {
    return BaseSingleEportalResponse(
        data: null, status: json["status"], message: json["message"]);
  }
}

class BaseMultiEportalResponse<T extends BaseEportalDataResponse>
    extends BaseEportalResponse {
  List<T> data = [];

  BaseMultiEportalResponse(
      {required this.data, required super.status, required super.message});

  factory BaseMultiEportalResponse.fromJson(Map<String, dynamic> json) {
    return BaseMultiEportalResponse(
        data: [], status: json["status"], message: json["message"]);
  }
}

class BasePageEportalResponse<T extends BaseEportalDataResponse>
    extends BaseEportalResponse {
  List<T> data = [];

  BasePageEportalResponse(
      {required this.data, required super.status, required super.message});

  factory BasePageEportalResponse.fromJson(Map<String, dynamic> json) {
    return BasePageEportalResponse(
        data: [], status: json["status"], message: json["message"]);
  }
}
