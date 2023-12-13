import 'package:eportal/api/constant/application_api_constant.dart';
import 'package:eportal/model/base/base_eportal_request.dart';

import 'data/work_search_data_request.dart';

class WorkSearchRequest extends BasePageEportalRequest<WorkSearchDataRequest> {
  WorkSearchRequest({required super.obj});

  @override
  int getTimeCache() => ApplicationApiConstant.kTIME_CACHE_MEDIUM_DEFAULT;

  @override
  String getQuery() => ApplicationApiConstant.kAPI_COMMON_NEW_OP_WORK_SEARCH;
}
