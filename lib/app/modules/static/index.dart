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
  "Home": Routes.home,
  "Time Watched": Routes.timeWatched,
  "Get Premium": Routes.getPremium,
  "movies": Routes.movies,
  "Playlist": Routes.playlist,
  "All Subscriptions": Routes.allSubscriptions,
  "Connected Apps": Routes.connectedApps,
  "Search": Routes.search,
  "Download": Routes.download,
  "My Movies": Routes.myMovie,
  "settings": Routes.settings,
  "settingDemo": Routes.settingDemo,
  "My channel": Routes.myChannel,
};
