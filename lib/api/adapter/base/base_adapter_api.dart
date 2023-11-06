import 'dart:convert';
import 'dart:developer';

import 'package:eportal/api/constant/application_api_constant.dart';
import 'package:eportal/api/model/base/base_eportal_request.dart';
import 'package:eportal/application/global_application.dart';
import 'package:http/http.dart';
import 'package:xml/xml.dart';

class BaseAdapterApi {
  static final BaseAdapterApi _instance = BaseAdapterApi._internal();

  factory BaseAdapterApi() {
    return _instance;
  }
  BaseAdapterApi._internal();
  static final Map<String, String> _Maps = {
    "xmlns:xsi":"http://www.w3.org/2001/XMLSchema-instance",
    "xmlns:xsd":"http://www.w3.org/2001/XMLSchema",
    "xmlns:soap":"http://schemas.xmlsoap.org/soap/envelope",
  };

  Future<Map<String, dynamic>> callApiAsync(BaseEportalRequest request) async {
    StringBuffer stringBuffer =
        StringBuffer('<?xml version="1.0" encoding="utf-8"?>');
    stringBuffer.write('<soap:Envelope ${getMapXml()}>');
    stringBuffer.write('<soap:Header>');
    stringBuffer.write('<AuthHeader xmlns="http://tempuri.org/">');
    stringBuffer.write('<userLogin>$ApplicationApiConstant.BASE_AUTH_HEADER_USER_LOGIN</userLogin>');
    stringBuffer.write('<password>${ApplicationApiConstant.BASE_AUTH_HEADER_PASSWORD}</password>');
    stringBuffer.write('</AuthHeader>');
    stringBuffer.write('</soap:Header>');
    if (request.isAuthentication()) {

    }
    stringBuffer.write('<soap:Body>${request.obj.toXml()}</soap:Body>');
    stringBuffer.write('</soap:Envelope>');
    var responseSoapBody =
        await _callWebServiceAsync(request.getUri(), stringBuffer.toString());
    if (responseSoapBody.isNotEmpty) {
      final xmlResponse = XmlDocument.parse(responseSoapBody);
      var elements = xmlResponse.findAllElements(request.getTagXml());
      for (var item in elements) {
        var jsonValue = item.innerText;
        return json.decode(jsonValue);
      }
    }
    var result = <String, dynamic>{};
    result["status"] = 0;
    result["message"] = "Có lỗi xảy ra vui lòng thử lại sau";
    return result;
  }

  Future<String> _callWebServiceAsync(Uri uri, String request) async {
    try {
      log('data: $request');
      log('uri: $uri');
      var responseSoap = await post(
        uri,
        headers: {
          "Content-Type": "text/xml; charset=utf-8",
          "Content-Length": request.length.toString(),
        },
        body: request,
      );
      log('body: ${responseSoap.body}');
      return responseSoap.body;
    } on Exception catch (ex) {
      log(ex.toString());
      return "";
    }
  }

  getMapXml()  => _Maps.entries.map((entry) => "${entry.key}=\"${entry.value}\"").join(" ");
}
