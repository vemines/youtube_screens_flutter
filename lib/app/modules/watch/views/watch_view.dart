import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:get/get.dart';
import '../../../shared/constants/dimens.dart';
import '../../../shared/extensions/num_extension.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';

import '../../../shared/widgets/common.dart';
import '../../../shared/widgets/video_widget.dart';
import '../controllers/watch_controller.dart';

class WatchView extends StatefulWidget {
  const WatchView({super.key});

  @override
  State<WatchView> createState() => _WatchViewState();
}

class _WatchViewState extends State<WatchView> {
  final WatchController controller = Get.find<WatchController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NoScrollBarWidget(
          child: Column(
            children: [
              _WatchVideoWidget(),
              _VideoInfoAndActions(),
              _CommentSection(),
              _ReferVideo(),
            ],
          ),
        ),
      ),
    );
  }
}

class _CommentSection extends GetView<WatchController> {
  const _CommentSection();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final ThemeData theme = context.theme;
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (details.primaryDelta! > 5) {
          controller.nextCommentSection();
        } else if (details.primaryDelta! < -5) {
          controller.prevCommentSection();
        }
      },
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: Dimensions.small),
        child: Material(
          type: MaterialType.card,
          elevation: 5,
          color: theme.disabledColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(RadiusBorder.normal),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.normal,
              vertical: Dimensions.small,
            ),
            height: 92,
            child: Obx(() {
              int currentSection = controller.commentSection.value;
              return Column(
                children: [
                  Row(
                    children: [
                      Text(currentSection == 0 ? "Comments" : "Live chat replay", style: textTheme.bodyLarge),
                      Spacer(),
                      Badge(
                        smallSize: 10,
                        backgroundColor: currentSection == 0 ? theme.colorScheme.onPrimary : theme.disabledColor,
                      ),
                      gapS(),
                      Badge(
                        smallSize: 10,
                        backgroundColor: currentSection == 1 ? theme.colorScheme.onPrimary : theme.disabledColor,
                      ),
                    ],
                  ),
                  divider(),
                  gapS(),
                  Text(
                    lorem(paragraphs: 2, words: 50),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: textTheme.bodyMedium,
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _ReferVideo extends GetView<WatchController> {
  const _ReferVideo();

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.refer.length > 0
        ? ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => VideoWidget(video: controller.refer[index]),
            itemCount: controller.refer.length,
          )
        : centerIndicator());
  }
}

class _VideoInfoAndActions extends StatelessWidget {
  const _VideoInfoAndActions();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final ThemeData theme = context.theme;
    return Padding(
      padding: const EdgeInsets.all(Dimensions.small),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {},
            child: Text(
              lorem(paragraphs: 1, words: 30),
              style: textTheme.bodyLarge!.copyWith(fontSize: 19),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          gapS(),
          Text(
            "1.1M view 7h ago Shop lorem isum",
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodySmall,
          ),
          gapN(),
          Row(
            children: [
              Assets.png.coffee.image(width: IconSize.watchVideo),
              gapS(),
              Text(
                "VeMines",
                style: textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
              ),
              gapS(),
              Text("123K", style: textTheme.bodySmall),
              Spacer(),
              FilledButton(
                onPressed: () {},
                child: Text(
                  "Join",
                  style: textTheme.bodyLarge!.copyWith(color: ColorName.black),
                ),
                style: FilledButton.styleFrom(backgroundColor: Colors.white70),
              ),
              gapS(),
              TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.notifications_active,
                      color: theme.disabledColor,
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: theme.disabledColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
          gapN(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                noSplashInkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.disabledColor.withAlpha(0.2.opacityToAlpha()),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(RadiusBorder.normal),
                        bottomLeft: Radius.circular(RadiusBorder.normal),
                      ),
                    ),
                    child: IntrinsicHeight(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: Dimensions.small),
                            child: Icon(Icons.thumb_up_outlined),
                          ),
                          VerticalDivider(
                            color: theme.disabledColor,
                            width: 1,
                            thickness: 2,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: Dimensions.small),
                            child: Text("123k"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
                Text("·"),
                noSplashInkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.disabledColor.withAlpha(0.2.opacityToAlpha()),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(RadiusBorder.normal),
                        bottomRight: Radius.circular(RadiusBorder.normal),
                      ),
                    ),
                    child: IntrinsicHeight(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: Dimensions.small),
                            child: Text("1"),
                          ),
                          VerticalDivider(
                            color: theme.disabledColor,
                            width: 1,
                            thickness: 2,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: Dimensions.small),
                            child: Icon(Icons.thumb_down_alt_outlined),
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
                Padding(
                  padding: const EdgeInsets.only(left: Dimensions.small),
                  child: TextButton.icon(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: theme.disabledColor.withAlpha(0.2.opacityToAlpha()),
                    ),
                    icon: Icon(
                      Icons.add_to_photos_outlined,
                      color: theme.colorScheme.onPrimary,
                    ),
                    label: Text("Save", style: textTheme.labelLarge),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: Dimensions.small),
                  child: TextButton.icon(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: theme.disabledColor.withAlpha(0.2.opacityToAlpha()),
                    ),
                    icon: Icon(
                      Icons.download_outlined,
                      color: theme.colorScheme.onPrimary,
                    ),
                    label: Text("Download", style: textTheme.labelLarge),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _WatchVideoWidget extends StatelessWidget {
  const _WatchVideoWidget();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    return Stack(
      children: [
        Assets.jpg.sample.image(
          color: Colors.black.withOpacity(0.4),
          colorBlendMode: BlendMode.darken,
        ),
        Positioned.fill(
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {},
                  iconSize: IconSize.watchVideo,
                  style: IconButton.styleFrom(backgroundColor: Colors.black45),
                  icon: Icon(Icons.keyboard_double_arrow_left),
                ),
                gapF(3),
                IconButton(
                  onPressed: () {},
                  iconSize: IconSize.watchVideo,
                  style: IconButton.styleFrom(backgroundColor: Colors.black45),
                  icon: Icon(Icons.play_arrow),
                ),
                gapF(3),
                IconButton(
                  onPressed: () {},
                  iconSize: IconSize.watchVideo,
                  style: IconButton.styleFrom(backgroundColor: Colors.black45),
                  icon: Icon(Icons.keyboard_double_arrow_right),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 10,
          left: 10,
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.keyboard_arrow_down_outlined),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 10,
          child: Text.rich(
            TextSpan(
              text: "0:16",
              style: textTheme.bodyMedium,
              children: [
                TextSpan(text: " / 12:34", style: textTheme.bodySmall),
                TextSpan(text: " - Start >", style: textTheme.bodyMedium),
              ],
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.settings_outlined),
              ),
              gapN(),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.closed_caption_outlined),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.fullscreen_outlined),
              ),
              gapN(),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.copy_outlined),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
