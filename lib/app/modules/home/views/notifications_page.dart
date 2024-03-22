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
                  return _NotificationWidget(
                    notification: notification,
                  );
                }).toList())
                    .separateCenter(),
              ),
            ),
    );
  }
}

class _NotificationWidget extends StatelessWidget {
  const _NotificationWidget({required this.notification});
  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return noSplashInkWell(
      onTap: () {},
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: Dimensions.large),
            child: Badge(
              backgroundColor: notification.isRead ? theme.colorScheme.background : theme.primaryColor,
              smallSize: BadgeSize.notification,
            ),
          ),
          gapS(),
          Padding(
            padding: EdgeInsets.only(top: Dimensions.small),
            child: Image.asset(
              notification.iconChannel,
              width: ImageSize.leadingNotification,
            ),
          ),
          gapS(),
          Flexible(
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              titleAlignment: ListTileTitleAlignment.top,
              title: Text(
                notification.getTitle(),
                maxLines: 3,
                style: context.textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                notification.getTimeAgo(),
                style: context.textTheme.bodySmall,
              ),
            ),
          ),
          gapS(),
          ClipRRect(
            borderRadius: BorderRadius.circular(RadiusBorder.video),
            child: Image.asset(
              notification.imageUrl,
              width: 140,
            ),
          ),
          gapS(),
          noSplashInkWell(
            onTap: () {},
            child: Icon(
              Icons.more_vert_outlined,
            ),
          )
        ],
      ),
    );
  }
}
