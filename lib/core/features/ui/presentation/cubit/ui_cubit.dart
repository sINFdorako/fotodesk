import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ui_state.dart';
part 'ui_cubit.freezed.dart';

class UiCubit extends Cubit<UiState> {
  UiCubit() : super(UiState.initial());

  updateCountryCodeLandLine(int countryCode) {
    emit(state.copyWith(countryCodeLandline: countryCode));
  }

  updateCountryCodeMobilePhone(int countryCode) {
    emit(state.copyWith(countryCodeMobilePhone: countryCode));
  }
}
