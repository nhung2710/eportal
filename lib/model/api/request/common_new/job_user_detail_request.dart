import 'package:eportal/api/constant/application_api_constant.dart';
import 'package:eportal/model/api/request/common_new/data/common_new_data_request.dart';
import 'package:eportal/model/base/base_eportal_request.dart';

class JobUserDetailRequest extends BaseEportalRequest<CommonNewDataRequest> {
  JobUserDetailRequest({required super.obj});

  @override
  int getTimeCache() => ApplicationApiConstant.TIME_CACHE_MEDIUM_DEFAULT;

  @override
  String getQuery() => ApplicationApiConstant.API_COMMON_NEW_OP_JOB_USER_DETAIL;
}
