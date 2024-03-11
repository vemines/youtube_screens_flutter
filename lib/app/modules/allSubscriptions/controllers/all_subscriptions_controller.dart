import 'package:get/get.dart';

class AllSubscriptionsController extends GetxController {
  final RxBool isLoading = true.obs;

  void loading() {
    Future.delayed(Duration(seconds: 0)).then((_) {
      isLoading.value = false;
    });
  }
}
