import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fotodesk/core/features/ui/presentation/widgets/custom_button.dart';
import 'package:fotodesk/core/features/ui/presentation/widgets/custom_dialog.dart';
import 'package:fotodesk/core/features/ui/presentation/widgets/custom_text_field.dart';
import 'package:fotodesk/features/gallery_administration/domain/entities/category.dart';
import 'package:fotodesk/features/gallery_administration/presentation/cubit/gallery_admin_cubit.dart';

Future<void> addNewCategory(BuildContext context) async {
  final galleryAdminCubit = context.read<GalleryAdminCubit>();
  showDialog(
    context: context,
    builder: (context) {
      TextEditingController controller = TextEditingController();
      return CustomDialog(
        width: 500.w,
        height: 150.w,
        title: const Text('Neue Kategorie erstellen'),
        content: Align(
          alignment: Alignment.centerLeft,
          child: CustomTextField(
            controller: controller,
            hintText: 'Kategoriename eingeben',
            icon: Icons.image_outlined,
          ),
        ),
        actions: [
          CustomButton(
            label: 'Abbrechen',
            onPressed: () async => {Navigator.of(context).pop()},
          ),
          const SizedBox(
            width: 8,
          ),
          CustomButton(
            onPressed: () async {
              if (controller.text.isNotEmpty) {
                await galleryAdminCubit
                    .createCategory(Category(name: controller.text.trim()));
                await galleryAdminCubit.getAllCategories();
                Navigator.of(context).pop();
              }
            },
            label: 'Hinzufügen',
          ),
        ],
      );
    },
  );
}
