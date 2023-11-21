import 'package:eportal/api/constant/application_api_constant.dart';
import 'package:eportal/model/base/base_eportal_request.dart';

import 'data/news_search_data_request.dart';

class NewsSearchRequest extends BaseEportalRequest<NewsSearchDataRequest> {
  NewsSearchRequest({required super.obj});

  @override
  int getTimeCache() => ApplicationApiConstant.TIME_CACHE_MEDIUM_DEFAULT;

  @override
  String getQuery() => ApplicationApiConstant.API_COMMON_NEW_OP_NEWS_SEARCH;
}
