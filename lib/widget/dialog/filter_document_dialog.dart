import 'package:dropdown_search/dropdown_search.dart';
import 'package:eportal/model/api/request/common_new/data/document_list_data_request.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//
// Created by BlackRose on 27/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class FilterDocumentDialog extends BasePage {
  DocumentListDataRequest data;

  final VoidCallback onPressed;

  FilterDocumentDialog(
      {super.key, required this.data, required this.onPressed});

  @override
  State<StatefulWidget> createState() => FilterDocumentDialogState();
}

class FilterDocumentDialogState extends BaseScreenState<FilterDocumentDialog> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      Dialog(
        insetPadding: const EdgeInsets.all(10),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Text("Tiêu chí tìm kiếm thêm"),
              ),

            ],
          ),
        ),
      );


  PopupProps<T> _buildPopupProps<T>(BuildContext context) =>
      PopupProps.dialog(
          showSearchBox: true,
          emptyBuilder: (context, searchEntry) =>
          const Center(
              child: Text('Không có dữ liệu',
                  style: TextStyle(color: AppColor.colorOfIcon))),
          searchFieldProps: const TextFieldProps(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.all(10),
              hintText: "Tìm kiếm...",
            ),
          ));

  DropDownDecoratorProps _buildDropDownDecoratorProps(BuildContext context,
      String title) =>
      DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
            labelText: title,
            hintText: "Vui lòng chọn ${title.toLowerCase()}",
            labelStyle:
            AppTextStyle.titlePage.copyWith(color: AppColor.colorOfIcon),
            hintStyle:
            AppTextStyle.title.copyWith(color: AppColor.colorOfHintText)),
        baseStyle: AppTextStyle.titlePage.copyWith(color: AppColor.colorOfIcon),
      );

  ClearButtonProps _buildClearButtonProps() =>
      const ClearButtonProps(
          isVisible: true,
          padding: EdgeInsets.zero,
          color: AppColor.colorOfHintText);
}