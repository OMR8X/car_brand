import 'package:flutter/cupertino.dart';

class CustomPageRoute extends PageRouteBuilder {
  final Widget child;
  final AxisDirection direction;
  final double? distance;
  final double opacity;
  CustomPageRoute(
      {required this.child,
      this.direction = AxisDirection.left,
      this.distance,
      this.opacity = 0.85})
      : super(
            transitionDuration: const Duration(milliseconds: 120),
            reverseTransitionDuration: const Duration(milliseconds: 100),
            pageBuilder: (context, animation, secondaryAnimation) => child);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    final curve = CurvedAnimation(parent: animation, curve: Curves.decelerate);
    return SlideTransition(
      position:
          Tween<Offset>(begin: getDirection(), end: Offset.zero).animate(curve),
      child: FadeTransition(
        opacity: Tween<double>(begin: opacity, end: 1.0).animate(curve),
        child: child,
      ),
    );
  }

  Offset getDirection() {
    double mainDistance = distance ?? -0.1;
    switch (direction) {
      case AxisDirection.up:
        return Offset(0, mainDistance);
      case AxisDirection.right:
        return Offset(-mainDistance, 0);
      case AxisDirection.down:
        return Offset(0, -mainDistance);
      case AxisDirection.left:
        return Offset(mainDistance, 0);
    }
  }
}
