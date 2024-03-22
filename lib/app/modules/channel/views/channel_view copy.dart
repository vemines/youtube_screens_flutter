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

class _ChannelViewState extends State<ChannelView> with TickerProviderStateMixin {
  final ChannelController controller = Get.find<ChannelController>();
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: CustomScrollView(
          scrollBehavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          slivers: [
            _AppBarWidget(),
            _AccountWidget(),
            _PinnedTabbarWidget(tabController: tabController),
            _TabViewWidget(tabController: tabController),
          ],
        ),
        bottomNavigationBar: BottomNavibarNoSelected(),
      ),
    );
  }
}

class _TabViewWidget extends StatelessWidget {
  const _TabViewWidget({required this.tabController});

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: TabBarView(
        controller: tabController,
        children: [
          _HomeTab(),
          _PlayListTab(),
        ],
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

class _PinnedTabbarWidget extends StatelessWidget {
  const _PinnedTabbarWidget({
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: _PinnedHeaderDelegate(tabController),
      pinned: true,
    );
  }
}

class _AppBarWidget extends StatelessWidget {
  const _AppBarWidget();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
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
          icon: Icon(Icons.more_vert),
          onPressed: () {},
        ),
      ],
      pinned: true,
      floating: false,
    );
  }
}

class _PinnedHeaderDelegate extends SliverPersistentHeaderDelegate {
  _PinnedHeaderDelegate(this.tabController);
  final TabController tabController;
  double height = 48;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final colorScheme = context.theme.colorScheme;
    return Container(
      color: colorScheme.background,
      height: height,
      child: TabBar(
        labelColor: colorScheme.onPrimary,
        controller: tabController,
        indicatorColor: colorScheme.onPrimary,
        unselectedLabelColor: context.theme.disabledColor,
        isScrollable: true,
        tabAlignment: TabAlignment.start, // Or TabAlignment.start for left alignment
        tabs: [
          Tab(child: Text("Home", style: context.textTheme.bodyLarge)),
          Tab(child: Text("Playlist", style: context.textTheme.bodyLarge)),
        ],
      ),
    );
  }

  @override
  double get maxExtent => height; // Height of the pinned widget

  @override
  double get minExtent => height; // Height of the pinned widget

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
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
    return SliverToBoxAdapter(
      child: GestureDetector(
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
      ),
    );
  }
}