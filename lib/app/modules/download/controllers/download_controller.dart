import 'package:get/get.dart';

class DownloadController extends GetxController {
  final RxBool isLoading = true.obs;

  RxList<Object> downloads = <Object>[].obs;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 1)).then((_) {
      isLoading.value = false;
    });
  }
}
