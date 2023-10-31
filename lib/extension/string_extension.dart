
import '../constant/application_constant.dart';

extension StringExtension on String? {
  bool isNull() => this == null;
  bool isNullOrEmpty() => isNull() || this!.isEmpty;
  bool isNullOrWhiteSpace() => isNull() || this!.isEmpty || this!.trim().isEmpty;
  String replaceWhenNull([String? replace]) => !isNull() ? this! : replace??ApplicationConstant.EMPTY;
  String replaceWhenNullOrEmpty([String? replace]) => !isNullOrEmpty() ? this! : replace??ApplicationConstant.EMPTY;
  String replaceWhenNullOrWhiteSpace([String? replace]) => !isNullOrWhiteSpace() ? this! : replace??ApplicationConstant.EMPTY;
}
