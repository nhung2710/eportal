import 'dart:math' as math;

import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_size_icon.dart';
import 'package:flutter/material.dart';

import '../../style/app_elevation.dart';

//
// Created by BlackRose on 05/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class ExpandableFab extends StatefulWidget {
  const ExpandableFab(
      {Key? key,
      required this.children,
      this.distance = 100,
      this.spaceGroupdistance = 50,
      this.addNumberGroup = 1,
      this.initNumberGroup = 4,
      this.icon})
      : super(key: key);
  final IconData? icon;
  final List<Widget> children;
  final double distance;
  final double spaceGroupdistance;
  final int addNumberGroup;
  final int initNumberGroup;

  @override
  _ExpandableFabState createState() => _ExpandableFabState();
}

class _ExpandableFabState extends State<ExpandableFab>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _expandAnimation;
  bool _open = false;

  @override
  void initState() {
    super.initState();
    _open = widget.children.length <= 1;
    _controller = AnimationController(
        value: _open ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 100),
        vsync: this);

    _expandAnimation = CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
        reverseCurve: Curves.easeOutQuad);
  }

  void _toggle() {
    setState(() {
      _open = !_open;
      if (_open) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          _tapToClose(),
          ..._buildExpandableFabButton(),
          _tapToOpen(),
        ],
      ),
    );
  }

  Widget _tapToClose() {
    return _open && widget.children.length > 1
        ? ActionButton(
            icon: const Icon(
              Icons.close,
              color: AppColor.colorOfIcon,
            ),
            onPressed: _toggle,
            color: Colors.white,
          )
        : Container();
  }

  Widget _tapToOpen() {
    return !_open && widget.children.length > 1
        ? ActionButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: _toggle,
          )
        : Container();
  }

  List<Widget> _buildExpandableFabButton() {
    final count = widget.children.length;
    final List<Widget> children = <Widget>[];
    if (count > 1) {
      final spaceGroupDistance = widget.spaceGroupdistance;
      final int addNumberGroup = widget.addNumberGroup;
      int countLoop = widget.initNumberGroup;
      int j = 0;
      int k = 0;
      double angleInDegreesChild = 0.0;
      for (var i = 0; i < count; i++) {
        final stepChild = 90.0 / (countLoop - 1);
        children.add(_ExpandableFab(
            directionDegrees: angleInDegreesChild,
            maxDistance: widget.distance + spaceGroupDistance * k,
            progress: _expandAnimation,
            child: widget.children[i]));
        angleInDegreesChild += stepChild;
        j++;
        if (j == countLoop) {
          k++;
          j = 0;
          countLoop += addNumberGroup;
          angleInDegreesChild = 0;
        }
      }
    } else {
      for (var i = 0; i < count; i++) {
        children.add(_ExpandableFab(
            directionDegrees: 0,
            maxDistance: 0,
            progress: _expandAnimation,
            child: widget.children[i]));
      }
    }

    /*final step = 90.0 / (count - 1);

    for(var i=0, angleInDegrees = 0.0; i< count; i++, angleInDegrees += step){
      children.add(
          _ExpandableFab(
              directionDegrees: angleInDegrees,
              maxDistance: widget.distance,
              progress: _expandAnimation,
              child: widget.children[i])
      );
    }*/

    return children;
  }
}

class _ExpandableFab extends StatelessWidget {
  const _ExpandableFab(
      {Key? key,
      required this.directionDegrees,
      required this.maxDistance,
      required this.progress,
      required this.child})
      : super(key: key);

  final double directionDegrees;
  final double maxDistance;
  final Animation<double>? progress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progress!,
      builder: (context, child) {
        final offset = Offset.fromDirection(
            directionDegrees * (math.pi / 180), progress!.value * maxDistance);

        return Positioned(
          right: 4.0 + offset.dx,
          bottom: 4.0 + offset.dy,
          child: Transform.rotate(
            angle: (1.0 - progress!.value) * math.pi / 2,
            child: child,
          ),
        );
      },
      child: FadeTransition(
        opacity: progress!,
        child: child,
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  const ActionButton(
      {Key? key,
      this.onPressed,
      required this.icon,
      this.color = AppColor.colorOfIcon,
      this.size = 50})
      : super(key: key);

  final VoidCallback? onPressed;
  final Icon icon;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: size,
      width: size,
      child: Center(
        child: Material(
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          color: color,
          elevation: AppElevation.sizeOfNormal,
          child: InkWell(
            onTap: onPressed,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: icon,
            ),
          ),
        ),
      ),
    );
  }
}
