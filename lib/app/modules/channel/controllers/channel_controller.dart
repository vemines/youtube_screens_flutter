import 'package:get/get.dart';

import '../../../data/models/playlist_model.dart';
import '../../../data/models/subscription_model.dart';
import '../../../data/repositories/playlist_repository.dart';
import '../../../data/repositories/subcription_repository.dart';

class ChannelController extends GetxController {
  RxList<PlaylistModel> playlists = <PlaylistModel>[].obs;
  RxList<SubscriptionModel> subscriptions = <SubscriptionModel>[].obs;

  RxInt currentTabIndex = 0.obs;
  void setTabIndex(int index) {
    if (currentTabIndex.value != index) currentTabIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    playlists.value = PlaylistRepository.mock;
    subscriptions.value = SubcriptionRepository.mock;
  }
}
