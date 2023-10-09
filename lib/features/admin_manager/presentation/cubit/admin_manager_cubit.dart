import 'package:bloc/bloc.dart';
import 'package:fotodesk/features/admin_manager/domain/repositories/admin_manager_repository.dart';
import 'package:fotodesk/features/admin_manager/domain/usecases/udpate_api_key.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../widgets/navbar.dart';

part 'admin_manager_state.dart';
part 'admin_manager_cubit.freezed.dart';

class AdminManagerCubit extends Cubit<AdminManagerState> {
  final AdminManagerRepository adminManagerRepository;
  AdminManagerCubit(this.adminManagerRepository)
      : super(AdminManagerState.initial());

  void selectNavBarItem(NavBarItem type) {
    emit(state.copyWith(selectedType: type));
  }

  Future<String> updateApiKey() async {
    final apiKey = await UpdateApiKey(adminManagerRepository).execute();

    return apiKey.fold((failure) {
      throw Exception('Failed to get Api Key');
    }, (apiKey) {
      return apiKey;
    });
  }
}
