import 'package:timeago/timeago.dart' as timeago;

String timeAgo(DateTime? date) {
  if (date == null) return '';
  timeago.setLocaleMessages('ko', _XLCustomMessages.shared);
  return timeago.format(date, locale: "ko");
}

class _XLCustomMessages implements timeago.LookupMessages {
  static final shared = _XLCustomMessages();
  @override String prefixAgo() => '';
  @override String prefixFromNow() => '';
  @override String suffixAgo() => '';
  @override String suffixFromNow() => '';
  @override String lessThanOneMinute(int seconds) => '방금';
  @override String aboutAMinute(int minutes) => '${minutes}분 전';
  @override String minutes(int minutes) => '${minutes}분 전';
  @override String aboutAnHour(int minutes) => '1시간 전';
  @override String hours(int hours) => '${hours}시간 전';
  @override String aDay(int hours) => '1일 전';
  @override String days(int days) => '${days}일 전';
  @override String aboutAMonth(int days) => '1달 전';
  @override String months(int months) => '${months}달 전';
  @override String aboutAYear(int year) => '1년 전';
  @override String years(int years) => '${years}년 전';
  @override String wordSeparator() => ' ';
}