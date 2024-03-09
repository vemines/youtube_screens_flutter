part of "home_view.dart";

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final HomeController controller = Get.find<HomeController>();
  @override
  void initState() {
    super.initState();
    controller.loadNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.notifications.toList().isEmpty
          ? centerIndicator()
          : NoScrollBarWidget(
              child: Column(
                children: (controller.notifications.toList().map((notification) {
                  return NotificationWidget(
                    notification: notification,
                  );
                }).toList())
                    .separateCenter(),
              ),
            ),
    );
  }
}
