import 'package:eportal/api/constant/application_api_constant.dart';
import 'package:eportal/model/api/request/common_new/data/common_new_data_request.dart';
import 'package:eportal/model/base/base_eportal_request.dart';

import 'data/danh_sach_quan_huyen_data_request.dart';

class DanhSachQuanHuyenRequest
    extends BaseEportalRequest<DanhSachQuanHuyenDataRequest> {
  DanhSachQuanHuyenRequest({required super.obj});

  @override
  int getTimeCache() => ApplicationApiConstant.TIME_CACHE_DEFAULT;

  @override
  String getQuery() =>
      ApplicationApiConstant.API_COMMON_NEW_OP_DANH_SACH_QUAN_HUYEN;
}
