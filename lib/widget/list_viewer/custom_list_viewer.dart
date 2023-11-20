import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_size_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../extension/string_extension.dart';
import '../../style/app_text_style.dart';

//
// Created by BlackRose on 20/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class CustomListViewer extends StatefulWidget {
  List<CustomItemViewer>? children;

  CustomListViewer({this.children});

  @override
  State<StatefulWidget> createState() => _CustomListViewerState();
}

class _CustomListViewerState extends State<CustomListViewer> {
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: (widget.children ?? [])
              .map((e) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Card(
                        margin: const EdgeInsets.only(top: 10),
                        elevation: 5,
                        borderOnForeground: false,
                        child: GestureDetector(
                          onTap: () {
                            e.isExpanded = !e.isExpanded;
                            setState(() {});
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                e.icon == null
                                    ? Container()
                                    : Icon(
                                        e.isExpanded
                                            ? FontAwesomeIcons.angleDown
                                            : FontAwesomeIcons.angleRight,
                                        color: AppColor.colorOfIcon,
                                        size: AppSizeIcon.sizeOfNormal,
                                      ),
                                Expanded(
                                    child: e.currrent ??
                                        Text(
                                            e.title
                                                .replaceWhenNullOrWhiteSpace(),
                                            textAlign: TextAlign.start,
                                            style: AppTextStyle.title.copyWith(
                                                color: AppColor.colorOfIcon))),
                                Icon(
                                  e.isExpanded
                                      ? FontAwesomeIcons.angleDown
                                      : FontAwesomeIcons.angleRight,
                                  color: AppColor.colorOfIcon,
                                  size: AppSizeIcon.sizeOfNormal,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      e.isExpanded
                          ? Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                children: e.children
                                        ?.map<Widget>(
                                            (e) => e.currrent ?? Container())
                                        .toList() ??
                                    [],
                              ),
                            )
                          : Container()
                    ],
                  ))
              .toList(),
        ),
      );
}

class CustomItemViewer {
  Widget? currrent;
  String? title;
  IconData? icon;
  bool isExpanded;
  List<CustomItemViewer>? children = [];

  CustomItemViewer(
      {this.isExpanded = false,
      this.icon,
      this.currrent,
      this.title,
      this.children});
}
