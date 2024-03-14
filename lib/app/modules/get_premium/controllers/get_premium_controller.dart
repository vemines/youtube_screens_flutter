import 'package:get/get.dart';

class GetPremiumController extends GetxController {
  final RxBool isLoading = true.obs;
  void loading() {
    Future.delayed(Duration(seconds: 1)).then((_) {
      isLoading.value = false;
    });
  }
}
