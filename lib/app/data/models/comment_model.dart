import '../../shared/extensions/datetime_extension.dart';

class CommentModel {
  CommentModel({
    required this.iconUser,
    required this.content,
    required this.nameUser,
    required this.like,
    required this.dislike,
    required this.uploadAt,
    this.replies = const <CommentModel>[],
  });
  final String iconUser;
  final String nameUser;
  final String content;
  final int like;
  final int dislike;
  final DateTime uploadAt;
  final List<CommentModel> replies;

  String getTimeAgo() => "@$nameUser - ${uploadAt.getTimeAgo()}";
}
