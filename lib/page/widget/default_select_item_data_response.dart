//
// Created by BlackRose on 12/28/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:dropdown_search/dropdown_search.dart';
import 'package:eportal/model/base/base_eportal_data_response.dart';
import 'package:eportal/page/widget/default_select_item.dart';
import 'package:flutter/material.dart';

class DefaultSelectItemDataResponse<T extends BaseEportalDataResponse>
    extends DefaultSelectItem<T> {
  const DefaultSelectItemDataResponse(
      {super.key,
      super.selectedItem,
      super.filterFn,
      super.helperText,
      super.hintText,
      super.icon,
      super.itemAsString,
      super.labelText,
      required super.list,
      super.onChanged,
      required super.title});

  @override
  State<StatefulWidget> createState() =>
      DefaultSelectItemDataResponseState<T>();
}

class DefaultSelectItemDataResponseState<T extends BaseEportalDataResponse>
    extends DefaultSelectItemState<T> {
  @override
  Widget build(BuildContext context) => DropdownSearch<T>(
        key: key,
        popupProps: buildPopupProps(context),
        dropdownButtonProps: buildDropdownButtonProps(context),
        clearButtonProps: buildClearButtonProps(),
        filterFn: (data, filter) => data.filter(filter),
        selectedItem: widget.selectedItem,
        asyncItems: (String filter) => Future.value(widget.list),
        itemAsString: widget.itemAsString,
        onChanged: widget.onChanged,
        dropdownDecoratorProps:
            buildDropDownDecoratorProps(context, widget.title),
      );
}
