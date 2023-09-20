import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fotodesk/features/admin_manager/presentation/cubit/admin_manager_cubit.dart';
import 'package:fotodesk/features/admin_manager/presentation/widgets/navbar.dart';

class AdminManagerPage extends StatefulWidget {
  const AdminManagerPage({super.key});

  @override
  State<AdminManagerPage> createState() => _AdminManagerPageState();
}

class _AdminManagerPageState extends State<AdminManagerPage> {
  @override
  Widget build(BuildContext context) {
    final selectedType = context.watch<AdminManagerCubit>().state.selectedType;
    ScreenUtil.init(
      context,
      designSize: const Size(1280, 800),
    );

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
        return const Placeholder();
      default:
        return Container();
    }
  }

  Widget _home() {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Text(
            'Welcome to Fotodesk!',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
        ],
      ),
    );
  }
}
