import 'package:get/get.dart';
import 'package:youtube_screens/app/modules/static/developing.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

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
      name: Routes.subscription,
      page: () => const DevelopingView(),
    ),
    //
    GetPage(
      name: Routes.home,
      page: () => const DevelopingView(),
    ),
    //
    GetPage(
      name: Routes.home,
      page: () => const DevelopingView(),
    ),
    //
    GetPage(
      name: Routes.home,
      page: () => const DevelopingView(),
    ),
    //
    GetPage(
      name: Routes.home,
      page: () => const DevelopingView(),
    ),
    //
    GetPage(
      name: Routes.home,
      page: () => const DevelopingView(),
    ),
    //
    GetPage(
      name: Routes.home,
      page: () => const DevelopingView(),
    ),
    //
    GetPage(
      name: Routes.home,
      page: () => const DevelopingView(),
    ),
    //
    GetPage(
      name: Routes.home,
      page: () => const DevelopingView(),
    ),
    //
    GetPage(
      name: Routes.home,
      page: () => const DevelopingView(),
    ),
    //
    GetPage(
      name: Routes.home,
      page: () => const DevelopingView(),
    ),
    //
    GetPage(
      name: Routes.home,
      page: () => const DevelopingView(),
    ),
    //
    GetPage(
      name: Routes.home,
      page: () => const DevelopingView(),
    ),
    //
    GetPage(
      name: Routes.home,
      page: () => const DevelopingView(),
    ),
    //
    GetPage(
      name: Routes.home,
      page: () => const DevelopingView(),
    ),
    //
    GetPage(
      name: Routes.home,
      page: () => const DevelopingView(),
    ),
    //
    GetPage(
      name: Routes.home,
      page: () => const DevelopingView(),
    ),
    //
    GetPage(
      name: Routes.home,
      page: () => const DevelopingView(),
    ),
    //
    GetPage(
      name: Routes.home,
      page: () => const DevelopingView(),
    ),
    //
  ];
}
