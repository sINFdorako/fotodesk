import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fotodesk/core/features/ui/presentation/widgets/custom_button.dart';
import 'package:fotodesk/features/admin_manager/presentation/cubit/admin_manager_cubit.dart';
import 'package:fotodesk/features/admin_manager/presentation/widgets/gallery_content.dart';
import 'package:fotodesk/features/admin_manager/presentation/widgets/navbar_title.dart';
import 'package:fotodesk/features/admin_manager/presentation/widgets/profile_menu.dart';
import 'package:fotodesk/features/authentification/domain/entities/user.dart';
import 'package:fotodesk/features/authentification/presentation/cubit/auth_cubit.dart';
import 'package:fotodesk/features/crm/presentation/widgets/add_new_customer.dart';
import '../../../gallery_administration/presentation/cubit/gallery_admin_cubit.dart';
import 'navbar_button.dart';

enum NavBarItem {
  home,
  gallery,
  landingPage,
  customers,
  calendar,
  help,
  logout,
  chat,
  ecommerce
}

class Navbar extends StatelessWidget {
  final Widget mainContent;

  const Navbar({super.key, required this.mainContent});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _sideNavbar(context),
        Expanded(
          child: Column(
            children: [
              _topNavbar(context),
              Expanded(child: mainContent),
            ],
          ),
        ),
      ],
    );
  }

  Widget _sideNavbar(BuildContext context) {
    List<String> packages = [];
    if (context.read<AdminManagerCubit>().state.setting != null) {
      packages = context.read<AdminManagerCubit>().state.setting!.packages;
    }

    UserRole? userRole;
    bool superadmin = false;

    if (context.read<AuthCubit>().state.user != null) {
      userRole = context.read<AuthCubit>().state.user!.role;
      superadmin = userRole == UserRole.superadmin;
    }

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(16.h),
            topRight: Radius.circular(16.h)),
      ),
      width: 100.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 16.h),
          const Icon(
            Icons.center_focus_strong,
            color: Colors.white,
          ),
          SizedBox(height: 25.h),
          const NavBarButton(
            label: 'Home',
            icon: Icons.home,
            navBarItem: NavBarItem.home,
          ),
          packages.contains('gallery') || superadmin
              ? const NavBarButton(
                  label: 'Gallery',
                  icon: Icons.photo_album,
                  navBarItem: NavBarItem.gallery,
                )
              : Container(),
          packages.contains('gallery') || superadmin
              ? const NavBarButton(
                  label: 'Gallery',
                  icon: Icons.pages,
                  navBarItem: NavBarItem.landingPage)
              : Container(),
          // packages.contains('crm') || superadmin
          //     ? const NavBarButton(
          //         label: 'Chat',
          //         icon: Icons.chat_bubble_outline_rounded,
          //         navBarItem: NavBarItem.chat,
          //       )
          //     : Container(),
          // packages.contains('e-commerce') || superadmin
          //     ? const NavBarButton(
          //         label: 'Ecommerce',
          //         icon: Icons.shop,
          //         navBarItem: NavBarItem.ecommerce,
          //       )
          //     : Container(),
          packages.contains('crm') || superadmin
              ? const NavBarButton(
                  label: 'Customers',
                  icon: Icons.people,
                  navBarItem: NavBarItem.customers,
                )
              : Container(),
          packages.contains('crm') || superadmin
              ? const NavBarButton(
                  label: 'Calendar',
                  icon: Icons.calendar_month,
                  navBarItem: NavBarItem.calendar,
                )
              : Container(),
          SizedBox(height: 25.h),
          const NavBarButton(
            label: 'Logout',
            icon: Icons.logout,
            navBarItem: NavBarItem.logout,
          ),
        ],
      ),
    );
  }

  Widget _topNavbar(BuildContext context) {
    return Container(
        height: 75.h,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onSecondary,
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(16),
                topLeft: Radius.circular(16))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: _getNavbarContent(context)),
            SizedBox(
              width: 25.h,
            ),
            const VerticalDivider(),
            SizedBox(
              width: 25.h,
            ),
            const ProfileMenu(),
          ],
        ));
  }

  Widget _getNavbarContent(BuildContext context) {
    final selected = context.watch<AdminManagerCubit>().state.selectedType;
    final categoriesMarked =
        context.watch<GalleryAdminCubit>().state.selectedCategoriesMarked;
    final categoryClicked =
        context.watch<GalleryAdminCubit>().state.selectedCategoryClicked;
    final imagesMarked =
        context.watch<GalleryAdminCubit>().state.selectedImagesMarked;

    Widget content;
    if (selected == NavBarItem.home) {
      content = _homeContent(context);
    } else if (selected == NavBarItem.gallery) {
      content = GalleryContent()
          .render(categoriesMarked, categoryClicked, imagesMarked, context);
    } else if (selected == NavBarItem.chat) {
      content = _chatContent(context);
    } else if (selected == NavBarItem.ecommerce) {
      content = _eCommerceContent(context);
    } else if (selected == NavBarItem.customers) {
      content = _customersContent(context);
    } else {
      content = _defaultContent(context);
    }

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -1), // Starts from above (outside of view)
            end: const Offset(0, 0), // Ends at its original position
          ).animate(animation),
          child: child,
        );
      },
      child: content,
    );
  }

  Widget _homeContent(BuildContext context) {
    return const Align(
      key: ValueKey('home'),
      alignment: Alignment.centerLeft,
      child: NavbarTitle(title: 'Home Page'),
    );
  }

  Widget _defaultContent(BuildContext context) {
    return const Align(
      key: ValueKey('other'),
      alignment: Alignment.centerLeft,
      child: NavbarTitle(title: 'Something other'),
    );
  }

  Widget _chatContent(BuildContext context) {
    return const Align(
      key: ValueKey('chat'),
      alignment: Alignment.centerLeft,
      child: NavbarTitle(title: 'Fotodesk Chat AI'),
    );
  }

  Widget _eCommerceContent(BuildContext context) {
    return const Align(
      key: ValueKey('ecommerce'),
      alignment: Alignment.centerLeft,
      child: NavbarTitle(title: 'Ecommerce Anbindung'),
    );
  }

  Widget _customersContent(BuildContext context) {
    return Align(
      key: const ValueKey('customers'),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          const NavbarTitle(title: 'Kundenbeziehungsmanagement'),
          const Spacer(),
          CustomButton(
            label: 'Kunde Anlegen',
            onPressed: () async => {await addNewCustomer(context)},
          )
        ],
      ),
    );
  }
}
