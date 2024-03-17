import 'package:flutter_lorem/flutter_lorem.dart';

import '../../../gen/assets.gen.dart';
import '../models/post_model.dart';
import 'comment_repository.dart';

class PostRepository {
  static List<PostModel> mock = [
    PostModel(
      iconChannel: Assets.png.coffee.path,
      imageUrl: Assets.jpg.sample.path,
      content: lorem(paragraphs: 1, words: 16),
      nameChannel: 'VeMines',
      like: 123456,
      dislike: 123,
      uploadAt: DateTime.now().subtract(const Duration(minutes: 1)),
      comments: [...CommentRepository.mock, ...CommentRepository.mock],
    ),
    PostModel(
      iconChannel: Assets.png.coffee.path,
      imageUrl: Assets.jpg.sample.path,
      content: lorem(paragraphs: 1, words: 16),
      nameChannel: 'VeMines',
      like: 123456,
      dislike: 123,
      uploadAt: DateTime.now().subtract(const Duration(hours: 2)),
      comments: CommentRepository.mock,
    ),
    PostModel(
      iconChannel: Assets.png.coffee.path,
      imageUrl: Assets.jpg.sample.path,
      content: lorem(paragraphs: 1, words: 16),
      nameChannel: 'VeMines',
      like: 123456,
      dislike: 123,
      uploadAt: DateTime.now().subtract(const Duration(days: 3)),
    ),
  ];
}
