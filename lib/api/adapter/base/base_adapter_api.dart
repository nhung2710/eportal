import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:eportal/api/constant/application_api_constant.dart';
import 'package:eportal/application/global_application.dart';
import 'package:eportal/constant/application_constant.dart';
import 'package:eportal/extension/string_extension.dart';
import 'package:eportal/model/base/base_eportal_request.dart';
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
    StringBuffer logApiData = StringBuffer();
    //await Future.delayed(const Duration(milliseconds: 200));
    try {
      Uri uri = Uri();
      if (!request.getQuery().isNullOrWhiteSpace()) {
        uri = Uri.parse("${request.getBaseUri()}${request.getQuery()}");
      } else {
        uri = request.getUri();
      }

      StringBuffer xmlContent = StringBuffer();
      StringBuffer xmlAuthentication = StringBuffer();

      StringBuffer stringBuffer =
          StringBuffer('<?xml version="1.0" encoding="utf-8"?>');
      stringBuffer.write('<soap:Envelope ${getMapXml()}>');
      stringBuffer.write('<soap:Header>');
      stringBuffer.write('<AuthHeader xmlns="http://tempuri.org/">');

      if (request.isAuthentication()) {
        if (!GlobalApplication().userId.isNullOrWhiteSpace()) {
          xmlAuthentication.write(GlobalApplication()
              .createXml(GlobalApplication().userId, "userId"));
          xmlAuthentication.write(GlobalApplication()
              .createXml(GlobalApplication().userRole, "userRole"));
        } else {
          xmlAuthentication.write(GlobalApplication().createXml(
              ApplicationApiConstant.kBASE_AUTH_HEADER_USER_LOGIN,
              "userLogin"));
          xmlAuthentication.write(GlobalApplication().createXml(
              ApplicationApiConstant.kBASE_AUTH_HEADER_PASSWORD, "password"));
        }
      } else {
        xmlAuthentication.write(GlobalApplication().createXml(
            ApplicationApiConstant.kBASE_AUTH_HEADER_USER_LOGIN, "userLogin"));
        xmlAuthentication.write(GlobalApplication().createXml(
            ApplicationApiConstant.kBASE_AUTH_HEADER_PASSWORD, "password"));
      }
      stringBuffer.write(xmlAuthentication.toString());
      stringBuffer.write('</AuthHeader>');
      stringBuffer.write('</soap:Header>');
      stringBuffer.write('<soap:Body>');

      xmlContent.write(
          '<${request.getTagXmlRequest()} ${request.getDefaultNameSpace()}>');
      xmlContent.write('${request.obj.toXml()}');
      xmlContent.write('</${request.getTagXmlRequest()}>');
      stringBuffer.write(xmlContent.toString());
      stringBuffer.write('</soap:Body>');
      stringBuffer.write('</soap:Envelope>');
      if (isNeedLogApi) {
        logApiData
            .writeln('xmlAuthentication: ${xmlAuthentication.toString()}');
        logApiData.writeln('xmlContent: ${xmlContent.toString()}');
      }
      String responseSoapBody = ApplicationConstant.EMPTY;
      String requestBody = stringBuffer.toString();
      var keyCache =
          "${md5.convert(utf8.encode(requestBody))}|${md5.convert(utf8.encode(uri.toString()))}";
      var valueTimeCache = request.getTimeCache();
      bool isUseCache = false;
      valueTimeCache = 0;
      if (valueTimeCache > 0) {
        var valueCache = GlobalApplication().preferences!.getString(keyCache);
        if (!valueCache.isNullOrWhiteSpace()) {
          var cacheApi = CacheApi.fromJson(json.decode(valueCache!));
          if (cacheApi.timeout != null &&
              cacheApi.timeout! >= DateTime.now().millisecondsSinceEpoch) {
            responseSoapBody = cacheApi.body.replaceWhenNullOrWhiteSpace();
            isUseCache = !responseSoapBody.isNullOrWhiteSpace();
            if (isNeedLogApi) {
              logApiData.writeln('isUseCache: $isUseCache');
              logApiData.writeln('body: $responseSoapBody');
            }
          }
        }
      }
      if (responseSoapBody.isNullOrWhiteSpace()) {
        responseSoapBody = await _callWebServiceAsync(
            uri, requestBody, request.getContentType(), logApiData);
      }
      if (!responseSoapBody.isNullOrWhiteSpace()) {
        final xmlResponse = XmlDocument.parse(responseSoapBody);
        if (isNeedLogApi) {
          logApiData.writeln('getTagXml: ${request.getTagXmlResponse()}');
        }
        var elements = xmlResponse.findAllElements(request.getTagXmlResponse());
        for (var item in elements) {
          var jsonValue = item.innerText;
          if (valueTimeCache > 0 && !isUseCache) {
            await GlobalApplication().preferences!.setString(
                keyCache,
                json.encode(CacheApi(
                        body: responseSoapBody,
                        timeout: DateTime.now()
                            .add(Duration(seconds: valueTimeCache))
                            .millisecondsSinceEpoch)
                    .toJson()));
          }
          if (isNeedLogApi) {
            logApiData.writeln('json: $jsonValue');
          }
          return json.decode(jsonValue);
        }
      }
      return json.decode(
          '{"status":0,"message":"Có lỗi xảy ra vui lòng thử lại sau"}');
    } finally {
      if (isNeedLogApi) {
        print(logApiData.toString());
      }
    }
  }

  Future<String> _callWebServiceAsync(
      Uri uri, String request, String contentType, StringBuffer logApiData,
      {int seconds = 30}) async {
    try {
      if (isNeedLogApi) {
        logApiData.writeln('data: $request');
      }
      if (isNeedLogApi) {
        logApiData.writeln('uri: $uri');
      }
      HttpClient client = HttpClient();
      client.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      HttpClientRequest httpClientRequest = await client.postUrl(uri);
      httpClientRequest.headers.set('Content-Type', contentType);
      httpClientRequest.add(utf8.encode(request));
      final stopwatch = Stopwatch()..start();
      HttpClientResponse httpClientResponse =
          await httpClientRequest.close().timeout(Duration(seconds: seconds));
      String responseSoap =
          await httpClientResponse.transform(utf8.decoder).join();
      client.close();

      if (isNeedLogApi) {
        logApiData.writeln('timecall: ${stopwatch.elapsedMilliseconds} ms');
        logApiData.writeln('body: $responseSoap');
      }
      return responseSoap;
    } on Exception catch (ex) {
      log(ex.toString());
      return "";
    }
  }

  getMapXml() =>
      _Maps.entries.map((entry) => "${entry.key}=\"${entry.value}\"").join(" ");
}
