import 'package:get/get.dart';

import '../controllers/rent_movie_controller.dart';

class RentMovieBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RentMovieController>(
      () => RentMovieController(),
    );
  }
}
