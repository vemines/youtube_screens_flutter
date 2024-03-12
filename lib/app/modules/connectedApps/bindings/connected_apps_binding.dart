import 'package:get/get.dart';

import '../controllers/connected_apps_controller.dart';

class ConnectedAppsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConnectedAppsController>(
      () => ConnectedAppsController(),
    );
  }
}
