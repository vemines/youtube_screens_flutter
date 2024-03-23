import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../gen/colors.gen.dart';
import '../../routes/app_pages.dart';

class BottomNavibarNoSelected extends StatelessWidget {
  const BottomNavibarNoSelected({super.key, this.selected});

  final int? selected;

  Widget activeFirstIcon() => selected == 0 ? Icon(Icons.home) : Icon(Icons.home_outlined);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed, // Disable animation
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: activeFirstIcon(),
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
      onTap: (value) {
        Get.toNamed(Routes.home, arguments: {"bottomNavIndex": value});
      },
    );
  }
}
