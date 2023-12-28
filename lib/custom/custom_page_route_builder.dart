//
// Created by BlackRose on 28/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:flutter/material.dart';

class CustomPageRouteBuilder extends PageRouteBuilder {
  final Widget enterPage;
  final Widget exitPage;
  CustomPageRouteBuilder({required this.exitPage, required this.enterPage})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    enterPage,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        Stack(
          children: <Widget>[
            SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, 0.0),
                end: const Offset(-1.0, 0.0),
              ).animate(animation),
              child: exitPage,
            ),
            SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: enterPage,
            )
          ],
        ),
  );
}