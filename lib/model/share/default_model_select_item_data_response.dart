//
// Created by BlackRose on 12/30/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/base/base_eportal_data_response.dart';

import '../../extension/string_extension.dart';

class DefaultModelSelectItemDataResponse<T> extends BaseEportalDataResponse {
  String text;
  T item;

  DefaultModelSelectItemDataResponse({required this.text, required this.item}){
    search = text.getValueSearch();
  }
}
