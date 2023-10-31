import 'package:eportal/api/model/base/base_eportal_xml.dart';


class BaseEportalResponse
{
  BaseEportalResponse();

  BaseEportalResponse.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }
}