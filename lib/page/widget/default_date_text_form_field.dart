//
// Created by BlackRose on 12/28/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/page/widget/default_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../extension/dateTime_extension.dart';

class DefaultDateTextFormField extends StatefulWidget {
  final String? labelText;
  final String? helperText;
  final String? hintText;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final TextInputAction? textInputAction;
  TextEditingController? controller;
  FocusNode? focusNode;
  DateTime? initialDate;
  DateTime? lastDate;
  DateTime? firstDate;

  DefaultDateTextFormField({
    super.key,
    this.controller,
    this.focusNode,
    this.initialDate,
    this.lastDate,
    this.firstDate,
    this.labelText,
    this.helperText,
    this.hintText,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.inputFormatters,
    this.keyboardType,
    this.validator,
    this.textInputAction,
    this.onFieldSubmitted,
  });

  @override
  State<StatefulWidget> createState() => DefaultDateTextFormFieldState();
}

class DefaultDateTextFormFieldState extends State<DefaultDateTextFormField> {
  @override
  void initState() {
    // TODO: implement initState
    widget.initialDate = widget.initialDate ?? DateTime.now();
    widget.lastDate = widget.lastDate ?? DateTime(DateTime.now().year + 10);
    widget.firstDate = widget.firstDate ?? DateTime(1900);
    widget.controller = widget.controller ?? TextEditingController();
    widget.focusNode = widget.focusNode ?? FocusNode();
    widget.focusNode!.addListener(handleFocus);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => DefaultTextFormField(
        icon: FontAwesomeIcons.calendarCheck,
        controller: widget.controller,
        focusNode: widget.focusNode,
        labelText: widget.labelText,
        hintText: widget.hintText,
        validator: widget.validator,
        onFieldSubmitted: widget.onFieldSubmitted,
        inputFormatters: widget.inputFormatters,
        keyboardType: widget.keyboardType,
        maxLines: widget.maxLines,
        maxLength: widget.maxLength ?? 12,
        helperText: widget.helperText,
        textInputAction: widget.textInputAction,
        minLines: widget.minLines,
        readOnly: true,
        suffixIcon: FontAwesomeIcons.deleteLeft,
      );

  Future<DateTime?> openDateTimePicker(DateTime initialDate) async {
    var pickDate = await showDatePicker(
        context: context,
        initialDate: widget.initialDate,
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.dark(useMaterial3: false),
            child: child!,
          );
        },
        confirmText: "Chọn ngày",
        cancelText: "Hủy",
        fieldLabelText: "Nhập ngày",
        fieldHintText: "Nhập ngày",
        keyboardType: TextInputType.datetime,
        firstDate: widget.firstDate!,
        lastDate: widget.lastDate!);
    if (pickDate != null) {
      widget.initialDate = pickDate;
      widget.controller!.text =
          widget.initialDate!.toFormatDateTime(format: 'dd/MM/yyyy');
    }
    return null;
  }

  void handleFocus() {
    if (widget.focusNode!.hasFocus) {
      widget.focusNode!.unfocus();
      openDateTimePicker(widget.initialDate!);
    }
  }
}
