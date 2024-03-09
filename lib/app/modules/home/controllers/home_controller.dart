import 'package:get/get.dart';
import 'package:youtube_screens/app/data/models/notification_model.dart';
import 'package:youtube_screens/app/data/models/playlist_model.dart';
import 'package:youtube_screens/app/data/repositories/notification_repository.dart';
import 'package:youtube_screens/app/data/repositories/playlist_repository.dart';
import '../../../data/models/video_model.dart';
import '../../../data/repositories/post_repository.dart';
import '../../../data/repositories/video_repository.dart';

import '../../../data/models/subscription_model.dart';

class HomeController extends GetxController {
  RxInt bottomNavIndex = 3.obs;
  void setBottomNavIndex(int index) => bottomNavIndex.value = index;

  RxList<VideoModel> homeVideos = <VideoModel>[].obs;
  Future<void> loadHomeVideo() async {
    Future.delayed(const Duration(seconds: 2)).then((_) => homeVideos.value = VideoRepository.mock);
  }

  RxList<Subscription> posts = <Subscription>[].obs;
  Future<void> loadPosts() async {
    Future.delayed(const Duration(seconds: 2)).then((_) {
      posts.value = [...PostRepository.mock, ...VideoRepository.mock];
    });
  }

  RxList<NotificationModel> notifications = <NotificationModel>[].obs;
  Future<void> loadNotifications() async {
    Future.delayed(const Duration(seconds: 2)).then((_) {
      notifications.value = NotificationRepository.mock;
    });
  }

  RxList<VideoModel> watchHistory = <VideoModel>[].obs;
  RxList<PlaylistModel> playlists = <PlaylistModel>[].obs;
  RxBool isloadUserData = false.obs;

  Future<void> loadUserData() async {
    Future.delayed(const Duration(seconds: 2)).then((_) {
      watchHistory.value = VideoRepository.mock;
      playlists.value = PlaylistRepository.mock;
      isloadUserData.value = true;
    });
  }
}
