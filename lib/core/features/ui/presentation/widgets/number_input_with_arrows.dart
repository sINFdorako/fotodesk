import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fotodesk/core/features/ui/presentation/widgets/global_font_size.dart';

class NumberInputWithArrows extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData iconData;
  final bool allowDecimal;

  const NumberInputWithArrows({
    Key? key,
    required this.controller,
    this.hintText = '',
    this.allowDecimal = false,
    required this.iconData,
  }) : super(key: key);

  @override
  NumberInputWithArrowsState createState() => NumberInputWithArrowsState();
}

class NumberInputWithArrowsState extends State<NumberInputWithArrows> {
  int get _currentValue => int.tryParse(widget.controller.text) ?? 0;

  void _increment() {
    setState(() {
      widget.controller.text = (_currentValue + 1).toString();
    });
  }

  void _decrement() {
    setState(() {
      if (_currentValue > 0) {
        widget.controller.text = (_currentValue - 1).toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 200, maxWidth: 500),
      child: TextField(
        controller: widget.controller,
        keyboardType: TextInputType.number,
        inputFormatters: widget.allowDecimal
            ? <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'^\d*[\.,]?\d*')),
              ]
            : <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: 13.w, horizontal: 10.w),
          hintStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: FontUtil.hint,
            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
          ),
          prefixIcon: Icon(
            widget.iconData,
            color: Theme.of(context).colorScheme.primary,
          ),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_upward,
                    color: Theme.of(context).colorScheme.primary),
                onPressed: _increment,
              ),
              IconButton(
                icon: Icon(Icons.arrow_downward,
                    color: Theme.of(context).colorScheme.primary),
                onPressed: _decrement,
              ),
            ],
          ),
          hintText: widget.hintText,
          filled: true,
          fillColor: Theme.of(context).colorScheme.surface,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 2.w,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.25),
            ),
          ),
        ),
      ),
    );
  }
}
