import 'package:get/get.dart';

import '../controllers/time_watched_controller.dart';

class TimeWatchedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TimeWatchedController>(
      () => TimeWatchedController(),
    );
  }
}
