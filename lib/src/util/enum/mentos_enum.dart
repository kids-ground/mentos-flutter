
enum MentorVerifyType {
  notVerify, // 인증전
  mailVerified, // 메일 인증완료
  enterpriseVerified // 회사 인증완료
}

enum JobGroup {
  develop, design, marketing, hr
}

enum LoadingStatus {
  init,
  loading,
  failure,
  success,
  cancel,
}