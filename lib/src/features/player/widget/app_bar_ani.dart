import 'package:flutter/material.dart';

class AppBarAni extends StatelessWidget implements PreferredSizeWidget {
  const AppBarAni({
    required this.child,
    required this.controller,
    required this.visible,
    this.position,
    super.key,
  });

  final PreferredSizeWidget child;
  final AnimationController controller;
  final bool visible;
  final String? position;

  @override
  Size get preferredSize => child.preferredSize;

  @override
  Widget build(BuildContext context) {
    visible ? controller.forward() : controller.reverse();
    return SlideTransition(
      position: Tween<Offset>(
        begin: Offset(0, position! == 'top' ? -1 : 1),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: controller,
        curve: Curves.linear,
      )),
      child: Container(
        decoration: BoxDecoration(
          gradient: position! == 'top'
              ? const LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: <Color>[
              Colors.transparent,
              Colors.black54,
            ],
            tileMode: TileMode.mirror,
          )
              : const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Colors.transparent,
              Colors.black54,
            ],
            tileMode: TileMode.mirror,
          ),
        ),
        child: child,
      ),
    );
  }
}