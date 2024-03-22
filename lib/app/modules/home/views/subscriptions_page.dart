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
      return _PostWidget(post: post);
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
                        (sub) => _SubscriptionIcon(sub),
                      )
                      .toList())
                  .separateCenter(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.small),
          child: noSplashInkWell(
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
}

class _SubscriptionIcon extends StatelessWidget {
  const _SubscriptionIcon(this.subscription);
  final SubscriptionModel subscription;

  @override
  Widget build(BuildContext context) {
    return noSplashInkWell(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            child: Image.asset(subscription.iconChannel),
            radius: ImageSize.subscriptionBar,
          ),
          gapF(0.25),
          SizedBox(
            width: ImageSize.subscriptionBar * 2 + 8,
            child: Text(
              subscription.nameChannel,
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

class _PostWidget extends StatelessWidget {
  const _PostWidget({
    required this.post,
  });
  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: Image.asset(post.iconChannel),
          title: Text(
            post.nameChannel,
            style: context.textTheme.bodyLarge,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          contentPadding: EdgeInsets.zero,
          subtitle: Text(post.getTimeAgo(), style: context.textTheme.bodySmall),
          trailing: IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () => Get.bottomSheet(SizedBox()),
          ),
        ),
        gapS(),
        ReadMoreText(
          post.content,
          trimLines: 2,
          trimMode: TrimMode.Line,
          colorClickableText: context.theme.primaryColor,
          trimCollapsedText: 'Show more',
          trimExpandedText: 'Show less',
          style: context.textTheme.bodyMedium,
        ),
        gapS(),
        Image.asset(post.imageUrl),
        gapS(),
        Padding(
          padding: const EdgeInsets.all(Dimensions.small),
          child: Row(
            children: [
              _ActionButton(
                icon: Icon(Icons.thumb_up_outlined),
                number: post.like,
              ),
              gapL(),
              _ActionButton(
                icon: Icon(Icons.thumb_down_outlined),
                number: post.dislike,
              ),
              Spacer(),
              _ActionButton(
                icon: Icon(Icons.mode_comment_outlined),
                number: post.getTotalComments(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({required this.number, required this.icon});
  final int number;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(icon: icon, onPressed: () {}),
        GestureDetector(
          behavior: HitTestBehavior.opaque, // for onTap work on padding
          child: Container(
            margin: const EdgeInsets.only(left: 5),
            child: Text(
              number == 0 ? '' : '$number',
              style: context.textTheme.bodyMedium,
            ),
          ),
          onTap: () {},
        ),
      ],
    );
  }
}
