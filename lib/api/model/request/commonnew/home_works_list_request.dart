import 'package:eportal/api/constant/application_api_constant.dart';
import 'package:eportal/api/model/base/base_eportal_request.dart';
import 'package:eportal/api/model/base/base_eportal_xml.dart';

class HomeWorksListRequest extends BaseEportalRequest<HomeWorksListXml> {
  HomeWorksListRequest({required super.obj});

  @override
  String getStringUri() =>ApplicationApiConstant.API_COMMONNEW_OP_HOMEWORKS_LIST;

  @override
  String getTagXml() => 'HomeWorksListResult';
}

class HomeWorksListXml extends BaseEportalXml {
  int flag;
  int top;

  HomeWorksListXml({this.flag = 0, this.top = 0});

  @override
  StringBuffer toXml() {
    // TODO: implement toXml
    var buffer = super.toXml();
    buffer.write('<HomeWorksList ${getDefaultNameSpace()}>');
    buffer.write('<flag>$flag</flag>');
    buffer.write('<top>$top</top>');
    buffer.write('</HomeWorksList>');
    return buffer;
  }
}
