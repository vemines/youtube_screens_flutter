import 'package:get/get.dart';

class ChannelSettingController extends GetxController {
  final RxBool isLoading = true.obs;
  final RxBool keepSubPri = false.obs;

  void changeKeepSubPri(bool? b) {
    if (b != null) keepSubPri.value = b;
  }

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 1)).then((_) {
      isLoading.value = false;
    });
  }
}
