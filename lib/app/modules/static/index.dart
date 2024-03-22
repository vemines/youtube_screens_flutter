import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class MainDemo extends StatelessWidget {
  const MainDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo clone youtube screens"),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => ListTile(
          title: Text(nav.keys.toList()[index]),
          onTap: () => Get.toNamed(nav.values.toList()[index]),
        ),
        itemCount: nav.length,
      ),
    );
  }
}

Map<String, String> nav = {
  "All Subscriptions": Routes.allSubscriptions,
  "Caption Settings": Routes.captionSettings,
  "Channel": Routes.channel,
  "Channel Membership": Routes.channelMembership,
  "Channel Membership Detail": Routes.channelMembershipDetail,
  "Channel Settings": Routes.channelSettings,
  "Connected Apps": Routes.connectedApps,
  "Download": Routes.download,
  "Experimental Feature": Routes.experimentalFeature,
  "Get Premium": Routes.getPremium,
  "Home": Routes.home,
  "Inactive Membership": Routes.inactiveMembership,
  "Inactive Membership Detail": Routes.inactiveMembershipDetail,
  "Movies": Routes.movies,
  "Playlist": Routes.playlist,
  "Purchases And Membership": Routes.purchasesAndMembership,
  "Rent Movies": Routes.rentMovie,
  "Search": Routes.search,
  "Settings": Routes.settings,
  "SettingDemo": Routes.settingDemo,
  "Time Watched": Routes.timeWatched,
  "Watch Video": Routes.watch,
  "Watch on TV": Routes.watchOnTV,
};
