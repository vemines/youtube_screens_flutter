import 'package:get/get.dart';

import '../controllers/purchase_and_mem_controller.dart';

class PurchaseAndMemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PurchaseAndMemController>(
      () => PurchaseAndMemController(),
    );
  }
}
