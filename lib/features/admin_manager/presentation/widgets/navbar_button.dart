import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fotodesk/features/admin_manager/presentation/widgets/navbar.dart';

import '../../../../core/router/router.gr.dart';
import '../cubit/admin_manager_cubit.dart';

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
  NavBarButtonState createState() => NavBarButtonState();
}

class NavBarButtonState extends State<NavBarButton> {
  @override
  Widget build(BuildContext context) {
    bool isHovering = false;

    final adminManagerCubit = context.read<AdminManagerCubit>();
    final selectedType = context.watch<AdminManagerCubit>().state.selectedType;

    final isSelected = widget.navBarItem == selectedType;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16, top: 16),
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovering = true),
        onExit: (_) => setState(() => isHovering = false),
        child: GestureDetector(
          onTap: () {
            switch (widget.navBarItem) {
              case NavBarItem.home:
                adminManagerCubit.selectNavBarItem(NavBarItem.home);
                break;
              case NavBarItem.gallery:
                adminManagerCubit.selectNavBarItem(NavBarItem.gallery);
                break;
              case NavBarItem.customers:
                adminManagerCubit.selectNavBarItem(NavBarItem.customers);
                break;
              case NavBarItem.calendar:
                adminManagerCubit.selectNavBarItem(NavBarItem.calendar);
                break;
              case NavBarItem.help:
                adminManagerCubit.selectNavBarItem(NavBarItem.help);
                break;
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
                  color: isHovering || isSelected
                      ? Colors.white
                      : null, // Check both conditions
                  border: Border.all(
                    color: isHovering || isSelected
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
                    color: isHovering || isSelected
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