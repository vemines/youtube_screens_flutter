import 'package:get/get.dart';

class RentMovieController extends GetxController {
  RxList<Object> RentMovies = <Object>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 1)).then((value) {
      isLoading.value = false;
    });
  }
}
