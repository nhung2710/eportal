//
// Created by BlackRose on 18/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/api/request/admin/job_user_refer_delete_request.dart';
import 'package:equatable/equatable.dart';

import '../../model/api/request/admin/job_user_refer_add_request.dart';
import '../../model/api/request/admin/job_user_refer_update_request.dart';

class JobUserReferSaveEvent extends Equatable {
  List<JobUserReferDeleteRequest> lstJobUserReferDeleteRequest;
  List<JobUserReferAddRequest> lstJobUserReferAddRequest;
  List<JobUserReferUpdateRequest> lstJobUserReferUpdateRequest;

  JobUserReferSaveEvent(
      {required this.lstJobUserReferDeleteRequest,
      required this.lstJobUserReferAddRequest,
      required this.lstJobUserReferUpdateRequest});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
