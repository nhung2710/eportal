//
// Created by BlackRose on 12/28/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:dropdown_search/dropdown_search.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_size_icon.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DefaultSelectItem<T> extends StatefulWidget {
  final T? selectedItem;
  final List<T> list;
  final String title;
  final ValueChanged<T?>? onChanged;
  final DropdownSearchItemAsString<T>? itemAsString;
  final DropdownSearchFilterFn<T>? filterFn;
  final IconData? icon;
  final String? labelText;
  final String? helperText;
  final String? hintText;

  const DefaultSelectItem({
    super.key,
    this.selectedItem,
    required this.list,
    required this.title,
    this.itemAsString,
    this.filterFn,
    required this.icon,
    this.onChanged,
    this.hintText,
    this.labelText,
    this.helperText,
  });

  @override
  State<StatefulWidget> createState() => DefaultSelectItemState<T>();
}

class DefaultSelectItemState<T> extends State<DefaultSelectItem<T>> {
  final GlobalKey<DropdownSearchState> key = GlobalKey<DropdownSearchState>();

  @override
  Widget build(BuildContext context) => DropdownSearch<T>(
        key: key,
        dropdownButtonProps: buildDropdownButtonProps(context),
        popupProps: buildPopupProps(context),
        clearButtonProps: buildClearButtonProps(),
        filterFn: widget.filterFn,
        selectedItem: widget.selectedItem,
        asyncItems: (String filter) => Future.value(widget.list),
        itemAsString: widget.itemAsString,
        onChanged: widget.onChanged,
        dropdownDecoratorProps:
            buildDropDownDecoratorProps(context, widget.title),
      );

  PopupProps<T> buildPopupProps<T>(BuildContext context) => PopupProps.dialog(
      showSearchBox: true,
      title: Container(
        margin: const EdgeInsets.all(10),
        child: const Center(
          child: Text(
            "Vui lòng lựa chọn",
            style: AppTextStyle.titlePage,
          ),
        ),
      ),
      emptyBuilder: (context, searchEntry) => Center(
          child: Text('Không có dữ liệu',
              style: AppTextStyle.title.copyWith(
                color: Colors.red,
              ))),
      searchFieldProps: TextFieldProps(
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        style: AppTextStyle.title
            .copyWith(color: Colors.black, overflow: TextOverflow.visible),
        maxLength: 100,
        decoration: InputDecoration(
          isDense: true,
          icon: const Icon(
            FontAwesomeIcons.magnifyingGlass,
            color: AppColor.colorOfIcon,
            size: AppSizeIcon.sizeOfNormal,
          ),
          labelText: "Tìm kiếm",
          hintText: "Tìm kiếm",
          alignLabelWithHint: true,
          errorStyle: AppTextStyle.normal.copyWith(
            color: Colors.red,
          ),
          helperStyle: AppTextStyle.normal.copyWith(
            color: Colors.grey,
          ),
          labelStyle: AppTextStyle.normal.copyWith(
            color: AppColor.colorOfIcon,
          ),
          hintStyle: AppTextStyle.normal.copyWith(
            color: Colors.grey,
          ),
          counterStyle: AppTextStyle.normal.copyWith(
            color: Colors.red,
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 0.3,
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 0.3,
            ),
          ),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 0.3,
            ),
          ),
        ),
      ));

  DropDownDecoratorProps buildDropDownDecoratorProps(
          BuildContext context, String title) =>
      DropDownDecoratorProps(
        textAlignVertical: TextAlignVertical.center,
        textAlign: TextAlign.left,
        dropdownSearchDecoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.zero,
          icon: Icon(
            widget.icon ?? Icons.tag,
            color: AppColor.colorOfIcon,
            size: AppSizeIcon.sizeOfNormal,
          ),
          labelText: widget.labelText,
          hintText: widget.hintText,
          helperText: widget.helperText,
          alignLabelWithHint: true,
          errorStyle: AppTextStyle.normal.copyWith(
            color: Colors.red,
          ),
          helperStyle: AppTextStyle.normal.copyWith(
            color: Colors.grey,
          ),
          labelStyle: AppTextStyle.normal.copyWith(
            color: AppColor.colorOfIcon,
          ),
          hintStyle: AppTextStyle.normal.copyWith(
            color: Colors.grey,
          ),
          counterStyle: AppTextStyle.normal.copyWith(
            color: Colors.red,
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 0.3,
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 0.3,
            ),
          ),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 0.3,
            ),
          ),
        ),
        baseStyle: AppTextStyle.title
            .copyWith(color: Colors.black, overflow: TextOverflow.visible),
      );

  ClearButtonProps buildClearButtonProps() => const ClearButtonProps(
      isVisible: true,
      padding: EdgeInsets.zero,
      icon: Icon(
        FontAwesomeIcons.deleteLeft,
        color: Colors.red,
        size: AppSizeIcon.sizeOfNormal,
      ),
      color: AppColor.colorOfHintText);

  void clear() {
    key.currentState?.clear();
  }

  DropdownButtonProps buildDropdownButtonProps(BuildContext context) {
    return const DropdownButtonProps(isVisible: false);
  }
}
