import '../../application/global_application.dart';
import '../../constant/application_constant.dart';
import '../../extension/string_extension.dart';

class BaseEportalXml {
  StringBuffer toXml() {
    var buffer = StringBuffer();
    if (!GlobalApplication().UserId.isNullOrWhiteSpace()) {
      buffer.write(createXml("userid", GlobalApplication().UserId));
    }
    return buffer;
  }

  String createXml(Object? value, String tag) {
    var buffer = StringBuffer();
    buffer.write('<$tag>');
    if (value != null) {
      buffer.write(value);
    } else {
      buffer.write(ApplicationConstant.EMPTY);
    }
    buffer.write('</$tag>');
    return buffer.toString();
  }
}
