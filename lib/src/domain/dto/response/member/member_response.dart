
class MemberResponse {
  const MemberResponse({
    required this.profile_image,
    required this.profile_thumbnail_image,
    required this.nickname
  });

  final String profile_image;
  final String profile_thumbnail_image;
  final String nickname;
}