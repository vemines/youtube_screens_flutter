import 'package:get/get.dart';

import '../controllers/try_feature_controller.dart';

class TryFeatureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TryFeatureController>(
      () => TryFeatureController(),
    );
  }
}
