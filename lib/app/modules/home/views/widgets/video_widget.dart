import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_screens/app/shared/widgets/common.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    super.key,
    required this.iconChannel,
    required this.title,
    required this.subtitle,
    required this.videoThumb,
  });

  final String iconChannel;
  final String videoThumb;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(videoThumb),
        gapS(),
        ListTile(
          leading: Image.asset(iconChannel),
          title: Text(
            title,
            style: context.textTheme.bodyLarge,
            maxLines: 2,
            overflow: TextOverflow.clip,
          ),
          contentPadding: EdgeInsets.zero,
          subtitle: Text(subtitle, style: context.textTheme.bodyMedium),
          trailing: IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () => Get.bottomSheet(
              ListView(
                children: [],
              ),
            ),
          ),
        )
      ],
    );
  }
}
