import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatelessWidget {
  final Widget child;
  final List<PopupMenuItem<T>> items;
  final void Function(T) onSelected;

  const CustomDropdown({
    Key? key,
    required this.child,
    required this.items,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return PopupMenuButton<T>(
      itemBuilder: (context) => items.map((item) {
        return PopupMenuItem<T>(
          value: item.value,
          child: Container(
            constraints: const BoxConstraints(
              minWidth: 150, // Minimum width
              maxWidth: 300, // Maximum width
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: theme.colorScheme.onSurface.withOpacity(0.2),
                ),
              ),
            ),
            child: item.child,
          ),
        );
      }).toList(),
      onSelected: onSelected,
      offset: const Offset(0, 55),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
        side: BorderSide(
          color: theme.colorScheme.secondary,
        ),
      ),
      color: theme.colorScheme.surface,
      child: child,
    );
  }
}
