import 'dart:convert';

import 'package:eportal/model/api/request/admin/work_search_by_user_name_request.dart';
import 'package:eportal/model/api/response/admin/work_search_by_user_name_response.dart';
import 'package:eportal/repository/base/base_repository.dart';

//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class WorkSearchByUserNameRepository extends BaseRepository<
    WorkSearchByUserNameRequest, WorkSearchByUserNameResponse> {
  @override
  WorkSearchByUserNameResponse mapJsonToObject(Map<String, dynamic> value)
      {
        var jsonResult = json.decode(
            '{"status":2,"message":"Có lỗi xảy ra vui lòng thử lại sau","data":[{"imageURL": null,"tenTinhTP": null,"hanNopHoSo": null,"soNamKinhNghiem": null,"parent_ID": null,"gtvl": 0,"id": 0,"ages": "22222222","workTime": "12-23","ungVien_ID": "","isInvite": "False","tinhTP": "6","idSend": "","tuyenDung_ID": "","doanhNghiep_ID": "","business_Vn": null,"jobPlace": "31b50e2b-79cf-4783-b02b-bf7d70ce6cca","ketQuaPhongVan": 0,"levelDesired_ID": "-1","isFlag": 0,"isView": 0,"isSend": 0,"total": 0,"work_ID": "2b2942bf-8d5b-4e05-bd8d-f8eacdf96186","business_ID": "9b2337ca-0f83-41da-b718-7e5f1af22110","title": "a","salary_ID": "8a49c13a-0daf-4bc7-80d7-30b40559a614","quantity": 222222222,"experience_ID": "aa5430cc-7baf-4120-8b00-99181f48a0a2","gender": 0,"level_ID": "aa5430cc-7baf-4120-8b00-99181f48a0a2","quanHuyen": "","typeOf_ID": "d017388b-cace-42df-ab61-d7f094f81c8d","career_ID": "535f8bb0-99a8-4171-94b3-3ca732ad2356","description": "a","requirement": "b","benefit": "d","requirementsProfile": "c","expiredDate": "1900-01-01T00:00:00","submissionSend": "","startDate": "2023-12-18T00:00:00","endDate": "2023-12-31T00:00:00","contactUser": "f","contactAddress": "f","contactMobile": "f","contactEmail": "f","contactDes": "e","isHot": true,"isGhim": false,"isFast": true,"isUrgent": true,"isApproval": false,"approvalUser": "","approvalDate": "1900-01-01T00:00:00","isDelete": false,"deletedUser": "","deletedDate": "1900-01-01T00:00:00","createdDate": "2023-12-19T14:42:21.9645049+07:00","createdUser": "thaidn@gmail1.com","updatedDate": "1900-01-01T00:00:00","updatedUser": "","portalID": 0}] }');
         return WorkSearchByUserNameResponse.fromJson(value);
      }

}
