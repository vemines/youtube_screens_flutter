import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/video_model.dart';
import '../constants/dimens.dart';
import 'common.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    super.key,
    required this.video,
  });

  final VideoModel video;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            Image.asset(video.thumb),
            Positioned(
              bottom: 10,
              right: 10,
              child: Container(
                color: context.theme.colorScheme.background,
                padding: EdgeInsets.all(Dimensions.small),
                child: Text(
                  video.getTimeStamp(),
                ),
              ),
            ),
          ],
        ),
        gapS(),
        ListTile(
          leading: Image.asset(video.iconChannel),
          title: Text(
            video.title + "\n",
            style: context.textTheme.bodyMedium,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          contentPadding: EdgeInsets.zero,
          subtitle: Text(
            video.getSubTitle() + "\n",
            style: context.textTheme.bodySmall,
            maxLines: 2,
          ),
          trailing: IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () => Get.bottomSheet(SizedBox()),
          ),
        )
      ],
    );
  }
}
