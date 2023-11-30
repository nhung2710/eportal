import 'package:eportal/api/constant/application_api_constant.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_gioi_tinh_data_request.dart';
import 'package:eportal/model/base/base_eportal_request.dart';

class DanhSachGioiTinhRequest
    extends BaseMultiEportalRequest<DanhSachGioiTinhDataRequest> {
  DanhSachGioiTinhRequest({required super.obj});

  @override
  int getTimeCache() => ApplicationApiConstant.TIME_CACHE_DEFAULT;

  @override
  String getQuery() =>
      ApplicationApiConstant.API_COMMON_NEW_OP_DANH_SACH_GIOI_TINH;
}
