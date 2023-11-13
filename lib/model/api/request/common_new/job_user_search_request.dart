import 'package:eportal/api/constant/application_api_constant.dart';
import 'package:eportal/model/api/request/common_new/data/common_new_data.dart';
import 'package:eportal/model/base/base_eportal_request.dart';

import 'data/job_user_search_data.dart';

class JobUserSearchRequest extends BaseEportalRequest<JobUserSearchData> {
  JobUserSearchRequest({required super.obj});

  @override
  String getQuery() => ApplicationApiConstant.API_COMMON_NEW_OP_JOB_USER_SEARCH;
}
