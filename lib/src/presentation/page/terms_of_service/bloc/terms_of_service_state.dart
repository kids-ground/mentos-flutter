part of 'terms_of_service_bloc.dart';


class TermsOfServiceState extends Equatable {
  const TermsOfServiceState({
    this.isServiceAgree = true,
    this.isPrivacyAgree = true,
    this.isMarketingAgree = true,
  });

  final bool isServiceAgree;
  final bool isPrivacyAgree;
  final bool isMarketingAgree;

  TermsOfServiceState copyWith({
    bool? isServiceAgree,
    bool? isPrivacyAgree,
    bool? isMarketingAgree,
  }) => TermsOfServiceState(
    isServiceAgree: isServiceAgree ?? this.isServiceAgree,
    isPrivacyAgree: isPrivacyAgree ?? this.isPrivacyAgree,
    isMarketingAgree: isMarketingAgree ?? this.isMarketingAgree
  );

  @override
  List<Object?> get props => [isServiceAgree, isPrivacyAgree, isMarketingAgree];
}