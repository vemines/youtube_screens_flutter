import 'package:get/get.dart';

import '../../../data/models/connected_app_model.dart';
import '../../../data/repositories/connected_app_repository.dart';

class ConnectedAppsController extends GetxController {
  final RxBool isLoading = true.obs;

  RxList<ConnectedAppModel> apps = <ConnectedAppModel>[].obs;
  Future<void> loadPosts() async {
    Future.delayed(const Duration(seconds: 1)).then((_) {
      apps.value = ConnectedAppRepository.mock;
      isLoading.value = false;
    });
  }
}
