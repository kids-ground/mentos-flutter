
enum LoadingStatus {
  init,
  loading,
  success,
  failure,
  none
}

enum AppStatus {
  init,
  unAuth,
  joined,
}

enum LoginType {
  kakao, apple
}

enum MentorVerifyType {
  notVerify, // 인증전
  mailVerified, // 메일 인증완료
  enterpriseVerified // 회사 인증완료
}

enum JobYear {
  newbie,
  junior,
  middle,
  senior,
  principal
}

enum JobGroup {
  develop("엔지니어"),
  design("디자이너"),
  marketing("마케터"),
  hr("HR");

  const JobGroup(this.korean);
  final String korean;
}
