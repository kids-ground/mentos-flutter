part of 'terms_of_service_bloc.dart';


class TermsOfServiceState extends Equatable {
  TermsOfServiceState({
    Map<TermsOfServiceType, bool>? termsAgree
  }) : termsAgree = termsAgree ?? { for (var e in TermsOfServiceType.values) e : true };

  final Map<TermsOfServiceType, bool> termsAgree;

  TermsOfServiceState copyWith({
    Map<TermsOfServiceType, bool>? termsAgree
  }) => TermsOfServiceState(
    termsAgree: termsAgree ?? this.termsAgree,
  );

  bool isAgree(TermsOfServiceType type) => termsAgree[type] ?? false;
  bool get requiredAllAgree => termsAgree.entries
      .where((element) => element.key.isRequired)
      .every((element) => element.value);

  @override
  List<Object?> get props => [termsAgree];
}