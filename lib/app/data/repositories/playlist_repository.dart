import 'package:youtube_screens/app/data/repositories/video_repository.dart';

import '../../../gen/assets.gen.dart';

import '../models/playlist_model.dart';

class PlaylistRepository {
  static List<PlaylistModel> mock = [
    PlaylistModel(
      iconChannel: Assets.png.coffee.path,
      thumb: Assets.jpg.sample.path,
      nameChannel: 'VeMines',
      type: "Private",
      videos: VideoRepository.mock,
      namePlaylist: "Watch Later",
      watchLater: true,
      uploadAt: DateTime.now().subtract(const Duration(minutes: 1)),
    ),
    PlaylistModel(
      iconChannel: Assets.png.coffee.path,
      thumb: Assets.jpg.sample.path,
      nameChannel: 'VeMines',
      type: "Public",
      videos: VideoRepository.mock,
      namePlaylist: "VeMines All",
      uploadAt: DateTime.now().subtract(const Duration(hours: 1)),
    ),
    PlaylistModel(
      iconChannel: Assets.png.coffee.path,
      thumb: Assets.jpg.sample.path,
      nameChannel: 'VeMines Channel',
      type: "Channel",
      videos: VideoRepository.mock,
      namePlaylist: "Playlist name 123",
      uploadAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
  ];
}
