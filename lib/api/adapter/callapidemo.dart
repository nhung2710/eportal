
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:xml/xml.dart';

import '../model/response/homenewslist.dart';

class CallApiDemo{
  static Future<Response> CallApi(Uri uri,String request) async {

    log('data: $request');
    log('uri: $uri');
    var _Response = await post(
        uri,
        headers: {
          "Content-Type": "text/xml; charset=utf-8",
          "Content-Length": request.length.toString(),
        },
        body: request
    );

    log('body: ${_Response.body}');
    return _Response;
  }

  static Future<Response> CallHomeNewsList() async {
    var request ='<?xml version="1.0" encoding="utf-8"?><soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"><soap:Header><AuthHeader xmlns="http://tempuri.org/"><userLogin>eportal</userLogin><password>CT03-M14IC-PO22SE-0SOFT4-A0P1J</password></AuthHeader></soap:Header><soap:Body><HomeNewsList xmlns="http://tempuri.org/"><flag>1</flag><top>10</top></HomeNewsList></soap:Body></soap:Envelope>';
    var _Response = await CallApi(Uri.parse('http://cms.eportal.top/api/app/commonnew.asmx?op=HomeNewsList'),request);

    final xmlResponse = XmlDocument.parse(_Response.body);
    var _value = xmlResponse.findAllElements("HomeNewsListResult").single.innerText;

    final _json = json.decode(_value!);
    var _HomeNewsList = HomeNewsList.fromJson(_json);
    return _Response;
  }
}