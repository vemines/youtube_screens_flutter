import 'package:get/get.dart';

import '../controllers/channel_setting_controller.dart';

class ChannelSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChannelSettingController>(
      () => ChannelSettingController(),
    );
  }
}
