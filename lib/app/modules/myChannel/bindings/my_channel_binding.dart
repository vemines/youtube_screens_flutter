import 'package:get/get.dart';

import '../controllers/my_channel_controller.dart';

class MyChannelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyChannelController>(
      () => MyChannelController(),
    );
  }
}
