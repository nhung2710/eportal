
import 'dart:convert';
import 'dart:developer';

import 'package:eportal/api/model/base/base_eportal_request.dart';
import 'package:eportal/api/model/base/base_eportal_response.dart';
import 'package:eportal/application/global_application.dart';
import 'package:http/http.dart';
import 'package:xml/xml.dart';

class BaseAdapterApi{
  BaseAdapterApi();
  Future<Map<String, dynamic>> callApiAsync(BaseEportalRequest request) async {
      StringBuffer stringBuffer = StringBuffer('<?xml version="1.0" encoding="utf-8"?>');
      stringBuffer.write('<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">');
      if(request.isAuthentication()){
        stringBuffer.write('<soap:Header>');
        stringBuffer.write('<AuthHeader xmlns="http://tempuri.org/">');
        stringBuffer.write('<userLogin>${GlobalApplication().UserName}</userLogin>');
        stringBuffer.write('<password>${GlobalApplication().UserPassword}</password>');
        stringBuffer.write('</AuthHeader>');
        stringBuffer.write('</soap:Header>');
      }
      stringBuffer.write('<soap:Body>${request.obj?.toXml()}</soap:Body>');
      stringBuffer.write('</soap:Envelope>');
      var responseSoapBody = await callWebServiceAsync(request.getUri(),stringBuffer.toString());
      if(responseSoapBody.isNotEmpty){
        final xmlResponse = XmlDocument.parse(responseSoapBody);
        var elements = xmlResponse.findAllElements(request.getTagXml());
        for(var item in elements){
          var jsonValue = item.innerText;
          return json.decode(jsonValue);
        }
      }
      return <String, dynamic>{};
  }

  Future<String> callWebServiceAsync(Uri uri,String request) async {
    try
    {
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
    }
    on Exception catch (ex)
    {
      log(ex.toString());
      return "";
    }

  }
}