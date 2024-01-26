part of 'ui_cubit.dart';

@freezed
class UiState with _$UiState {
  const factory UiState(
      {required int countryCodeLandline,
      required int countryCodeMobilePhone}) = _UiState;
  factory UiState.initial() {
    return const UiState(countryCodeLandline: 0, countryCodeMobilePhone: 0);
  }
}
