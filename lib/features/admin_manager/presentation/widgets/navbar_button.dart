import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fotodesk/features/admin_manager/presentation/widgets/navbar.dart';

import '../../../../core/router/router.gr.dart';

class NavBarButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final NavBarItem navBarItem;

  const NavBarButton(
      {required this.label,
      required this.icon,
      required this.navBarItem,
      Key? key})
      : super(key: key);

  @override
  _NavBarButtonState createState() => _NavBarButtonState();
}

class _NavBarButtonState extends State<NavBarButton> {
  bool _isHovering = false;
  final bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, top: 16),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovering = true),
        onExit: (_) => setState(() => _isHovering = false),
        child: GestureDetector(
          // Using GestureDetector to handle taps
          onTap: () {
            switch (widget.navBarItem) {
              case NavBarItem.home:
                // navigate to home
                break;
              case NavBarItem.gallery:
              // do something else
              case NavBarItem.customers:
              // do something else
              case NavBarItem.calendar:
              // do something else
              case NavBarItem.help:
              // do something else
              case NavBarItem.logout:
                context.router.push(const LoginRoute());
                break;
            }
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 10), // Adjust as required
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: double.infinity,
                height: 60, // fixed height
                decoration: BoxDecoration(
                  color: _isHovering || _isSelected
                      ? Colors.white
                      : null, // Check both conditions
                  border: Border.all(
                    color: _isHovering || _isSelected
                        ? Colors.white
                        : Colors.transparent, // Check both conditions
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                child: Center(
                  child: Icon(
                    widget.icon,
                    color: _isHovering || _isSelected
                        ? Colors.blueGrey
                        : Colors.white, // Check both conditions
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
