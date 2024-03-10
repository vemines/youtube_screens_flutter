import 'package:get/get.dart';
import 'package:youtube_screens/app/modules/get_premium/views/get_premium_view.dart';
import '../modules/get_premium/bindings/get_premium_binding.dart';
import '../modules/movies/bindings/movie_binding.dart';
import '../modules/movies/views/movie_view.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/time_watched/bindings/time_watched_binding.dart';
import '../modules/time_watched/views/time_watched_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.getPremium;

  static final routes = [
    //
    GetPage(
      name: Routes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    //
    GetPage(
      name: Routes.timeWatched,
      page: () => const TimeWatchedView(),
      binding: TimeWatchedBinding(),
    ),
    //
    GetPage(
      name: Routes.movies,
      page: () => const MovieView(),
      binding: MovieBinding(),
    ),
    GetPage(
      name: Routes.getPremium,
      page: () => const GetPremiumView(),
      binding: GetPremiumBinding(),
    ),
  ];
}
