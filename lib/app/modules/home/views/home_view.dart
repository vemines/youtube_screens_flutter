import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../data/models/notification_model.dart';
import '../../../data/models/playlist_model.dart';
import '../../../data/models/post_model.dart';
import '../../../data/models/subscription_model.dart';
import '../../../data/models/subscriptions_abs.dart';
import '../../../data/models/video_model.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants/dimens.dart';
import '../../../shared/extensions/num_extension.dart';
import '../../../shared/extensions/widget_extension.dart';
import '../../../shared/widgets/common.dart';
import '../../../shared/widgets/video_widget.dart';
import '../controllers/home_controller.dart';

part 'account_page.dart';
part 'home_page.dart';
part 'notifications_page.dart';
part 'subscriptions_page.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Scaffold(
          appBar: controller.bottomNavIndex.value != 3
              ? AppBar(
                  leadingWidth: 120,
                  leading: Padding(
                    padding: EdgeInsets.fromLTRB(
                      Dimensions.small,
                      Dimensions.small,
                      0,
                      Dimensions.small,
                    ),
                    child: widgetByThemeMode(
                      light: Assets.png.ytLogo.image(),
                      dark: Assets.png.ytLogoDark.image(),
                    ),
                  ),
                  actions: [
                    IconButton(
                      icon: Icon(Icons.videocam_outlined),
                      onPressed: () {},
                      iconSize: IconSize.appbar,
                    ),
                    gapS(),
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {},
                      iconSize: IconSize.appbar,
                    ),
                  ],
                )
              : AppBar(
                  actions: [
                    IconButton(
                      icon: Icon(Icons.notifications_outlined),
                      onPressed: () {},
                      iconSize: IconSize.appbar,
                    ),
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {},
                      iconSize: IconSize.appbar,
                    ),
                    IconButton(
                      icon: Icon(Icons.settings_outlined),
                      onPressed: () {},
                      iconSize: IconSize.appbar,
                    ),
                  ].separateCenter(Dimensions.small),
                ),
          body: <Widget>[
            HomePage(),
            SubscriptionsPage(),
            NotificationsPage(),
            AccountPage(),
          ][controller.bottomNavIndex.value],
          bottomNavigationBar: _BottomNavbar(),
        ),
      ),
    );
  }
}

class _BottomNavbar extends GetView<HomeController> {
  const _BottomNavbar();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Disable animation
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions_outlined),
            activeIcon: Icon(Icons.subscriptions),
            label: 'Subscriptions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            activeIcon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor: ColorName.white,
              radius: 13.0,
            ),
            label: 'You',
          ),
        ],
        currentIndex: controller.bottomNavIndex.value,
        selectedItemColor: Colors.white,
        onTap: controller.setBottomNavIndex,
      ),
    );
  }
}
