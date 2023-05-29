import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

part 'terms_of_service_event.dart';
part 'terms_of_service_state.dart';

class TermsOfServiceBloc extends Bloc<TermsOfServiceEvent, TermsOfServiceState> {
  TermsOfServiceBloc(): super(const TermsOfServiceState()) {
    on<TermsOfServicePressedServiceAgree>(_onPressedServiceAgree);
    on<TermsOfServicePressedPrivacyAgree>(_onPressedPrivacyAgree);
    on<TermsOfServicePressedMarketingAgree>(_onPressedMarketingAgree);
    on<TermsOfServicePressedStart>(_onPressedStart);
  }

  Future<void> _onPressedServiceAgree(
    TermsOfServicePressedServiceAgree event,
    Emitter<TermsOfServiceState> emit
  ) async {
    emit(state.copyWith(isServiceAgree: !state.isServiceAgree));
  }

  Future<void> _onPressedPrivacyAgree(
    TermsOfServicePressedPrivacyAgree event,
    Emitter<TermsOfServiceState> emit
  ) async {
    emit(state.copyWith(isPrivacyAgree: !state.isPrivacyAgree));
  }

  Future<void> _onPressedMarketingAgree(
    TermsOfServicePressedMarketingAgree event,
    Emitter<TermsOfServiceState> emit
  ) async {
    emit(state.copyWith(isMarketingAgree: !state.isMarketingAgree));
  }

  Future<void> _onPressedStart(
    TermsOfServicePressedStart event,
    Emitter<TermsOfServiceState> emit
  ) async {
    // Server API - 동의상태 보내주기 (pending -> complete 상태로)
  }
}