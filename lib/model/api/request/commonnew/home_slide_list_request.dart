import 'package:eportal/api/constant/application_api_constant.dart';
import 'package:eportal/model/base/base_eportal_request.dart';
import 'package:eportal/model/api/request/commonnew/data/common_new_data.dart';

class HomeSlideListRequest extends BaseEportalRequest<CommonNewData> {
  HomeSlideListRequest({required super.obj});

  @override
  String getStringUri() =>ApplicationApiConstant.API_COMMONNEW_OP_HOME_SLIDE_LIST;

  @override
  String getTagXml() => 'HomeSlideListResult';
}

