//
// Created by BlackRose on 27/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_elevation.dart';
import 'package:flutter/material.dart';

class DefaultCardItem extends StatelessWidget{
  final Widget child;
  const DefaultCardItem({super.key,required this.child});

  @override
  Widget build(BuildContext context)  => Card(
    elevation: AppElevation.sizeOfNormal,
    color: AppColor.colorOfApp,
    shadowColor: AppColor.colorOfIcon,
    borderOnForeground: false,
    margin: const EdgeInsets.all(5),
    shape: const RoundedRectangleBorder(
        side: BorderSide(color: AppColor.colorOfDrawer, width: 0.2),
        borderRadius: BorderRadius.all(Radius.circular(5))),
    child: child,
  );

}