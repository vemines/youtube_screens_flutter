part of "../home_view.dart";

class BottomNav extends GetView<HomeController> {
  const BottomNav({super.key});

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
