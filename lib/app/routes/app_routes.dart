part of 'app_pages.dart';

abstract class Routes {
  static const home = '/home';
  static const timeWatched = '/time-watched';
  static const getPremium = '/get-premium';
  static const movies = '/movies';
  static const playlist = '/playlist';
  static const allSubscriptions = '/all-subscriptions';
  static const connectedApps = '/connected-apps';
  static const search = '/search';
  static const searchResult = '/search/:query';
  static const download = '/download';
  static const myMovie = '/your-movie';
  static const settings = '/settings';
  static const settingDemo = '/settings/demo';
  static const settingDemo2 = '/settings/demo2';
  static const myChannel = '/my-channel';
  static const watchOnTV = '/watch-on-tv';
  static const captionsSettings = '/setings/captions';
  static const experimentalFeature = '/setings/experimental-feature';
  static const channelSettings = '/my-channel/settings';
  static const purchasesAndMembership = '/purchases-and-membership';
  static const channelMembership = '/purchases-and-membership/channel';
  static const channelMembershipDetail = '/purchases-and-membership/channel/detail';
  static const inactiveMembership = '/purchases-and-membership/inactive';
  static const inactiveMembershipDetail = '/purchases-and-membership/inactive/detail';
  static const sponsorBlock = '/setings/sponsor-block';
}
