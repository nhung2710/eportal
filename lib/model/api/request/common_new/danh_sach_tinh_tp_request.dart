import 'package:eportal/api/constant/application_api_constant.dart';
import 'package:eportal/model/api/request/common_new/data/common_new_data.dart';
import 'package:eportal/model/base/base_eportal_request.dart';

class DanhSachTinhTpRequest extends BaseEportalRequest<CommonNewData> {
  DanhSachTinhTpRequest({required super.obj});

  @override
  int getTimeCache() => 60;

  @override
  String getQuery() =>
      ApplicationApiConstant.API_COMMON_NEW_OP_DANH_SACH_TINH_TP;
}
