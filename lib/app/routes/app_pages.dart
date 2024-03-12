import 'package:get/get.dart';
import 'package:youtube_screens/app/modules/allSubscriptions/views/all_subscriptions_view.dart';
import 'package:youtube_screens/app/modules/get_premium/views/get_premium_view.dart';
import 'package:youtube_screens/app/modules/playlist/bindings/playlist_binding.dart';
import 'package:youtube_screens/app/modules/playlist/views/playlist_view.dart';
import 'package:youtube_screens/app/modules/search/views/search_result_screen.dart';
import 'package:youtube_screens/app/modules/search/views/search_view.dart';
import '../modules/allSubscriptions/bindings/all_subscriptions_binding.dart';
import '../modules/connectedApps/bindings/connected_apps_binding.dart';
import '../modules/connectedApps/views/connected_apps_view.dart';
import '../modules/get_premium/bindings/get_premium_binding.dart';
import '../modules/movies/bindings/movie_binding.dart';
import '../modules/movies/views/movie_view.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/time_watched/bindings/time_watched_binding.dart';
import '../modules/time_watched/views/time_watched_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.search;

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
    //
    GetPage(
      name: Routes.getPremium,
      page: () => const GetPremiumView(),
      binding: GetPremiumBinding(),
    ),
    //
    GetPage(
      name: Routes.playlist,
      page: () => const PlaylistView(),
      binding: PlaylistBinding(),
    ),
    //
    GetPage(
      name: Routes.allSubscriptions,
      page: () => const AllSubscriptionsView(),
      binding: AllSubscriptionsBinding(),
    ),
    //
    GetPage(
      name: Routes.connectedApps,
      page: () => const ConnectedAppsView(),
      binding: ConnectedAppsBinding(),
    ),
    //
    GetPage(
      name: Routes.search,
      page: () => const AppSearchView(),
      binding: AppSearchBinding(),
    ),
    GetPage(
      name: Routes.searchResult,
      page: () => const SearchResultView(),
      binding: AppSearchBinding(),
    ),
  ];
}
