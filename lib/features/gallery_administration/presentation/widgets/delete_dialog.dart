import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fotodesk/core/features/ui/presentation/widgets/custom_button.dart';
import 'package:fotodesk/core/features/ui/presentation/widgets/custom_dialog.dart';

class ConfirmDeleteDialog {
  Future<void> dialog(BuildContext context, String contentText,
      VoidCallback deleteFunction) async {
    showDialog(
      context: context,
      builder: (context) {
        return CustomDialog(
          width: 500.w,
          height: 150.w,
          title: const Text('Löschen bestätigen'),
          content: Align(
            alignment: Alignment.centerLeft,
            child: Text(contentText),
          ),
          actions: [
            CustomButton(
              label: 'Abbrechen',
              onPressed: () => Navigator.of(context).pop(),
            ),
            const SizedBox(
              width: 8,
            ),
            CustomButton(
              onPressed: () {
                deleteFunction();
                Navigator.of(context).pop();
              },
              label: 'Löschen',
            ),
          ],
        );
      },
    );
  }
}
