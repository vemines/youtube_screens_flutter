import '../../shared/extensions/datetime_extension.dart';
import '../../shared/extensions/num_extension.dart';
import '../../shared/utils/formatters/viewed.dart';
import 'subscriptions_abs.dart';

class VideoModel extends Subscriptions {
  VideoModel({
    required this.iconChannel,
    required this.title,
    required this.thumb,
    required this.nameChannel,
    required this.view,
    required this.uploadAt,
    required this.time,
  });
  final String iconChannel;
  final String nameChannel;
  final String thumb;
  final String title;
  final int view;
  final int time;
  final DateTime uploadAt;

  String getSubTitle({bool breakLine = false}) =>
      "$nameChannel ${breakLine ? '\n' : '- '}${NumberFormatter.format(view)} views  ${uploadAt.getTimeAgo()}";
  String getTimeStamp() => time.formatTime();
}
