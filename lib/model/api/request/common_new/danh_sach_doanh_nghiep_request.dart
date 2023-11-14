import 'package:eportal/api/constant/application_api_constant.dart';
import 'package:eportal/model/api/request/common_new/data/common_new_data.dart';
import 'package:eportal/model/api/request/common_new/data/danh_sach_doanh_nghiep_data.dart';
import 'package:eportal/model/base/base_eportal_request.dart';

class DanhSachDoanhNghiepRequest
    extends BaseEportalRequest<DanhSachDoanhNghiepData> {
  DanhSachDoanhNghiepRequest({required super.obj});

  @override
  int getTimeCache() => 60 * 30;

  @override
  String getQuery() =>
      ApplicationApiConstant.API_COMMON_NEW_OP_DANH_SACH_DOANH_NGHIEP;
}
