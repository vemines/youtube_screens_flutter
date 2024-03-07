part of "home_view.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = Get.find<HomeController>();
  @override
  void initState() {
    super.initState();
    controller.loadHomeVideo();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.homeVideos.toList().isEmpty
          ? centerIndicator()
          : NoScrollBarWidget(
              child: Column(
                children: controller.homeVideos
                    .toList()
                    .map((video) => VideoWidget(
                          iconChannel: video.iconChannel,
                          title: video.title,
                          subtitle: video.getSubTitle(),
                          videoThumb: video.videoThumb,
                        ))
                    .toList(),
              ),
            ),
    );
  }
}
