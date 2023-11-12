import 'package:eportal/api/constant/application_api_constant.dart';
import 'package:eportal/model/api/request/common_new/data/common_new_data.dart';
import 'package:eportal/model/base/base_eportal_request.dart';

class TenTinhTpRequest extends BaseEportalRequest<CommonNewData> {
  TenTinhTpRequest({required super.obj});

  @override
  String getQuery() => ApplicationApiConstant.API_COMMON_NEW_OP_TEN_TINH_TP;
}
