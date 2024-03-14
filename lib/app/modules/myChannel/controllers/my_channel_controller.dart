import 'package:get/get.dart';

import '../../../data/models/playlist_model.dart';
import '../../../data/models/subscription_model.dart';
import '../../../data/repositories/playlist_repository.dart';
import '../../../data/repositories/subcription_repository.dart';

class MyChannelController extends GetxController {
  RxList<PlaylistModel> playlists = <PlaylistModel>[].obs;
  RxList<SubscriptionModel> subscriptions = <SubscriptionModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    playlists.value = PlaylistRepository.mock;
    subscriptions.value = SubcriptionRepository.mock;
  }
}
