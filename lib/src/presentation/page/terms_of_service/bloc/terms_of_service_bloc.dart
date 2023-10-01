import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

part 'terms_of_service_event.dart';
part 'terms_of_service_state.dart';

class TermsOfServiceBloc extends Bloc<TermsOfServiceEvent, TermsOfServiceState> {
  TermsOfServiceBloc(): super(TermsOfServiceState()) {
    on<TermsOfServicePressedAgree>(_onPressedAgree);
    on<TermsOfServicePressedStart>(_onPressedStart);
  }

  Future<void> _onPressedAgree(
    TermsOfServicePressedAgree event,
    Emitter<TermsOfServiceState> emit
  ) async {
    Map<TermsOfServiceType, bool> newTermsAgree = Map.of(state.termsAgree);
    newTermsAgree[event.type] = !(newTermsAgree[event.type] ?? false);
    emit(TermsOfServiceState(termsAgree: newTermsAgree));
  }

  Future<void> _onPressedStart(
    TermsOfServicePressedStart event,
    Emitter<TermsOfServiceState> emit
  ) async {
    // Server API - 동의상태 보내주기 (pending -> complete 상태로)
  }
}