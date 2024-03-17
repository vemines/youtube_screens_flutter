import 'package:flutter_lorem/flutter_lorem.dart';

import '../../../gen/assets.gen.dart';
import '../models/video_model.dart';

class VideoRepository {
  static List<VideoModel> mock = [
    VideoModel(
      iconChannel: Assets.png.coffee.path,
      title: lorem(paragraphs: 1, words: 16),
      thumb: Assets.jpg.sample.path,
      nameChannel: 'VeMines',
      view: 1234,
      time: 900,
      uploadAt: DateTime.now().subtract(const Duration(minutes: 1)),
    ),
    VideoModel(
      iconChannel: Assets.png.coffee.path,
      title: lorem(paragraphs: 1, words: 16),
      thumb: Assets.jpg.sample.path,
      nameChannel: 'VeMines',
      view: 123,
      time: 150,
      uploadAt: DateTime.now().subtract(const Duration(hours: 2)),
    ),
    VideoModel(
      iconChannel: Assets.png.coffee.path,
      title: lorem(paragraphs: 1, words: 16),
      thumb: Assets.jpg.sample.path,
      nameChannel: 'VeMines',
      view: 123456789,
      time: 24800,
      uploadAt: DateTime.now().subtract(const Duration(days: 3)),
    ),
  ];
}
