import 'package:eportal/event/base/base_event.dart';
import 'package:eportal/model/api/request/admin/profile_save_request.dart';

//
// Created by BlackRose on 13/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class ProfileSaveEvent extends BaseSingleEvent<ProfileSaveRequest> {
  const ProfileSaveEvent({required super.request});
}
