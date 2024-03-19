import 'package:get/get.dart';

class NameController extends GetxController {
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 1)).then((_) {
      isLoading.value = false;
    });
  }
}
