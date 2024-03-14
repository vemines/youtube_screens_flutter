import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_screens/app/shared/widgets/common.dart';
import '../../../../gen/assets.gen.dart';
import '../../../shared/constants/dimens.dart';
import '../../../shared/extensions/widget_extension.dart';
import '../controllers/my_channel_controller.dart';

class MyChannelView extends StatefulWidget {
  const MyChannelView({super.key});

  @override
  State<MyChannelView> createState() => _MyChannelViewState();
}

class _MyChannelViewState extends State<MyChannelView> {
  final MyChannelController controller = Get.find<MyChannelController>();

  @override
  Widget build(BuildContext context) {
    final onPrimary = context.theme.colorScheme.onPrimary;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("MyChannel"),
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
      body: DefaultTabController(
        length: 2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _AccountListTile(), // Assuming this builds your account list tile
            TabBar(
              labelColor: onPrimary,
              indicatorColor: onPrimary,
              unselectedLabelColor: context.theme.disabledColor,
              isScrollable: true,
              tabAlignment: TabAlignment.start, // Or TabAlignment.start for left alignment
              tabs: [
                Tab(child: Text("Home", style: context.textTheme.bodyLarge)),
                Tab(child: Text("Playlist", style: context.textTheme.bodyLarge)),
              ],
            ),
            _tabBarView(),
          ],
        ),
      ),
    );
  }

  Widget _tabBarView() {
    final textTheme = Get.context!.textTheme;
    final disableColor = Get.context!.theme.disabledColor;
    return Obx(() => Flexible(
          child: TabBarView(
            children: [
              ListView.builder(
                padding: EdgeInsets.all(Dimensions.small),
                itemCount: controller.playlists.length + controller.subscriptions.length + 1,
                itemBuilder: (context, index) {
                  if (index < controller.playlists.length)
                    return _CustomListTileWidget(
                      title: controller.playlists[index].nameChannel,
                      subtitle: controller.playlists[index].getStatusMyChannel(),
                      lineThree: Text(controller.playlists[index].getLastestUpdate()),
                      imageUrl: controller.playlists[index].thumb,
                      lengthPlaylist: controller.playlists[index].getPlaylistLength(),
                    );
                  if (index == controller.playlists.length)
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: Dimensions.normal),
                      child: divider(),
                    );
                  int subcribeIndex = index - controller.playlists.length - 1;
                  return _CustomListTileWidget(
                    title: controller.subscriptions[subcribeIndex].nameChannel,
                    subtitle: controller.subscriptions[subcribeIndex].tagChannel,
                    lineThree: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(top: Dimensions.small),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "SUBSCRIBED",
                              style: textTheme.bodyLarge!.copyWith(color: disableColor),
                            ),
                            gapS(),
                            Icon(
                              Icons.notifications_outlined,
                              color: disableColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    imageUrl: controller.subscriptions[subcribeIndex].iconChannel,
                  );
                },
              ),
              ListView.builder(
                padding: EdgeInsets.all(Dimensions.small),
                itemCount: controller.playlists.length,
                itemBuilder: (context, index) {
                  return _CustomListTileWidget(
                    title: controller.playlists[index].nameChannel,
                    subtitle: controller.playlists[index].getStatusMyChannel(),
                    lineThree: Text(controller.playlists[index].getLastestUpdate()),
                    imageUrl: controller.playlists[index].thumb,
                    lengthPlaylist: controller.playlists[index].getPlaylistLength(),
                  );
                },
              ),
            ],
          ),
        ));
  }
}

class _CustomListTileWidget extends StatelessWidget {
  const _CustomListTileWidget({
    required this.title,
    required this.subtitle,
    required this.lineThree,
    required this.imageUrl,
    this.lengthPlaylist,
  });
  final String title;
  final String subtitle;
  final Widget lineThree;
  final String imageUrl;
  final String? lengthPlaylist;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Dimensions.small),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: ImageSize.myChannelImageWidth,
              height: ImageSize.myChannelImageHeight,
              child: Stack(
                children: [
                  Center(child: Image.asset(imageUrl)),
                  if (lengthPlaylist != null)
                    Positioned(
                      bottom: Dimensions.small,
                      right: Dimensions.normal,
                      child: Container(
                        color: context.theme.colorScheme.background,
                        padding: EdgeInsets.all(Dimensions.small),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.playlist_play_outlined,
                              size: IconSize.playlistLength,
                            ),
                            gapF(0.2),
                            Text(lengthPlaylist.toString()),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
            gapN(),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: context.textTheme.bodyLarge),
                  Text(subtitle, style: context.textTheme.bodySmall),
                  lineThree,
                ],
              ),
            ),
            gapS(),
            InkWell(
              onTap: () {},
              child: Icon(
                Icons.more_vert_outlined,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AccountListTile extends StatelessWidget {
  const _AccountListTile();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = context.textTheme;
    return GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              gapN(),
              CircleAvatar(
                radius: ImageSize.avatarAccountPage,
                child: Assets.png.coffee.image(),
              ),
              gapN(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  gapN(),
                  Text("VeMines", style: textTheme.headlineMedium),
                  Text("@Vemines1234 - ", style: textTheme.bodyMedium),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: Dimensions.normal),
            child: Text("More about this channel >", style: textTheme.bodySmall),
          ),
          Row(
            children: [
              gapN(),
              Flexible(
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: FilledButton(
                    onPressed: () {},
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.grey.shade600.withOpacity(0.5),
                      elevation: 5,
                      padding: EdgeInsets.symmetric(
                        vertical: Dimensions.normal,
                      ),
                    ),
                    child: Text(
                      "Manage Video",
                      style: context.textTheme.bodyLarge,
                    ),
                  ),
                ),
              ),
              gapS(),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.bar_chart_outlined,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.edit_outlined),
              ),
              gapN(),
            ],
          )
        ].separateCenter(),
      ),
    );
  }
}
