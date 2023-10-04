
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
  develop, design, marketing, hr
}

enum LoadingStatus {
  init,
  loading,
  ready,
  failure,
  success,
  cancel,
}