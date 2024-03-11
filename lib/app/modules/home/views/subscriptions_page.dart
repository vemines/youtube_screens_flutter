part of "home_view.dart";

class SubscriptionsPage extends StatefulWidget {
  const SubscriptionsPage({super.key});

  @override
  State<SubscriptionsPage> createState() => _SubscriptionsPageState();
}

class _SubscriptionsPageState extends State<SubscriptionsPage> {
  final HomeController controller = Get.find<HomeController>();
  @override
  void initState() {
    super.initState();
    controller.loadPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.posts.toList().isEmpty
          ? centerIndicator()
          : NoScrollBarWidget(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _SubscriptionsBar(),
                  ...(controller.posts.toList().map((post) {
                    return _SubscriptionWidget(subcription: post);
                  }).toList())
                ].separateCenter(),
              ),
            ),
    );
  }
}

class _SubscriptionWidget extends StatelessWidget {
  const _SubscriptionWidget({required this.subcription});

  final Subscriptions subcription;

  @override
  Widget build(BuildContext context) {
    if (subcription is VideoModel) {
      var video = subcription as VideoModel;
      return VideoWidget(video: video);
    }

    if (subcription is PostModel) {
      var post = subcription as PostModel;
      return PostWidget(post: post);
    }
    return SizedBox();
  }
}

class _SubscriptionsBar extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 12,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: (controller.subscriptions
                      .toList()
                      .map(
                        (sub) => _subscriptionIcon(context, sub),
                      )
                      .toList())
                  .separateCenter(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.small),
          child: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {},
            child: Text(
              "All",
              style: context.textTheme.bodyLarge!.copyWith(
                color: context.theme.primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _subscriptionIcon(BuildContext context, SubscriptionModel sub) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            child: Image.asset(sub.iconChannel),
            radius: ImageSize.subscriptionBar,
          ),
          gapF(0.25),
          SizedBox(
            width: ImageSize.subscriptionBar * 2 + 8,
            child: Text(
              sub.nameChannel,
              style: context.textTheme.labelSmall,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
