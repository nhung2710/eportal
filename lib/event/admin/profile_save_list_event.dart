import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/model/api/request/admin/profile_save_list_request.dart';

//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class ProfileSaveListEvent extends BasePageEvent<ProfileSaveListRequest> {
  const ProfileSaveListEvent({required super.request});
}
