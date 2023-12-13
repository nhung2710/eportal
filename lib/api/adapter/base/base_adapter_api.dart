import 'dart:convert';
import 'dart:developer';

import 'package:crypto/crypto.dart';
import 'package:eportal/api/constant/application_api_constant.dart';
import 'package:eportal/application/global_application.dart';
import 'package:eportal/constant/application_constant.dart';
import 'package:eportal/extension/string_extension.dart';
import 'package:eportal/model/base/base_eportal_request.dart';
import 'package:http/http.dart';
import 'package:xml/xml.dart';

class CacheApi {
  String? body;
  int? timeout;

  CacheApi({this.body, this.timeout});

  CacheApi.fromJson(Map<String, dynamic> json) {
    body = json['body'] ?? ApplicationConstant.EMPTY;
    timeout = json['timeout'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['body'] = body;
    data['timeout'] = timeout;
    return data;
  }
}

class BaseAdapterApi {
  static final BaseAdapterApi _instance = BaseAdapterApi._internal();
  bool isNeedLogApi = true;

  factory BaseAdapterApi() {
    return _instance;
  }

  BaseAdapterApi._internal();

  static final Map<String, String> _Maps = {
    "xmlns:xsi": "http://www.w3.org/2001/XMLSchema-instance",
    "xmlns:xsd": "http://www.w3.org/2001/XMLSchema",
    "xmlns:soap": "http://schemas.xmlsoap.org/soap/envelope/",
  };

  Future<Map<String, dynamic>> callApiAsync(BaseEportalRequest request) async {
    //await Future.delayed(const Duration(milliseconds: 200));
    Uri uri = Uri();
    if (!request.getQuery().isNullOrWhiteSpace()) {
      uri = Uri.parse("${request.getBaseUri()}${request.getQuery()}");
    } else {
      uri = request.getUri();
    }
    StringBuffer stringBuffer =
    StringBuffer('<?xml version="1.0" encoding="utf-8"?>');
    stringBuffer.write('<soap:Envelope ${getMapXml()}>');
    stringBuffer.write('<soap:Header>');
    stringBuffer.write('<AuthHeader xmlns="http://tempuri.org/">');

    if (request.isAuthentication()) {
      if (!GlobalApplication().userId.isNullOrWhiteSpace()) {
        stringBuffer.write(GlobalApplication()
            .createXml(GlobalApplication().userId, "userId"));
        stringBuffer.write(GlobalApplication()
            .createXml(GlobalApplication().userRole, "userRole"));
      } else {
        stringBuffer.write(GlobalApplication().createXml(
            ApplicationApiConstant.kBASE_AUTH_HEADER_USER_LOGIN, "userLogin"));
        stringBuffer.write(GlobalApplication().createXml(
            ApplicationApiConstant.kBASE_AUTH_HEADER_PASSWORD, "password"));
      }
    } else {
      stringBuffer.write(GlobalApplication().createXml(
          ApplicationApiConstant.kBASE_AUTH_HEADER_USER_LOGIN, "userLogin"));
      stringBuffer.write(GlobalApplication().createXml(
          ApplicationApiConstant.kBASE_AUTH_HEADER_PASSWORD, "password"));
    }
    stringBuffer.write('</AuthHeader>');
    stringBuffer.write('</soap:Header>');
    stringBuffer.write('<soap:Body>');
    stringBuffer.write(
        '<${request.getTagXmlRequest()} ${request.getDefaultNameSpace()}>');
    stringBuffer.write('${request.obj.toXml()}');
    stringBuffer.write('</${request.getTagXmlRequest()}>');
    stringBuffer.write('</soap:Body>');
    stringBuffer.write('</soap:Envelope>');

    String responseSoapBody = ApplicationConstant.EMPTY;
    String requestBody = stringBuffer.toString();
    var keyCache =
        "${md5.convert(utf8.encode(requestBody))}|${md5.convert(
        utf8.encode(uri.toString()))}";
    var valueTimeCache = request.getTimeCache();
    bool isUseCache = false;
    valueTimeCache = 0;
    if (valueTimeCache > 0) {
      var valueCache = GlobalApplication().preferences!.getString(keyCache);
      if (!valueCache.isNullOrWhiteSpace()) {
        var cacheApi = CacheApi.fromJson(json.decode(valueCache!));
        if (cacheApi.timeout != null &&
            cacheApi.timeout! >= DateTime
                .now()
                .millisecondsSinceEpoch) {
          responseSoapBody = cacheApi.body.replaceWhenNullOrWhiteSpace();
          isUseCache = !responseSoapBody.isNullOrWhiteSpace();
          if (isNeedLogApi) {
            log('body: $responseSoapBody');
          }
        }
      }
    }
    if (responseSoapBody.isNullOrWhiteSpace()) {
      responseSoapBody = await _callWebServiceAsync(
          uri, requestBody, request.getContentType());
    }
    if (!responseSoapBody.isNullOrWhiteSpace()) {
      final xmlResponse = XmlDocument.parse(responseSoapBody);
      if (isNeedLogApi) {
        log('getTagXml: ${request.getTagXmlResponse()}');
      }
      var elements = xmlResponse.findAllElements(request.getTagXmlResponse());
      for (var item in elements) {
        var jsonValue = item.innerText;
        if (valueTimeCache > 0 && !isUseCache) {
          await GlobalApplication().preferences!.setString(
              keyCache,
              json.encode(CacheApi(
                  body: responseSoapBody,
                  timeout: DateTime
                      .now()
                      .add(Duration(seconds: valueTimeCache))
                      .millisecondsSinceEpoch)
                  .toJson()));
        }
        return json.decode(jsonValue);
      }
    }
    return json
        .decode('{"status":0,"message":"Có lỗi xảy ra vui lòng thử lại sau"}');
  }

  Future<String> _callWebServiceAsync(Uri uri, String request,
      String contentType) async {
    try {
      if (isNeedLogApi) {
        log('data: $request');
      }
      if (isNeedLogApi) {
        log('uri: $uri');
      }
      var responseSoap = await post(
        uri,
        headers: {
          "Content-Type": contentType,
        },
        body: request,
      ).timeout(const Duration(seconds: 60));
      if (isNeedLogApi) {
        log('body: ${responseSoap.body}');
      }
      return responseSoap.body;
    } on Exception catch (ex) {
      log(ex.toString());
      return "";
    }
  }

  getMapXml() =>
      _Maps.entries.map((entry) => "${entry.key}=\"${entry.value}\"").join(" ");
}
