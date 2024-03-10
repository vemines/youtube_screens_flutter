import 'package:get/get.dart';

import '../controllers/get_premium_controller.dart';

class GetPremiumBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetPremiumController>(
      () => GetPremiumController(),
    );
  }
}
