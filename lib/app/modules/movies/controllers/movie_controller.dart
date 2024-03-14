import 'package:get/get.dart';

class MovieController extends GetxController {
  RxList<Object> movies = <Object>[].obs;
  RxBool isLoading = true.obs;
  void loadMovies() {
    Future.delayed(Duration(seconds: 1)).then((value) {
      isLoading.value = false;
    });
  }
}
