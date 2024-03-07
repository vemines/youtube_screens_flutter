import 'package:get/get.dart';
import 'package:youtube_screens/app/data/models/video_model.dart';
import 'package:youtube_screens/app/data/repositories/video_repository.dart';

class HomeController extends GetxController {
  RxInt bottomNavIndex = 0.obs;
  void setBottomNavIndex(int index) => bottomNavIndex.value = index;

  RxList<VideoModel> homeVideos = <VideoModel>[].obs;

  Future<void> loadHomeVideo() async {
    Future.delayed(const Duration(seconds: 2)).then((_) => homeVideos.value = VideoRepository.mock);
  }
}
