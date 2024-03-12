import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_screens/app/data/models/notification_model.dart';
import 'package:youtube_screens/app/shared/constants/dimens.dart';
import 'package:youtube_screens/app/shared/widgets/common.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key, required this.notification});
  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return InkWell(
      onTap: () {},
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: Dimensions.normal),
            child: Badge(
              backgroundColor: notification.isRead ? theme.colorScheme.background : theme.primaryColor,
              smallSize: BadgeSize.notification,
            ),
          ),
          gapS(),
          Flexible(
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              titleAlignment: ListTileTitleAlignment.top,
              leading: Image.asset(
                notification.iconChannel,
                width: ImageSize.leadingNotification,
              ),
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
          InkWell(
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
