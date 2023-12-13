import 'package:eportal/api/constant/application_api_constant.dart';
import 'package:eportal/model/api/request/common_new/data/ten_tinh_tp_data_request.dart';
import 'package:eportal/model/base/base_eportal_request.dart';

class TenTinhTpRequest extends BaseEportalRequest<TenTinhTpDataRequest> {
  TenTinhTpRequest({required super.obj});

  @override
  int getTimeCache() => ApplicationApiConstant.kTIME_CACHE_DEFAULT;

  @override
  String getQuery() => ApplicationApiConstant.kAPI_COMMON_NEW_OP_TEN_TINH_TP;
}
