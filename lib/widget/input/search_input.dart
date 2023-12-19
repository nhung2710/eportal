import 'package:eportal/style/app_size_icon.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:flutter/material.dart';

import '../../style/app_color.dart';

//
// Created by BlackRose on 17/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class SearchInput extends StatefulWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final String? hintText;
  final TextInputAction? textInputAction;
  final IconData? icon;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onTapFilter;
  final int? maxLength;

  const SearchInput({
    super.key,
    this.controller,
    this.onFieldSubmitted,
    this.validator,
    this.hintText,
    this.icon,
    this.onTap,
    this.onTapFilter,
    this.maxLength = 50,
    this.textInputAction,
  });

  @override
  State<StatefulWidget> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  @override
  Widget build(BuildContext context) => TextFormField(
        obscureText: false,
        controller: widget.controller,
        maxLength: widget.maxLength,
        style: AppTextStyle.title,
        textInputAction: widget.textInputAction,
        validator: widget.validator,
        onFieldSubmitted: widget.onFieldSubmitted,
        decoration: InputDecoration(
          hintText: widget.hintText,
          labelText: widget.hintText,
          alignLabelWithHint: true,
          labelStyle: AppTextStyle.titleChild1
              .copyWith(color: AppColor.colorOfHintText),
          hintStyle: AppTextStyle.title
              .copyWith(color: AppColor.colorOfHintText),
          isDense: true,
          prefixIconConstraints: const BoxConstraints(
            minWidth: 25,
            minHeight: 25,
          ),
          prefixIcon: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Icon(
              widget.icon,
              color: AppColor.colorOfIcon,
              size: AppSizeIcon.sizeOfNormal,
            ),
          ),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: widget.onTap,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: const Icon(
                    Icons.send,
                    color: AppColor.colorOfIcon,
                    size: AppSizeIcon.sizeOfNormal,
                  ),
                ),
              ),
              widget.onTapFilter == null
                  ? Container()
                  : GestureDetector(
                      onTap: widget.onTapFilter,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        child: const Icon(
                          Icons.filter_alt_sharp,
                          color: AppColor.colorOfIcon,
                          size: AppSizeIcon.sizeOfNormal,
                        ),
                      ),
                    ),
            ],
          ),
          suffixIconConstraints: const BoxConstraints(
            minWidth: 25,
            minHeight: 25,
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
          counterText: "",
        ),
      );
}
