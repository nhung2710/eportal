import 'package:eportal/api/constant/application_api_constant.dart';
import 'package:eportal/model/base/base_eportal_request.dart';

import 'data/news_detail_data_request.dart';

class NewsDetailRequest extends BaseEportalRequest<NewsDetailDataRequest> {
  NewsDetailRequest({required super.obj});

  @override
  int getTimeCache() => ApplicationApiConstant.kTIME_CACHE_HIGH_DEFAULT;

  @override
  String getQuery() => ApplicationApiConstant.kAPI_COMMON_NEW_OP_NEWS_DETAIL;
}
