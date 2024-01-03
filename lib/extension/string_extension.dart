import 'dart:math';

import 'package:diacritic/diacritic.dart';
import 'package:html/parser.dart' as htmlparser;
import 'package:intl/intl.dart';

import '../api/constant/application_api_constant.dart';
import '../constant/application_constant.dart';
import 'dateTime_extension.dart';

import 'dart:convert';
import 'package:html_unescape/html_unescape.dart';
const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

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

  String getImageUrl() {
    if (isNullOrWhiteSpace()) return ApplicationApiConstant.kBASE_URI_MEDIA;
    if (this!.contains(ApplicationApiConstant.kBASE_URI_MEDIA)) return this!;
    if (this!.startsWith("http")) return this!;
    if (this!.startsWith("www.")) return this!;
    return "${ApplicationApiConstant.kBASE_URI_MEDIA}/$this";
  }

  String capitalize() {
    if (isNullOrWhiteSpace()) return "";
    return "${this![0].toUpperCase()}${this!.substring(1).toLowerCase()}";
  }
  String convertUrlToYoutubeId({bool trimWhitespaces = true}) {
    String url = replaceWhenNullOrWhiteSpace();
    if (!url.contains("http") && (url.length == 11)) return url;
    if (trimWhitespaces) url = url.trim();
    for (var exp in [
      RegExp(
          r"^https:\/\/(?:www\.|m\.)?youtube\.com\/watch\?v=([_\-a-zA-Z0-9]{11}).*$"),
      RegExp(
          r"^https:\/\/(?:music\.)?youtube\.com\/watch\?v=([_\-a-zA-Z0-9]{11}).*$"),
      RegExp(
          r"^https:\/\/(?:www\.|m\.)?youtube\.com\/shorts\/([_\-a-zA-Z0-9]{11}).*$"),
      RegExp(
          r"^https:\/\/(?:www\.|m\.)?youtube(?:-nocookie)?\.com\/embed\/([_\-a-zA-Z0-9]{11}).*$"),
      RegExp(r"^https:\/\/youtu\.be\/([_\-a-zA-Z0-9]{11}).*$")
    ]) {
      Match? match = exp.firstMatch(url);
      if (match != null && match.groupCount >= 1)
        return match.group(1).replaceWhenNullOrWhiteSpace();
    }
    return url;
  }

  String addLine(int number) {
    return replaceWhenNullOrWhiteSpace() +
        List.generate(number, (index) => "\n").join("");
  }

  String supportHtml() {
    if(isNullOrWhiteSpace()) return ApplicationConstant.EMPTY;
    var result = const HtmlEscape(HtmlEscapeMode()).convert(this!);
    result = (htmlparser.parse(this).firstChild?.text)
        .replaceWhenNullOrWhiteSpace()
        .trim();
    final unescape = HtmlUnescape();
    final escaped = unescape.convert(result);
    return escaped;
  }

  String removeUnicode() {
    var value = replaceWhenNullOrWhiteSpace();
    return removeDiacritics(value);
  }

  String getValueSearch() =>
      removeUnicode().replaceAll(RegExp(r'\s'), '').toUpperCase();

  String randomString(int length) {
    Random rnd = Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => _chars.codeUnitAt(rnd.nextInt(_chars.length))));
  }

  DateTime? parseDateTime({String format = "yyyy-MM-ddTHH:mm:ss"}) {
    return isNullOrWhiteSpace() ? null : DateFormat(format).parse(this!);
  }

  String formatDateTimeApi() {
    return (parseDateTime()?.toFormatDateTime(format: "dd/MM/yyyy"))
        .replaceWhenNullOrWhiteSpace();
  }
}

extension StringExtension on String {

  String capitalize() {
    if (isNullOrWhiteSpace()) return "";
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

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

  String getImageUrl() {
    if (isNullOrWhiteSpace()) return ApplicationApiConstant.kBASE_URI_MEDIA;
    if (contains(ApplicationApiConstant.kBASE_URI_MEDIA)) return this;
    return "${ApplicationApiConstant.kBASE_URI_MEDIA}/$this";
  }

  String supportHtml() {
    if(isNullOrWhiteSpace()) return ApplicationConstant.EMPTY;
    var result = (htmlparser.parse(this).firstChild?.text)
        .replaceWhenNullOrWhiteSpace()
        .trim();
    result = const HtmlEscape().convert(result);
    return result;
  }
  String removeUnicode() {
    var value = replaceWhenNullOrWhiteSpace();
    return removeDiacritics(value);
  }

  String getValueSearch() =>
      removeUnicode().replaceAll(RegExp(r'\s'), '').toUpperCase();

  String randomString(int length) {
    Random rnd = Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => _chars.codeUnitAt(rnd.nextInt(_chars.length))));
  }

  DateTime? parseDateTime({String format = "yyyy-MM-ddTHH:mm:ss"}) {
    return isNullOrWhiteSpace() ? null : DateFormat(format).parse(this);
  }

  String addLine(int number) {
    return replaceWhenNullOrWhiteSpace() +
        List.generate(number, (index) => "\n").join("");
  }

  String formatDateTimeApi() {
    return (parseDateTime()?.toFormatDateTime(format: "dd/MM/yyyy HH:mm"))
        .replaceWhenNullOrWhiteSpace();
  }

  String convertUrlToYoutubeId({bool trimWhitespaces = true}) {
    String url = replaceWhenNullOrWhiteSpace();
    if (!url.contains("http") && (url.length == 11)) return url;
    if (trimWhitespaces) url = url.trim();
    for (var exp in [
      RegExp(
          r"^https:\/\/(?:www\.|m\.)?youtube\.com\/watch\?v=([_\-a-zA-Z0-9]{11}).*$"),
      RegExp(
          r"^https:\/\/(?:music\.)?youtube\.com\/watch\?v=([_\-a-zA-Z0-9]{11}).*$"),
      RegExp(
          r"^https:\/\/(?:www\.|m\.)?youtube\.com\/shorts\/([_\-a-zA-Z0-9]{11}).*$"),
      RegExp(
          r"^https:\/\/(?:www\.|m\.)?youtube(?:-nocookie)?\.com\/embed\/([_\-a-zA-Z0-9]{11}).*$"),
      RegExp(r"^https:\/\/youtu\.be\/([_\-a-zA-Z0-9]{11}).*$")
    ]) {
      Match? match = exp.firstMatch(url);
      if (match != null && match.groupCount >= 1)
        return match.group(1).replaceWhenNullOrWhiteSpace();
    }
    return url;
  }
}
