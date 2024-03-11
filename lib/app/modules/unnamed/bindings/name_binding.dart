import 'package:get/get.dart';

import '../controllers/name_controller.dart';

class NameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NameController>(
      () => NameController(),
    );
  }
}
