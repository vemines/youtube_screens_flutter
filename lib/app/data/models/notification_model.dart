import '../../shared/extensions/datetime_extension.dart';

class NotificationModel {
  NotificationModel({
    required this.action,
    required this.content,
    required this.imageUrl,
    required this.createAt,
    required this.iconChannel,
    this.isRead = false,
  });
  final String action;
  final String content;
  final String imageUrl;
  final String iconChannel;
  final DateTime createAt;
  final bool isRead;

  String getTimeAgo() => "${createAt.getTimeAgo()}";
  String getTitle() => "$action\n$content";
}
