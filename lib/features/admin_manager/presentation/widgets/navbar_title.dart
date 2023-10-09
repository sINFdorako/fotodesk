import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fotodesk/features/gallery_administration/domain/entities/category.dart';
import 'package:fotodesk/features/gallery_administration/presentation/cubit/gallery_admin_cubit.dart';

class NavbarTitle extends StatelessWidget {
  final String title;
  final Category? categoryClicked;
  const NavbarTitle({super.key, required this.title, this.categoryClicked});

  @override
  Widget build(BuildContext context) {
    final galleryCubit = context.read<GalleryAdminCubit>();
    return Container(
      margin: EdgeInsets.only(left: 20.w),
      child: categoryClicked != null
          ? Row(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () => {
                        galleryCubit.deSetCategoryAsClicked(categoryClicked!),
                        galleryCubit.unmarkAllImages()
                      },
                      child: Row(
                        children: [
                          SizedBox(width: 10.w),
                          Icon(Icons.chevron_left,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onBackground
                                  .withOpacity(.75)),
                          SizedBox(width: 10.w),
                          Text(
                            title,
                            key: key,
                            style: TextStyle(
                              fontSize: 15.h,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onBackground
                                  .withOpacity(.75),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      ' / ${categoryClicked!.name}',
                      style: TextStyle(
                        fontSize: 15.h,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context)
                            .colorScheme
                            .onBackground
                            .withOpacity(.75),
                      ),
                    ),
                  ],
                ),
                // Breadcrumb
              ],
            )
          : Row(
              children: [
                SizedBox(width: 10.w),
                Icon(Icons.chevron_left,
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(.2)),
                SizedBox(width: 10.w),
                Text(
                  title,
                  key: key,
                  style: TextStyle(
                    fontSize: 15.h,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(.75),
                  ),
                ),
              ],
            ),
    );
  }
}
