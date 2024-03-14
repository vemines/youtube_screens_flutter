import 'package:get/get.dart';

import '../controllers/my_movie_controller.dart';

class MyMovieBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyMovieController>(
      () => MyMovieController(),
    );
  }
}
