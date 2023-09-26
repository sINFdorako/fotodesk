// switch_in_switch_out.dart
import 'package:flutter/widgets.dart';

class SwitchInSwitchOut extends StatelessWidget {
  final Widget child;

  const SwitchInSwitchOut({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 100),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ClipRect(
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
      },
      key: key,
      child: child,
    );
  }
}
