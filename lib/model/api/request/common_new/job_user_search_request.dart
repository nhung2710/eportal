import 'package:eportal/api/constant/application_api_constant.dart';
import 'package:eportal/model/base/base_eportal_request.dart';

import 'data/job_user_search_data_request.dart';

class JobUserSearchRequest
    extends BaseEportalRequest<JobUserSearchDataRequest> {
  JobUserSearchRequest({required super.obj});

  @override
  int getTimeCache() => ApplicationApiConstant.TIME_CACHE_MEDIUM_DEFAULT;

  @override
  String getQuery() => ApplicationApiConstant.API_COMMON_NEW_OP_JOB_USER_SEARCH;
}
