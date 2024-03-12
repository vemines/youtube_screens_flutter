import 'package:get/get.dart';

import '../controllers/search_controller.dart';

class AppSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppSearchController>(
      () => AppSearchController(),
    );
  }
}
