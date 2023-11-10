import 'package:eportal/api/constant/application_api_constant.dart';
import 'package:eportal/application/global_application.dart';
import 'package:eportal/constant/application_constant.dart';
import 'package:eportal/model/base/base_eportal_xml.dart';

abstract class BaseEportalRequest<T extends BaseEportalXml> {
  T obj;

  BaseEportalRequest({required this.obj});

  bool isAuthentication() => true;

  String getDefaultNameSpace() => 'xmlns="http://tempuri.org/"';
  String getTagXmlRequest() => getQuery();
  String getTagXmlResponse() => "${getQuery()}${ApplicationApiConstant.API_RESULT}";

  String getStringUri() => ApplicationConstant.EMPTY;
  String getQuery() => ApplicationConstant.EMPTY;
  String getBaseUri() => ApplicationApiConstant.API_COMMON_NEW_OP;
  String getContentType() => "text/xml; charset=utf-8";
  int getTimeCache() => 0;
  Uri getUri() => Uri.parse(getStringUri());
}
