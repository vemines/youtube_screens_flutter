import 'package:get/get.dart';

import '../controllers/your_movie_controller.dart';

class YourMovieBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<YourMovieController>(
      () => YourMovieController(),
    );
  }
}
