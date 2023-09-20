import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../widgets/navbar.dart';

part 'admin_manager_state.dart';
part 'admin_manager_cubit.freezed.dart';

class AdminManagerCubit extends Cubit<AdminManagerState> {
  AdminManagerCubit() : super(AdminManagerState.initial());

  void selectNavBarItem(NavBarItem type) {
    emit(state.copyWith(selectedType: type));
  }
}
