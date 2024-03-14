import 'package:get/get.dart';
import 'package:youtube_screens/app/modules/allSubscriptions/views/all_subscriptions_view.dart';
import 'package:youtube_screens/app/modules/download/bindings/download_binding.dart';
import 'package:youtube_screens/app/modules/download/views/download_view.dart';
import 'package:youtube_screens/app/modules/get_premium/views/get_premium_view.dart';
import 'package:youtube_screens/app/modules/playlist/bindings/playlist_binding.dart';
import 'package:youtube_screens/app/modules/playlist/views/playlist_view.dart';
import 'package:youtube_screens/app/modules/search/views/search_result_screen.dart';
import 'package:youtube_screens/app/modules/search/views/search_view.dart';
import 'package:youtube_screens/app/modules/settings/views/setting_demo_screen.dart';
import 'package:youtube_screens/app/modules/settings/views/setting_demo_sub_screen.dart';
import 'package:youtube_screens/app/modules/settings/views/settings_view.dart';
import 'package:youtube_screens/app/modules/myMovie/views/my_movie_view.dart';
import '../modules/allSubscriptions/bindings/all_subscriptions_binding.dart';
import '../modules/connectedApps/bindings/connected_apps_binding.dart';
import '../modules/connectedApps/views/connected_apps_view.dart';
import '../modules/get_premium/bindings/get_premium_binding.dart';
import '../modules/movies/bindings/movie_binding.dart';
import '../modules/movies/views/movie_view.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/myChannel/bindings/my_channel_binding.dart';
import '../modules/myChannel/views/my_channel_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/time_watched/bindings/time_watched_binding.dart';
import '../modules/time_watched/views/time_watched_view.dart';
import '../modules/myMovie/bindings/my_movie_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.settings;

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
    //
    GetPage(
      name: Routes.searchResult,
      page: () => const SearchResultView(),
      binding: AppSearchBinding(),
    ),
    //
    GetPage(
      name: Routes.download,
      page: () => const DownloadView(),
      binding: DownloadBinding(),
    ),
    //
    GetPage(
      name: Routes.myMovie,
      page: () => const MyMovieView(),
      binding: MyMovieBinding(),
    ),
    //
    GetPage(
      name: Routes.myChannel,
      page: () => const MyChannelView(),
      binding: MyChannelBinding(),
    ),
    //
    GetPage(
      name: Routes.settings,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    //
    GetPage(
      name: Routes.settingDemo,
      page: () => const SettingDemoView(),
      binding: SettingsBinding(),
    ),
    //
    GetPage(
      name: Routes.settingDemo2,
      binding: SettingsBinding(),
      page: () => const SettingDemoSubRouteView(),
    ),
  ];
}
