import 'package:timeago/timeago.dart' as timeago;

extension TimeAgo on DateTime {
  String getTimeAgo() => timeago.format(this);
}
