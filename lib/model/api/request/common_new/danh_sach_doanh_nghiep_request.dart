import '../../../../api/constant/application_api_constant.dart';
import '../../../base/base_eportal_request.dart';
import 'data/danh_sach_doanh_nghiep_data_request.dart';

class DanhSachDoanhNghiepRequest
    extends BaseEportalRequest<DanhSachDoanhNghiepDataRequest> {
  DanhSachDoanhNghiepRequest({required super.obj});

  @override
  int getTimeCache() => ApplicationApiConstant.TIME_CACHE_DEFAULT;

  @override
  String getQuery() =>
      ApplicationApiConstant.API_COMMON_NEW_OP_DANH_SACH_DOANH_NGHIEP;
}
