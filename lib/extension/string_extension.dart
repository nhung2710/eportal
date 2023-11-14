import 'dart:convert';

import '../api/constant/application_api_constant.dart';
import '../constant/application_constant.dart';
import 'package:html/parser.dart' as htmlparser;
import 'package:html/dom.dart' as dom;

extension StringNullExtension on String? {
  bool isNull() => this == null;

  bool isNullOrEmpty() => isNull() || this!.isEmpty;

  bool isNullOrWhiteSpace() =>
      isNull() || this!.isEmpty || this!.trim().isEmpty;

  bool isValid(pattern) =>
      RegExp(pattern).hasMatch(replaceWhenNullOrWhiteSpace());

  String replaceWhenNull([String? replace]) =>
      !isNull() ? this! : replace ?? ApplicationConstant.EMPTY;

  String replaceWhenNullOrEmpty([String? replace]) =>
      !isNullOrEmpty() ? this! : replace ?? ApplicationConstant.EMPTY;

  String replaceWhenNullOrWhiteSpace([String? replace]) =>
      !isNullOrWhiteSpace() ? this! : replace ?? ApplicationConstant.EMPTY;

  String getImageUrl() => "${ApplicationApiConstant.BASE_URI_MEDIA}/$this";

  String supportHtml() => isNullOrWhiteSpace()
      ? ApplicationConstant.EMPTY
      : (htmlparser.parse(this).firstChild?.text).replaceWhenNullOrWhiteSpace();
}

extension StringExtension on String {
  bool isNullOrEmpty() => isNull() || isEmpty;

  bool isNullOrWhiteSpace() => isNull() || isEmpty || trim().isEmpty;

  bool isValid(pattern) =>
      RegExp(pattern).hasMatch(replaceWhenNullOrWhiteSpace());

  String replaceWhenNull([String? replace]) =>
      !isNull() ? this : replace ?? ApplicationConstant.EMPTY;

  String replaceWhenNullOrEmpty([String? replace]) =>
      !isNullOrEmpty() ? this : replace ?? ApplicationConstant.EMPTY;

  String replaceWhenNullOrWhiteSpace([String? replace]) =>
      !isNullOrWhiteSpace() ? this : replace ?? ApplicationConstant.EMPTY;
}
