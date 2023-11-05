import 'package:flutter/material.dart';
import 'dart:math' as math;

//
// Created by BlackRose on 05/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class ExpandableFab extends StatefulWidget {
  const ExpandableFab({Key? key, required this.children, required this.distance, this.icon}) : super(key: key);
  final IconData? icon;
  final List<Widget> children;
  final double distance;

  @override
  _ExpandableFabState createState() => _ExpandableFabState();
}
class _ExpandableFabState extends State<ExpandableFab> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _expandAnimation;
  bool _open = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        value: _open ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 250),
        vsync: this);

    _expandAnimation = CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
        reverseCurve: Curves.easeOutQuad
    );
  }

  void _toggle() {
    setState(() {
      _open = !_open;
      if(_open){
        _controller.forward();
      }else{
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
    return SizedBox(
      height: 55,
      width: 55,
      child: Center(
        child: Material(
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          elevation: 4,
          child: InkWell(
            onTap: _toggle,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.close,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _tapToOpen() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      transformAlignment: Alignment.center,
      transform: Matrix4.diagonal3Values(
          _open ? 0.7 : 1.0,
          _open ? 0.7 : 1.0,
          1.0),
      curve: Curves.easeOut,
      child: AnimatedOpacity(
        opacity: _open ? 0.0 : 1.0,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 250),
        child: FloatingActionButton(
          onPressed: _toggle,
          child: Icon(widget.icon??Icons.add),
        ),
      ),
    );
  }

  List<Widget> _buildExpandableFabButton() {
    final List<Widget> children = <Widget>[];
    final count = widget.children.length;
    final step = 90.0 / (count - 1);

    for(var i=0, angleInDegrees = 0.0; i< count; i++, angleInDegrees += step){
      children.add(
          _ExpandableFab(
              directionDegrees: angleInDegrees,
              maxDistance: widget.distance,
              progress: _expandAnimation,
              child: widget.children[i])
      );
    }

    return children;
  }
}

class _ExpandableFab extends StatelessWidget {
  const _ExpandableFab(
      {Key? key, required this.directionDegrees, required this.maxDistance, required this.progress, required this.child})
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
            directionDegrees * (math.pi / 180),
            progress!.value * maxDistance
        );

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
  const ActionButton({Key? key, this.onPressed, required this.icon}) : super(key: key);

  final VoidCallback? onPressed;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      color: theme.colorScheme.primary,
      elevation: 4.0,
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
      ),
    );
  }
}