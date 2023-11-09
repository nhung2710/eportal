import 'package:eportal/model/base/base_eportal_xml.dart';

abstract class BaseEportalRequest<T extends BaseEportalXml> {
  T obj;

  BaseEportalRequest({required this.obj});

  bool isAuthentication() => true;

  String getTagXml();

  String getStringUri();

  Uri getUri() => Uri.parse(getStringUri());
}
