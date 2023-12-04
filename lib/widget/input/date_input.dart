import 'package:eportal/widget/input/field_input.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../extension/datetime_extension.dart';

//
// Created by BlackRose on 01/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DateInput extends StatefulWidget {
  TextEditingController? controller;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String>? onChangedValue;
  final FormFieldValidator<String>? validator;
  final String? hintText;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  DateTime? initialDate;
  DateTime? lastDate;
  DateTime? firstDate;
  FocusNode? focusNode;

  DateInput({
    super.key,
    this.controller,
    this.onFieldSubmitted,
    this.onChangedValue,
    this.validator,
    this.hintText,
    this.focusNode,
    this.keyboardType,
    this.initialDate,
    this.lastDate,
    this.firstDate,
    this.textInputAction,
  });

  @override
  State<StatefulWidget> createState() => _DateInputState();
}

class _DateInputState extends State<DateInput> {
  DateTime initialDate = DateTime.now();

  @override
  void initState() {
    widget.initialDate = widget.initialDate ?? DateTime.now();
    widget.lastDate = widget.lastDate ?? DateTime(DateTime.now().year + 10);
    widget.firstDate = widget.firstDate ?? DateTime(1900);
    widget.controller = widget.controller ?? TextEditingController();
    widget.focusNode = widget.focusNode ?? FocusNode();

    widget.focusNode!.addListener(handleFocus);
    super.initState();
  }

  @override
  void dispose() {
    widget.focusNode!.removeListener(handleFocus);
    widget.focusNode!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => FieldInput(
        controller: widget.controller,
        focusNode: widget.focusNode,
        maxLength: 20,
        textInputAction: widget.textInputAction ?? TextInputAction.next,
        validator: widget.validator,
        hintText: widget.hintText,
        keyboardType: widget.keyboardType,
        minLines: 1,
        maxLines: 1,
        onFieldSubmitted: widget.onFieldSubmitted,
        icon: FontAwesomeIcons.calendar,
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
        keyboardType: TextInputType.datetime,
        firstDate: widget.firstDate!,
        lastDate: widget.lastDate!);
    if (pickDate != null) {
      widget.initialDate = pickDate;
      widget.controller!.text =
          initialDate.toFormatDateTime(format: 'dd/MM/yyyy');
      if (widget.onChangedValue != null) {
        widget.onChangedValue!(widget.controller!.text);
      }
    }
  }

  void handleFocus() {
    if (widget.focusNode!.hasFocus) {
      widget.focusNode!.unfocus();
      openDateTimePicker(initialDate);
    }
  }
}
