part of 'terms_of_service_bloc.dart';


enum TermsOfServiceType {
  service('[필수] 서비스 이용약관 동의','https://rokwon.notion.site/c213c40b26e4410da8d71621528a43a0','이용약관', true),
  privacy('[필수] 개인정보 수집 및 이용 동의','https://rokwon.notion.site/954826331e824ef1bd8f19b8c563f99b','개인정보 처리방침', true),
  marketing('[선택] 마케팅 SNS 알림 동의','https://rokwon.notion.site/1a3bb5b56b804293b256b056e7514bcc','마케팅 수신 동의', false);

  const TermsOfServiceType(this.title, this.webLink, this.webLinkTitle, this.isRequired);
  final String title;
  final String webLink;
  final String webLinkTitle;
  final bool isRequired;
}

abstract class TermsOfServiceEvent extends Equatable {
  const TermsOfServiceEvent();

  @override
  List<Object?> get props => [];
}

class TermsOfServicePressedAgree extends TermsOfServiceEvent {
  const TermsOfServicePressedAgree({
    required this.type
  });

  final TermsOfServiceType type;
}

class TermsOfServicePressedStart extends TermsOfServiceEvent {
  const TermsOfServicePressedStart();
}