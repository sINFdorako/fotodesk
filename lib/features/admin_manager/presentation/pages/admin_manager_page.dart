import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fotodesk/features/admin_manager/presentation/cubit/admin_manager_cubit.dart';
import 'package:fotodesk/features/admin_manager/presentation/widgets/navbar.dart';
import 'package:fotodesk/features/ecommerce/presentation/ecommerce_page.dart';
import 'package:fotodesk/features/gallery_administration/presentation/pages/gallery_administration_page.dart';
import 'package:fotodesk/features/generative_chat/presentation/pages/generative_chat.dart';

class AdminManagerPage extends StatefulWidget {
  const AdminManagerPage({super.key});

  @override
  State<AdminManagerPage> createState() => _AdminManagerPageState();
}

class _AdminManagerPageState extends State<AdminManagerPage> {
  @override
  Widget build(BuildContext context) {
    final selectedType = context.watch<AdminManagerCubit>().state.selectedType;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Navbar(
        mainContent: _getSelectedContent(selectedType),
      ),
    );
  }

  Widget _getSelectedContent(NavBarItem selectedType) {
    switch (selectedType) {
      case NavBarItem.home:
        return _home();
      case NavBarItem.gallery:
        return const GalleryAdministrationPage();
      case NavBarItem.chat:
        return const GenerativeChat();
      case NavBarItem.ecommerce:
        return const EcommercePage();
      default:
        return Container();
    }
  }

  Widget _home() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welcome to Fotodesk!',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onBackground.withOpacity(.7),
            ),
          ),
        ],
      ),
    );
  }
}
