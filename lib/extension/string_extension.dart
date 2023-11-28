import 'dart:math';

import 'package:diacritic/diacritic.dart';
import 'package:html/parser.dart' as htmlparser;
import 'package:intl/intl.dart';

import '../api/constant/application_api_constant.dart';
import '../constant/application_constant.dart';
import 'dateTime_extension.dart';

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
    if (isNullOrWhiteSpace()) return ApplicationApiConstant.BASE_URI_MEDIA;
    if (this!.contains(ApplicationApiConstant.BASE_URI_MEDIA)) return this!;
    return "${ApplicationApiConstant.BASE_URI_MEDIA}/$this";
  }

  String convertUrlToYoutubeId({bool trimWhitespaces = true}) {
    String url = this.replaceWhenNullOrWhiteSpace();
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

  String supportHtml() => isNullOrWhiteSpace()
      ? ApplicationConstant.EMPTY
      : (htmlparser.parse(this).firstChild?.text)
          .replaceWhenNullOrWhiteSpace()
          .trim();

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
    if (isNullOrWhiteSpace()) return ApplicationApiConstant.BASE_URI_MEDIA;
    if (this!.contains(ApplicationApiConstant.BASE_URI_MEDIA)) return this!;
    return "${ApplicationApiConstant.BASE_URI_MEDIA}/$this";
  }

  String supportHtml() => isNullOrWhiteSpace()
      ? ApplicationConstant.EMPTY
      : (htmlparser.parse(this).firstChild?.text).replaceWhenNullOrWhiteSpace();

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
