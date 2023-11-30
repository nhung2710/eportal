import 'package:dropdown_search/dropdown_search.dart';
import 'package:eportal/model/base/base_eportal_data_response.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 30/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class SelectItem<T extends BaseEportalDataResponse>
    extends SelectItemNormal<T> {
  SelectItem(
      {super.key,
      super.selectedItem,
      required super.list,
      required super.title,
      super.itemAsString,
      super.onChanged});

  @override
  State<StatefulWidget> createState() => SelectItemState<T>();
}

class SelectItemNormal<T> extends StatefulWidget {
  final T? selectedItem;
  final List<T> list;
  final String title;
  final ValueChanged<T?>? onChanged;
  final DropdownSearchItemAsString<T>? itemAsString;
  final DropdownSearchFilterFn<T>? filterFn;

  const SelectItemNormal(
      {super.key,
      this.selectedItem,
      required this.list,
      required this.title,
      this.itemAsString,
      this.filterFn,
      this.onChanged});

  @override
  State<StatefulWidget> createState() => SelectItemNormalState<T>();
}

class SelectItemNormalState<T> extends State<SelectItemNormal<T>> {
  final GlobalKey<DropdownSearchState> key = GlobalKey<DropdownSearchState>();

  @override
  Widget build(BuildContext context) => DropdownSearch<T>(
        key: key,
        popupProps: _buildPopupProps(context),
        clearButtonProps: _buildClearButtonProps(),
        filterFn: widget.filterFn,
        selectedItem: widget.selectedItem,
        asyncItems: (String filter) => Future.value(widget.list),
        itemAsString: widget.itemAsString,
        onChanged: widget.onChanged,
        dropdownDecoratorProps:
            _buildDropDownDecoratorProps(context, widget.title),
      );

  PopupProps<T> _buildPopupProps<T>(BuildContext context) => PopupProps.dialog(
      showSearchBox: true,
      emptyBuilder: (context, searchEntry) => const Center(
          child: Text('Không có dữ liệu',
              style: TextStyle(color: AppColor.colorOfIcon))),
      searchFieldProps: const TextFieldProps(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.all(10),
          hintText: "Tìm kiếm...",
        ),
      ));

  DropDownDecoratorProps _buildDropDownDecoratorProps(
          BuildContext context, String title) =>
      DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
            //labelText: title,
            hintText: "Vui lòng chọn ${title.toLowerCase()}",
            labelStyle: AppTextStyle.title,
            hintStyle: AppTextStyle.titleHintPage),
        baseStyle: AppTextStyle.title,
      );

  ClearButtonProps _buildClearButtonProps() => const ClearButtonProps(
      isVisible: true,
      padding: EdgeInsets.zero,
      color: AppColor.colorOfHintText);

  void clear() {
    key.currentState?.clear();
  }
}

class SelectItemState<T extends BaseEportalDataResponse>
    extends SelectItemNormalState<T> {
  @override
  Widget build(BuildContext context) => DropdownSearch<T>(
        key: key,
        popupProps: _buildPopupProps(context),
        clearButtonProps: _buildClearButtonProps(),
        filterFn: (data, filter) => data.filter(filter),
        selectedItem: widget.selectedItem,
        asyncItems: (String filter) => Future.value(widget.list),
        itemAsString: widget.itemAsString,
        onChanged: widget.onChanged,
        dropdownDecoratorProps:
            _buildDropDownDecoratorProps(context, widget.title),
      );
}
