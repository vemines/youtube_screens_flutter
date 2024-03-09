import 'package:flutter_lorem/flutter_lorem.dart';
import '../models/comment_model.dart';
import '../../../gen/assets.gen.dart';

class CommentRepository {
  static List<CommentModel> mock = [
    CommentModel(
      iconUser: Assets.png.coffee.path,
      content: lorem(paragraphs: 1, words: 24),
      nameUser: 'VeMines',
      like: 123456,
      dislike: 123,
      uploadAt: DateTime.now().subtract(const Duration(minutes: 1)),
      replies: [
        CommentModel(
          iconUser: Assets.png.coffee.path,
          content: lorem(paragraphs: 2, words: 30),
          nameUser: 'VeMines',
          like: 123456,
          dislike: 123,
          uploadAt: DateTime.now().subtract(const Duration(hours: 2)),
        ),
        CommentModel(
          iconUser: Assets.png.coffee.path,
          content: lorem(paragraphs: 2, words: 30),
          nameUser: 'VeMines',
          like: 123456,
          dislike: 123,
          uploadAt: DateTime.now().subtract(const Duration(hours: 2)),
        ),
      ],
    ),
    CommentModel(
      iconUser: Assets.png.coffee.path,
      content: lorem(paragraphs: 3, words: 35),
      nameUser: 'VeMines',
      like: 123456,
      dislike: 123,
      uploadAt: DateTime.now().subtract(const Duration(days: 3)),
    ),
  ];
}
