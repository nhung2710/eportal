
import '../api/constant/application_api_constant.dart';
import '../constant/application_constant.dart';
import 'package:html/parser.dart' as htmlparser;
import 'package:diacritic/diacritic.dart';

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

  String removeUnicode() {
    var value = replaceWhenNullOrWhiteSpace();
    return removeDiacritics(value);
  }

  String getValueSearch() =>
      removeUnicode().replaceAll(RegExp(r'\s'), '').toUpperCase();
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

  String getImageUrl() => "${ApplicationApiConstant.BASE_URI_MEDIA}/$this";

  String supportHtml() => isNullOrWhiteSpace()
      ? ApplicationConstant.EMPTY
      : (htmlparser.parse(this).firstChild?.text).replaceWhenNullOrWhiteSpace();

  String removeUnicode() {
    var value = replaceWhenNullOrWhiteSpace();
    return removeDiacritics(value);
  }

  String getValueSearch() =>
      removeUnicode().replaceAll(RegExp(r'\s'), '').toUpperCase();
}
