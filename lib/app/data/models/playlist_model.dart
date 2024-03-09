import 'package:youtube_screens/app/data/models/video_model.dart';

class PlaylistModel {
  PlaylistModel({
    required this.iconChannel,
    required this.type,
    required this.thumb,
    required this.nameChannel,
    required this.namePlaylist,
    required this.uploadAt,
    required this.videos,
    this.watchLater = false,
  });
  final String iconChannel;
  final String nameChannel;
  final String namePlaylist;
  final String thumb;
  final String type;
  final List<VideoModel> videos;
  final DateTime uploadAt;
  final bool watchLater;

  String getPlaylistLength() => videos.length.toString();
}
