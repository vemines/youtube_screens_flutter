import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:youtube_screens/app/data/models/video_model.dart';
import 'package:youtube_screens/app/shared/extension/string_extension.dart';
import 'package:youtube_screens/gen/assets.gen.dart';

class VideoRepository {
  static List<VideoModel> mock = [
    VideoModel(
      iconChannel: Assets.png.coffee.path.prefixAssets(),
      title: lorem(paragraphs: 1, words: 24),
      videoThumb: Assets.jpg.sample.path.prefixAssets(),
      nameChannel: 'VeMines',
      view: 1234,
      uploadAt: DateTime.now().subtract(const Duration(minutes: 1)),
    ),
    VideoModel(
      iconChannel: Assets.png.coffee.path.prefixAssets(),
      title: lorem(paragraphs: 1, words: 24),
      videoThumb: Assets.jpg.sample.path.prefixAssets(),
      nameChannel: 'VeMines',
      view: 123,
      uploadAt: DateTime.now().subtract(const Duration(hours: 2)),
    ),
    VideoModel(
      iconChannel: Assets.png.coffee.path.prefixAssets(),
      title: lorem(paragraphs: 1, words: 24),
      videoThumb: Assets.jpg.sample.path.prefixAssets(),
      nameChannel: 'VeMines',
      view: 123456789,
      uploadAt: DateTime.now().subtract(const Duration(days: 3)),
    ),
  ];
}
