import '../../shared/extensions/datetime_extension.dart';
import 'video_model.dart';

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
    this.private = true,
  });
  final String iconChannel;
  final String nameChannel;
  final String namePlaylist;
  final String thumb;
  final String type;
  final List<VideoModel> videos;
  final DateTime uploadAt;
  final bool watchLater;
  final bool private;

  String getPlaylistLength() => videos.length.toString();
  String getLastestUpdate() => "Updated ${uploadAt.getTimeAgo()}";
  String getStatus() => private ? "🔒 Private" : "🌎 Public";
  String getStatusMyChannel() => private ? "Private - Playlist" : "Public - Playlist";
}
