import 'package:youtube_screens/app/shared/utils/formatters/viewed.dart';
import 'package:timeago/timeago.dart' as timeago;

class VideoModel {
  VideoModel({
    required this.iconChannel,
    required this.title,
    required this.videoThumb,
    required this.nameChannel,
    required this.view,
    required this.uploadAt,
  });
  final String iconChannel;
  final String nameChannel;
  final String videoThumb;
  final String title;
  final int view;
  final DateTime uploadAt;

  String getSubTitle() => "$nameChannel - ${NumberFormatter.format(view)} views  ${timeago.format(uploadAt)}";
}
