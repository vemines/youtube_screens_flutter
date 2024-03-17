import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../data/models/playlist_model.dart';
import '../../../data/models/subscription_model.dart';
import '../../../data/models/subscriptions_abs.dart';
import 'widgets/notification_widget.dart';
import '../../../shared/extensions/num_extension.dart';
import '../../../data/models/post_model.dart';
import '../../../data/models/video_model.dart';
import '../../../routes/app_pages.dart';
import 'widgets/video_widget.dart';
import '../../../shared/constants/dimens.dart';
import '../../../shared/extensions/widget_extension.dart';
import '../../../shared/widgets/common.dart';
import '../../../../gen/colors.gen.dart';

import '../../../../gen/assets.gen.dart';
import '../controllers/home_controller.dart';
import 'widgets/post_widget.dart';

part 'widgets/bottom_nav.dart';
part 'home_page.dart';
part 'subscriptions_page.dart';
part 'notifications_page.dart';
part 'account_page.dart';

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
          bottomNavigationBar: BottomNav(),
        ),
      ),
    );
  }
}
