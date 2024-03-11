import 'package:get/get.dart';

class NameController extends GetxController {
  final RxBool isLoading = true.obs;

  void loading() {
    Future.delayed(Duration(seconds: 2)).then((_) {
      isLoading.value = false;
    });
  }
}
