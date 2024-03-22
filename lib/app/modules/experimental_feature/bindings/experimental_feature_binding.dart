import 'package:get/get.dart';

import '../controllers/experimental_feature_controller.dart';

class ExperimentalFeatureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExperimentalFeatureController>(
      () => ExperimentalFeatureController(),
    );
  }
}
