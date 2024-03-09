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
                children: (controller.posts.toList().map((post) {
                  return SubscriptionWidget(subcription: post);
                }).toList())
                    .separateCenter(),
              ),
            ),
    );
  }
}

class SubscriptionWidget extends StatelessWidget {
  const SubscriptionWidget({super.key, required this.subcription});

  final Subscription subcription;

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
