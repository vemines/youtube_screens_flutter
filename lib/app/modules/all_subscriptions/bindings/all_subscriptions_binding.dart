import 'package:get/get.dart';

import '../controllers/all_subscriptions_controller.dart';

class AllSubscriptionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllSubscriptionsController>(
      () => AllSubscriptionsController(),
    );
  }
}
