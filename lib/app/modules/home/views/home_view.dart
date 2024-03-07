import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:youtube_screens/app/modules/home/views/widgets/video_widget.dart';
import 'package:youtube_screens/app/shared/constants/dimens.dart';
import 'package:youtube_screens/app/shared/extension/string_extension.dart';
import 'package:youtube_screens/app/shared/extension/widget_extension.dart';
import 'package:youtube_screens/app/shared/widgets/common.dart';
import 'package:youtube_screens/gen/colors.gen.dart';

import '../../../../gen/assets.gen.dart';
import '../controllers/home_controller.dart';

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
          appBar: AppBar(
            leading: Padding(
              padding: EdgeInsets.fromLTRB(
                Dimensions.small,
                Dimensions.small,
                0,
                Dimensions.small,
              ),
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Image.asset(
                  Assets.png.icon.path.prefixAssets(),
                ),
              ),
            ),
            title: Text(
              'Premium',
              style: context.textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w800),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.videocam_outlined),
                onPressed: () {},
                iconSize: IconSize.appbar,
              ),
              gapN(),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
                iconSize: IconSize.appbar,
              ),
            ],
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
