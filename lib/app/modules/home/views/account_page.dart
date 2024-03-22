part of "home_view.dart";

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final HomeController controller = Get.find<HomeController>();
  @override
  void initState() {
    super.initState();
    controller.loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    return NoScrollBarWidget(
      child: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _AccountListTile(),
            _RowActionChip(),
            controller.isloadUserData.value ? _WatchHistorySection() : centerIndicator(),
            controller.isloadUserData.value ? _PlaylistSection() : SizedBox(),
            controller.isloadUserData.value ? _UtilsListTile() : SizedBox(),
          ].separateCenter(),
        ),
      ),
    );
  }
}

class _UtilsListTile extends StatelessWidget {
  const _UtilsListTile();

  @override
  Widget build(BuildContext context) {
    final utilTextStyle = context.textTheme.bodyLarge;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: Icon(Icons.slideshow_outlined),
          title: Text("Time watched", style: utilTextStyle),
          onTap: () => Get.toNamed(Routes.timeWatched),
        ),
        ListTile(
          leading: Icon(Icons.file_download_outlined),
          title: Text("Downloads", style: utilTextStyle),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.movie_creation_outlined),
          title: Text("Your movies", style: utilTextStyle),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.smart_display_outlined),
          title: Text("Get Youtube Premium", style: utilTextStyle),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.insert_chart_outlined_outlined),
          title: Text("Time watched", style: utilTextStyle),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.help_outline),
          title: Text("Helps and feedback", style: utilTextStyle),
          onTap: () {},
        ),
      ].separateAll(),
    );
  }
}

class _PlaylistSection extends GetView<HomeController> {
  const _PlaylistSection();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    return Padding(
      padding: const EdgeInsets.only(left: Dimensions.normal),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Playlists",
                style: textTheme.titleLarge,
              ),
              OutlinedButton(
                onPressed: () {},
                child: Text(
                  "View all",
                  style: textTheme.labelMedium,
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    width: 0.5,
                    color: context.theme.colorScheme.onPrimary.withAlpha(0.5.opacityToAlpha()),
                  ),
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ...controller.playlists.map(
                  (playlist) => _PlaylistWidget(playlist),
                ),
              ].separateCenter(),
            ),
          ),
        ].separateCenter(),
      ),
    );
  }
}

class _PlaylistWidget extends StatelessWidget {
  const _PlaylistWidget(this.playlist);
  final PlaylistModel playlist;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 160,
            child: Stack(
              children: [
                Container(
                  width: 160,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(RadiusBorder.video),
                    image: DecorationImage(
                      image: Image.asset(playlist.thumb).image,
                      colorFilter: playlist.watchLater
                          ? ColorFilter.mode(
                              Colors.black.withOpacity(0.5),
                              BlendMode.darken,
                            )
                          : null,
                    ),
                  ),
                ),
                playlist.watchLater
                    ? Positioned.fill(
                        child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.watch_later_outlined),
                            gapS(),
                            Text(
                              playlist.getPlaylistLength(),
                            )
                          ],
                        ),
                      ))
                    : Positioned(
                        bottom: 10,
                        right: 10,
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
                              Text(playlist.getPlaylistLength()),
                            ],
                          ),
                        ),
                      ),
              ],
            ),
          ),
          gapS(),
          SizedBox(
            width: 160,
            child: ListTile(
              title: Text(
                playlist.namePlaylist,
                style: context.textTheme.bodyMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              contentPadding: EdgeInsets.zero,
              subtitle: Text(
                playlist.nameChannel,
                style: context.textTheme.bodySmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () => Get.bottomSheet(SizedBox()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WatchHistorySection extends GetView<HomeController> {
  const _WatchHistorySection();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    return Padding(
      padding: const EdgeInsets.only(left: Dimensions.normal),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "History",
                style: textTheme.titleLarge,
              ),
              OutlinedButton(
                onPressed: () {},
                child: Text(
                  "View all",
                  style: textTheme.labelMedium,
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    width: 0.5,
                    color: context.theme.colorScheme.onPrimary.withAlpha(0.5.opacityToAlpha()),
                  ),
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ...controller.watchHistory.map(
                  (video) => _WatchHistoryWidget(video),
                ),
              ].separateCenter(),
            ),
          ),
        ].separateCenter(),
      ),
    );
  }
}

class _WatchHistoryWidget extends StatelessWidget {
  const _WatchHistoryWidget(this.video);
  final VideoModel video;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 160,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(RadiusBorder.video),
                child: Image.asset(video.thumb),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  color: context.theme.colorScheme.background,
                  padding: EdgeInsets.all(Dimensions.small),
                  child: Text(video.getTimeStamp()),
                ),
              ),
            ],
          ),
        ),
        gapS(),
        SizedBox(
          width: 160,
          child: ListTile(
            title: Text(
              video.title,
              style: context.textTheme.bodyMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            contentPadding: EdgeInsets.zero,
            subtitle: Text(
              video.nameChannel,
              style: context.textTheme.bodySmall,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () => Get.bottomSheet(SizedBox()),
            ),
          ),
        ),
      ],
    );
  }
}

class _RowActionChip extends StatelessWidget {
  const _RowActionChip();

  @override
  Widget build(BuildContext context) {
    final chipAvatarColor = context.theme.colorScheme.onPrimary;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ActionChip(
            label: Text("Switch account"),
            avatar: Icon(
              Icons.switch_account_outlined,
              color: chipAvatarColor,
            ),
            onPressed: () {},
          ),
          ActionChip(
            label: Text(
              "Google account",
            ),
            avatar: Assets.svg.google.svg(
              colorFilter: ColorFilter.mode(
                chipAvatarColor,
                BlendMode.srcIn,
              ),
            ),
            onPressed: () {},
          ),
          ActionChip(
            label: Text("Turn on incognito"),
            avatar: Icon(
              Icons.account_circle_outlined,
              color: chipAvatarColor,
            ),
            onPressed: () {},
          ),
        ].separateAll(),
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
      child: Row(
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
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("@Vemines1234 - ", style: textTheme.bodyMedium),
                  Text("View Channel >", style: textTheme.bodySmall)
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
