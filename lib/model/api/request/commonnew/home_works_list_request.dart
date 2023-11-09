

import 'package:eportal/api/constant/application_api_constant.dart';
import 'package:eportal/model/api/request/commonnew/data/common_new_data.dart';
import 'package:eportal/model/base/base_eportal_request.dart';

class HomeWorksListRequest extends BaseEportalRequest<CommonNewData> {
  HomeWorksListRequest({required super.obj});

  @override
  String getStringUri() =>ApplicationApiConstant.API_COMMONNEW_OP_HOME_WORKS_LIST;

  @override
  String getTagXml() => 'HomeWorksListResult';
}


