import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_screens/app/data/models/playlist_model.dart';
import 'package:youtube_screens/app/data/models/video_model.dart';
import 'package:youtube_screens/app/shared/constants/dimens.dart';
import 'package:youtube_screens/app/shared/widgets/common.dart';
import 'package:youtube_screens/gen/assets.gen.dart';
import 'package:youtube_screens/gen/colors.gen.dart';
import '../../../shared/extensions/widget_extension.dart';
import '../controllers/playlist_controller.dart';

class PlaylistView extends StatefulWidget {
  const PlaylistView({super.key});

  @override
  State<PlaylistView> createState() => _PlaylistViewState();
}

class _PlaylistViewState extends State<PlaylistView> {
  final PlaylistController controller = Get.find<PlaylistController>();

  @override
  void initState() {
    super.initState();
    controller.loading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ].separateCenter(),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? centerIndicator()
            : NoScrollBarWidget(
                child: Column(
                  children: [
                    _PlaylistDetail(controller.playlists.first),
                    gapN(),
                    _PlaylistVideo(controller.playlists.first.videos),
                    gapN(),
                  ],
                ),
              ),
      ),
    );
  }
}

class _PlaylistDetail extends StatelessWidget {
  const _PlaylistDetail(this.playlist);
  final PlaylistModel playlist;

  Widget iconButton({
    required TextTheme textTheme,
    required IconData icon,
    required String title,
    required Color labelColor,
    required Color backgroundColor,
  }) {
    return Expanded(
      child: ElevatedButton.icon(
        onPressed: () {},
        style: FilledButton.styleFrom(
          backgroundColor: backgroundColor,
        ),
        icon: Icon(
          icon,
          color: labelColor,
        ),
        label: Text(
          title,
          style: textTheme.labelLarge!.copyWith(
            color: labelColor,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final transparentBG = ColorName.white.withOpacity(0.15);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Assets.jpg.sample.image().image,
          fit: BoxFit.fitHeight,
        ),
      ),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 50.0),
          child: Padding(
            padding: EdgeInsets.all(Dimensions.normal),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: Dimensions.normal),
                  child: Assets.jpg.sample.image(),
                ),
                Text(playlist.namePlaylist, style: textTheme.headlineSmall),
                gapS(),
                ListTile(
                  title: Text(
                    playlist.nameChannel,
                    style: textTheme.titleMedium!.copyWith(
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text(
                    "${playlist.getPlaylistLength()} videos  ${playlist.getStatus()}",
                    style: textTheme.bodyLarge!.copyWith(
                      color: ColorName.darkSubtext,
                    ),
                  ),
                  contentPadding: EdgeInsets.zero,
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {},
                        style: IconButton.styleFrom(backgroundColor: transparentBG),
                        color: transparentBG,
                        icon: Icon(
                          Icons.edit_outlined,
                          color: ColorName.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        style: IconButton.styleFrom(backgroundColor: transparentBG),
                        color: transparentBG,
                        icon: Icon(
                          Icons.download_outlined,
                          color: ColorName.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        style: IconButton.styleFrom(backgroundColor: transparentBG),
                        icon: Transform.flip(
                          flipY: true,
                          child: RotatedBox(
                            quarterTurns: 2,
                            child: Icon(
                              Icons.reply_outlined,
                              color: ColorName.white,
                            ),
                          ),
                        ),
                      ),
                    ].separateCenter(Dimensions.small),
                  ),
                ),
                gapN(),
                Row(
                  children: [
                    iconButton(
                      textTheme: textTheme,
                      labelColor: ColorName.black,
                      icon: Icons.play_arrow,
                      title: "Play all",
                      backgroundColor: ColorName.white,
                    ),
                    gapN(),
                    iconButton(
                      textTheme: textTheme,
                      labelColor: ColorName.white,
                      icon: Icons.shuffle,
                      title: "Shuffle",
                      backgroundColor: transparentBG,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PlaylistVideo extends StatelessWidget {
  const _PlaylistVideo(this.videos);
  final List<VideoModel> videos;

  Widget videoListTile(BuildContext context, VideoModel video) {
    final TextTheme textTheme = context.textTheme;
    return Row(
      children: [
        InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.only(right: Dimensions.small),
            child: Text("=", style: textTheme.headlineLarge),
          ),
        ),
        Flexible(
          flex: 2,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(RadiusBorder.video),
            child: Image.asset(video.thumb),
          ),
        ),
        gapN(),
        Flexible(
          flex: 3,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      video.title,
                      style: textTheme.titleSmall,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      video.getSubTitle(breakLine: true),
                      style: textTheme.bodySmall,
                    )
                  ],
                ),
              ),
              gapN(),
              InkWell(
                onTap: () {},
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 4,
                    top: Dimensions.small,
                  ),
                  child: Icon(Icons.more_vert),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...videos.map((video) => videoListTile(context, video)),
      ].separateCenter(Dimensions.small),
    );
  }
}
