import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../gen/assets.gen.dart';
import '../../../shared/constants/dimens.dart';
import '../../../shared/extensions/widget_extension.dart';
import '../../../shared/widgets/common.dart';
import '../../../shared/widgets/bottom_nav.dart';
import '../controllers/channel_controller.dart';

class ChannelView extends StatefulWidget {
  const ChannelView({super.key});

  @override
  State<ChannelView> createState() => _ChannelViewState();
}

class _ChannelViewState extends State<ChannelView> with SingleTickerProviderStateMixin {
  final ChannelController controller = Get.find<ChannelController>();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              // The flexible app bar with the tabs
              SliverAppBar(
                automaticallyImplyLeading: false,
                leading: IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(Icons.arrow_back),
                ),
                title: Text("My Channel"),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search),
                  ),
                  gapN(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.more_vert),
                  ),
                ],
                expandedHeight: 300,
                pinned: true,
                forceElevated: innerBoxIsScrolled,
                flexibleSpace: FlexibleSpaceBar(
                  background: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: AppBar().preferredSize.height),
                      child: _AccountWidget(),
                    ),
                  ),
                ),
                bottom: TabBar(
                  labelColor: colorScheme.onPrimary,
                  controller: _tabController,
                  indicatorColor: colorScheme.onPrimary,
                  unselectedLabelColor: context.theme.disabledColor,
                  isScrollable: true,
                  tabAlignment: TabAlignment.start, // Or TabAlignment.start for left alignment
                  tabs: [
                    Tab(child: Text("Home", style: context.textTheme.bodyLarge)),
                    Tab(child: Text("Playlist", style: context.textTheme.bodyLarge)),
                  ],
                ),
              )
            ],
            // The content of each tab
            body: TabBarView(
              controller: _tabController,
              children: [
                _HomeTab(),
                _PlayListTab(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavibarNoSelected(),
      ),
    );
  }
}

class _HomeTab extends GetView<ChannelController> {
  const _HomeTab();

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.context!.textTheme;
    final disableColor = Get.context!.theme.disabledColor;
    return ListView.builder(
      padding: EdgeInsets.all(Dimensions.small),
      itemCount: controller.playlists.length + controller.subscriptions.length + 1,
      itemBuilder: (context, index) {
        if (index < controller.playlists.length)
          return _PlayListAndChannelWidget(
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
        return _PlayListAndChannelWidget(
          title: controller.subscriptions[subcribeIndex].nameChannel,
          subtitle: controller.subscriptions[subcribeIndex].tagChannel,
          lineThree: noSplashInkWell(
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
    );
  }
}

class _PlayListTab extends GetView<ChannelController> {
  const _PlayListTab();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(Dimensions.small),
      physics: NeverScrollableScrollPhysics(),
      itemCount: controller.playlists.length,
      itemBuilder: (context, index) {
        return _PlayListAndChannelWidget(
          title: controller.playlists[index].nameChannel,
          subtitle: controller.playlists[index].getStatusMyChannel(),
          lineThree: Text(controller.playlists[index].getLastestUpdate()),
          imageUrl: controller.playlists[index].thumb,
          lengthPlaylist: controller.playlists[index].getPlaylistLength(),
        );
      },
    );
  }
}

class _PlayListAndChannelWidget extends StatelessWidget {
  const _PlayListAndChannelWidget({
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
    return noSplashInkWell(
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
            noSplashInkWell(
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

class _AccountWidget extends StatelessWidget {
  const _AccountWidget();

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
