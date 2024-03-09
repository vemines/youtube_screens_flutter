import 'package:get/get.dart';
import '../modules/static/developing.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/time_watched/bindings/time_watched_binding.dart';
import '../modules/time_watched/views/time_watched_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.home;

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
  ];
}
