
import '../constant/application_constant.dart';

extension StringNullExtension on String? {
  bool isNull() => this == null;
  bool isNullOrEmpty() => isNull() || this!.isEmpty;
  bool isNullOrWhiteSpace() => isNull() || this!.isEmpty || this!.trim().isEmpty;
  bool isValid(pattern) =>RegExp(pattern).hasMatch(replaceWhenNullOrWhiteSpace());
  String replaceWhenNull([String? replace]) => !isNull() ? this! : replace??ApplicationConstant.EMPTY;
  String replaceWhenNullOrEmpty([String? replace]) => !isNullOrEmpty() ? this! : replace??ApplicationConstant.EMPTY;
  String replaceWhenNullOrWhiteSpace([String? replace]) => !isNullOrWhiteSpace() ? this! : replace??ApplicationConstant.EMPTY;
}

extension StringExtension on String {
  bool isNullOrEmpty() => isNull() || isEmpty;
  bool isNullOrWhiteSpace() => isNull() || isEmpty || trim().isEmpty;
  bool isValid(pattern) =>RegExp(pattern).hasMatch(replaceWhenNullOrWhiteSpace());
  String replaceWhenNull([String? replace]) => !isNull() ? this : replace??ApplicationConstant.EMPTY;
  String replaceWhenNullOrEmpty([String? replace]) => !isNullOrEmpty() ? this : replace??ApplicationConstant.EMPTY;
  String replaceWhenNullOrWhiteSpace([String? replace]) => !isNullOrWhiteSpace() ? this : replace??ApplicationConstant.EMPTY;
}