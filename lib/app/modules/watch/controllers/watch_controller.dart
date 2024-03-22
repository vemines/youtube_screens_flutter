import 'package:get/get.dart';

import '../../../data/models/video_model.dart';
import '../../../data/repositories/video_repository.dart';

class WatchController extends GetxController {
  @override
  void onInit() {
    loadReferVideo();
    super.onInit();
  }

  RxList<VideoModel> refer = <VideoModel>[].obs;
  Future<void> loadReferVideo() async {
    Future.delayed(const Duration(seconds: 1)).then((_) => refer.value = VideoRepository.mock);
  }

  RxInt commentSection = 0.obs;
  void nextCommentSection() {
    if (commentSection.value == 0) commentSection.value = 1;
  }

  void prevCommentSection() {
    if (commentSection.value == 1) commentSection.value = 0;
  }
}
