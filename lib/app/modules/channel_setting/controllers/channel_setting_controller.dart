import 'package:get/get.dart';

class ChannelSettingController extends GetxController {
  final RxBool isLoading = true.obs;
  final RxBool keepSubsPrivate = false.obs;

  void changeKeepSubPrivate(bool? b) {
    if (b != null) keepSubsPrivate.value = b;
  }

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 1)).then((_) {
      isLoading.value = false;
    });
  }
}
