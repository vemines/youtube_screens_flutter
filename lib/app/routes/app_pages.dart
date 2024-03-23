import 'package:get/get.dart';
import '../modules/watch/bindings/watch_binding.dart';
import '../modules/watch/views/watch_view.dart';
import '../modules/channel_setting/views/channel_setting_view.dart';
import '../modules/purchase_and_membership/bindings/purchase_and_mem_binding.dart';
import '../modules/purchase_and_membership/views/channel_membership_detail.dart';
import '../modules/purchase_and_membership/views/channel_membership_screen.dart';
import '../modules/purchase_and_membership/views/inactive_membership_detail.dart';
import '../modules/purchase_and_membership/views/purchase_and_mem_view.dart';
import '../modules/settings/views/caption_setting.dart';
import '../modules/experimental_feature/bindings/experimental_feature_binding.dart';
import '../modules/all_subscriptions/views/all_subscriptions_view.dart';
import '../modules/channel_setting/bindings/channel_setting_binding.dart';
import '../modules/download/bindings/download_binding.dart';
import '../modules/download/views/download_view.dart';
import '../modules/get_premium/views/get_premium_view.dart';
import '../modules/playlist/bindings/playlist_binding.dart';
import '../modules/playlist/views/playlist_view.dart';
import '../modules/purchase_and_membership/views/inactive_membership_screen.dart';
import '../modules/search/views/search_result_screen.dart';
import '../modules/search/views/search_view.dart';
import '../modules/settings/views/setting_demo_screen.dart';
import '../modules/settings/views/setting_demo_nav_screen.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/movie/views/movie_view.dart';
import '../modules/all_subscriptions/bindings/all_subscriptions_binding.dart';
import '../modules/connected_apps/bindings/connected_apps_binding.dart';
import '../modules/connected_apps/views/connected_apps_view.dart';
import '../modules/get_premium/bindings/get_premium_binding.dart';
import '../modules/rent_movie/bindings/rent_movie_binding.dart';
import '../modules/rent_movie/views/rent_movie_view.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/channel/bindings/channel_binding.dart';
import '../modules/channel/views/channel_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/watch_on_tv_setting.dart';
import '../modules/static/index.dart';
import '../modules/time_watched/bindings/time_watched_binding.dart';
import '../modules/time_watched/views/time_watched_view.dart';
import '../modules/movie/bindings/movie_binding.dart';
import '../modules/experimental_feature/views/experimental_feature_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.settingDemo;
  // static const INITIAL = "/index";

  static final routes = [
    //
    GetPage(
      name: "/index",
      page: () => const MainDemo(),
    ),
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
      name: Routes.rentMovie,
      page: () => const RentMovieView(),
      binding: RentMovieBinding(),
    ),
    //
    GetPage(
      name: Routes.channel,
      page: () => const ChannelView(),
      binding: ChannelBinding(),
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
    //
    GetPage(
      name: Routes.watchOnTV,
      page: () => const WatchOnTVSetting(),
    ),
    //
    GetPage(
      name: Routes.captionSettings,
      page: () => const CaptionSetting(),
    ),
    //
    GetPage(
      name: Routes.experimentalFeature,
      page: () => const ExperimentalFeatureView(),
      binding: ExperimentalFeatureBinding(),
    ),
    //
    GetPage(
      name: Routes.channelSettings,
      page: () => const ChannelSettingView(),
      binding: ChannelSettingBinding(),
    ),
    //
    GetPage(
      name: Routes.purchasesAndMembership,
      page: () => const PurchaseAndMemView(),
      binding: PurchaseAndMemBinding(),
    ),
    //
    GetPage(
      name: Routes.channelMembership,
      page: () => const ChannelMembershipsView(),
      binding: PurchaseAndMemBinding(),
    ),
    //
    GetPage(
      name: Routes.channelMembershipDetail,
      page: () => ChannelMembershipDetail(),
      binding: PurchaseAndMemBinding(),
    ),
    //
    GetPage(
      name: Routes.inactiveMembership,
      page: () => InactiveMembershipsView(),
      binding: PurchaseAndMemBinding(),
    ),
    //
    GetPage(
      name: Routes.inactiveMembershipDetail,
      page: () => InactiveMembershipsDetail(),
      binding: PurchaseAndMemBinding(),
    ),
    //
    GetPage(
      name: Routes.watch,
      page: () => WatchView(),
      binding: WatchBinding(),
    ),
  ];
}
