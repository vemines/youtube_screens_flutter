import 'package:get/get.dart';

import '../../../data/models/playlist_model.dart';
import '../../../data/repositories/playlist_repository.dart';

class PlaylistController extends GetxController {
  final RxBool isLoading = true.obs;

  void loading() {
    isLoading.value = false;
    // Future.delayed(Duration(seconds: 1)).then((_) {
    //   isLoading.value = false;
    // });
    playlists.value = PlaylistRepository.mock;
  }

  RxList<PlaylistModel> playlists = <PlaylistModel>[].obs;
}
