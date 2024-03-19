import 'package:get/get.dart';
import '../modules/channelSetting/views/channel_setting_view.dart';
import '../modules/purchaseAndMem/bindings/purchase_and_mem_binding.dart';
import '../modules/purchaseAndMem/views/channel_membership_detail.dart';
import '../modules/purchaseAndMem/views/channel_membership_screen.dart';
import '../modules/purchaseAndMem/views/inactive_membership_detail.dart';
import '../modules/purchaseAndMem/views/purchase_and_mem_view.dart';
import '../modules/settings/views/caption_setting.dart';
import '../modules/tryFeature/bindings/try_feature_binding.dart';
import '../modules/allSubscriptions/views/all_subscriptions_view.dart';
import '../modules/channelSetting/bindings/channel_setting_binding.dart';
import '../modules/download/bindings/download_binding.dart';
import '../modules/download/views/download_view.dart';
import '../modules/get_premium/views/get_premium_view.dart';
import '../modules/playlist/bindings/playlist_binding.dart';
import '../modules/playlist/views/playlist_view.dart';
import '../modules/purchaseAndMem/views/inactive_membership_screen.dart';
import '../modules/search/views/search_result_screen.dart';
import '../modules/search/views/search_view.dart';
import '../modules/settings/views/setting_demo_screen.dart';
import '../modules/settings/views/setting_demo_sub_screen.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/myMovie/views/my_movie_view.dart';
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
import '../modules/settings/views/watch_on_tv_setting.dart';
import '../modules/static/index.dart';
import '../modules/time_watched/bindings/time_watched_binding.dart';
import '../modules/time_watched/views/time_watched_view.dart';
import '../modules/myMovie/bindings/my_movie_binding.dart';
import '../modules/tryFeature/views/try_feature_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.purchasesAndMembership;

  static final routes = [
    //
    GetPage(
      name: "/",
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
    //
    GetPage(
      name: Routes.watchOnTV,
      page: () => const WatchOnTVSetting(),
    ),
    //
    GetPage(
      name: Routes.captionsSettings,
      page: () => const CaptionSetting(),
    ),
    //
    GetPage(
      name: Routes.experimentalFeature,
      page: () => const TryFeatureView(),
      binding: TryFeatureBinding(),
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
  ];
}
