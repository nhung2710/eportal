import 'package:eportal/api/constant/application_api_constant.dart';
import 'package:eportal/model/api/request/common_new/data/common_new_data_request.dart';
import 'package:eportal/model/base/base_eportal_request.dart';

import 'data/news_search_data_request.dart';

class NewsSearchRequest extends BaseEportalRequest<NewsSearchDataRequest> {
  NewsSearchRequest({required super.obj});

  @override
  String getQuery() => ApplicationApiConstant.API_COMMON_NEW_OP_NEWS_SEARCH;
}
