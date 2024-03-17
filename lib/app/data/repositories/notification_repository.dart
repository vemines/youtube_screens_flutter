import 'package:flutter_lorem/flutter_lorem.dart';

import '../../../gen/assets.gen.dart';
import '../models/notification_model.dart';

class NotificationRepository {
  static List<NotificationModel> mock = [
    NotificationModel(
      iconChannel: Assets.png.coffee.path,
      imageUrl: Assets.jpg.sample.path,
      content: lorem(paragraphs: 1, words: 16),
      action: 'VeMines upload video:',
      createAt: DateTime.now().subtract(const Duration(minutes: 1)),
    ),
    NotificationModel(
      iconChannel: Assets.png.coffee.path,
      imageUrl: Assets.jpg.sample.path,
      content: lorem(paragraphs: 1, words: 16),
      action: 'VeMines create post:',
      createAt: DateTime.now().subtract(const Duration(minutes: 1)),
      isRead: true,
    ),
    NotificationModel(
      iconChannel: Assets.png.coffee.path,
      imageUrl: Assets.jpg.sample.path,
      content: lorem(paragraphs: 1, words: 16),
      action: 'VeMines comments in your video:',
      createAt: DateTime.now().subtract(const Duration(minutes: 1)),
    ),
  ];
}
