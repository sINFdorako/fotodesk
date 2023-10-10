import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:fotodesk/core/errors/failures.dart';
import 'package:fotodesk/features/admin_manager/domain/repositories/admin_manager_repository.dart';
import 'package:fotodesk/features/admin_manager/domain/usecases/get_setting.dart';
import 'package:fotodesk/features/admin_manager/domain/usecases/udpate_api_key.dart';
import 'package:fotodesk/features/authentification/domain/entities/fotodesk_setting.dart';
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

  Future<void> getFotodeskSettingByUser() async {
    final Either<Failure, FotodeskSetting> setting =
        await GetSettingByUser(adminManagerRepository).execute();

    setting.fold((failure) {
      // handle failure
    }, (setting) async {
      emit(state.copyWith(setting: setting));
    });
  }
}
