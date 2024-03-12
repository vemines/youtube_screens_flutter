import '../../shared/extensions/datetime_extension.dart';

import 'comment_model.dart';
import 'subscriptions_abs.dart';

class PostModel extends Subscriptions {
  PostModel({
    required this.iconChannel,
    required this.content,
    required this.imageUrl,
    required this.nameChannel,
    required this.like,
    required this.dislike,
    required this.uploadAt,
    this.comments = const <CommentModel>[],
  });
  final String iconChannel;
  final String nameChannel;
  final String imageUrl;
  final String content;
  final int like;
  final int dislike;
  final DateTime uploadAt;
  final List<CommentModel> comments;

  String getTimeAgo() => "${uploadAt.getTimeAgo()}";
  int getTotalComments() {
    int result = 0;
    for (var comment in comments) {
      result += comment.replies.length + 1;
    }
    return result;
  }
}
