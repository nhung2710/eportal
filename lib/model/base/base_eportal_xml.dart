import '../../application/global_application.dart';
import '../../constant/application_constant.dart';
import '../../extension/string_extension.dart';

class BaseEportalXml {
  StringBuffer toXml() {
    var buffer = StringBuffer();
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

class BaseSingleEportalXml extends BaseEportalXml {
  BaseSingleEportalXml();
}

class BaseMultiEportalXml extends BaseEportalXml {
  int top;

  BaseMultiEportalXml({this.top = ApplicationConstant.NUMBER_FULL_ITEM});

  @override
  StringBuffer toXml() {
    // TODO: implement toXml
    var buffer = super.toXml();

    buffer.write(createXml(top, "top"));
    return buffer;
  }
}

class BasePageEportalXml extends BaseEportalXml {
  int soTrangHienTai;
  int soBanGhiTrenTrang;

  BasePageEportalXml(
      {this.soTrangHienTai = 1,
      this.soBanGhiTrenTrang = ApplicationConstant.NUMBER_PREVIEW_ITEM});

  @override
  StringBuffer toXml() {
    // TODO: implement toXml
    var buffer = super.toXml();

    buffer.write(createXml(soTrangHienTai, "soTrangHienTai"));
    buffer.write(createXml(soBanGhiTrenTrang, "soBanGhiTrenTrang"));
    return buffer;
  }
}
