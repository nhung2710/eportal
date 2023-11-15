import 'package:eportal/api/constant/application_api_constant.dart';
import 'package:eportal/model/api/request/common_new/data/common_new_data_request.dart';
import 'package:eportal/model/base/base_eportal_request.dart';

class DanhSachGioiTinhRequest extends BaseEportalRequest<CommonNewDataRequest> {
  DanhSachGioiTinhRequest({required super.obj});

  @override
  String getQuery() =>
      ApplicationApiConstant.API_COMMON_NEW_OP_DANH_SACH_GIOI_TINH;
}
