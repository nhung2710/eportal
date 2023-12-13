import 'package:eportal/api/constant/application_api_constant.dart';
import 'package:eportal/model/api/request/common_new/data/home_slide_list_data_request.dart';
import 'package:eportal/model/base/base_eportal_request.dart';

class HomeSlideListRequest
    extends BaseEportalRequest<HomeSlideListDataRequest> {
  HomeSlideListRequest({required super.obj});

  @override
  int getTimeCache() => ApplicationApiConstant.kTIME_CACHE_MEDIUM_DEFAULT;

  @override
  String getQuery() =>
      ApplicationApiConstant.kAPI_COMMON_NEW_OP_HOME_SLIDE_LIST;
}
