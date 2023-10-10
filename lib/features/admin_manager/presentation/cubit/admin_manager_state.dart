part of 'admin_manager_cubit.dart';

@freezed
class AdminManagerState with _$AdminManagerState {
  const factory AdminManagerState(
      {required NavBarItem selectedType,
      required FotodeskSetting? setting}) = _AdminManagerState;
  factory AdminManagerState.initial() {
    return const AdminManagerState(
        selectedType: NavBarItem.home, setting: null);
  }
}
