part of 'terms_of_service_bloc.dart';

abstract class TermsOfServiceEvent extends Equatable {
  const TermsOfServiceEvent();

  @override
  List<Object?> get props => [];
}

class TermsOfServicePressedServiceAgree extends TermsOfServiceEvent {
  const TermsOfServicePressedServiceAgree();
}

class TermsOfServicePressedPrivacyAgree extends TermsOfServiceEvent {
  const TermsOfServicePressedPrivacyAgree();
}

class TermsOfServicePressedMarketingAgree extends TermsOfServiceEvent {
  const TermsOfServicePressedMarketingAgree();
}

class TermsOfServicePressedStart extends TermsOfServiceEvent {
  const TermsOfServicePressedStart();
}